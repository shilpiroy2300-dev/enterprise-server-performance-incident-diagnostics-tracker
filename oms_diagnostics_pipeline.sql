-- ====================================================================
-- PROJECT 2: Enterprise Server Performance & Incident Diagnostics Tracker
-- SCRIPT: Data Extraction, Transformation, and Ingestion Pipeline (OMS)
-- DESCRIPTION: Cleans raw system event logs, computes profit metrics,
--              and prepares fact/dimension tables for Power BI.
-- ====================================================================

-- STAGE 1: Clean and Aggregate Raw Log Transactions
WITH CleanedLogs AS (
    SELECT 
        order_id,
        customer_id,
        product_id,
        order_creation_date,
        -- Standardize text casing to fix data entry discrepancies
        UPPER(TRIM(provisioning_status)) AS provisioning_status,
        UPPER(TRIM(sla_breach_risk)) AS sla_breach_risk,
        -- Coalesce sales metrics to ensure no null data entries pass to BI layer
        COALESCE(sales_amount, 0) AS gross_sales,
        COALESCE(order_profit, 0) AS net_profit,
        -- Window function to tag duplicate server entries and keep the latest log record
        ROW_NUMBER() OVER (
            PARTITION BY order_id 
            ORDER BY log_timestamp DESC
        ) as row_num
    FROM stage_raw_system_logs
    WHERE order_creation_date IS NOT NULL
)

-- STAGE 2: Build the Core Fact Table Pipeline for Ingestion
SELECT 
    order_id AS Order_Id,
    customer_id AS Customer_Id,
    product_id AS Product_Card_Id,
    CAST(order_creation_date AS DATE) AS Order_Creation_Date,
    
    -- Field Mapping Alignment
    CASE 
        WHEN provisioning_status = 'SHIPPING CANCELED' THEN 'Shipping canceled'
        WHEN provisioning_status = 'LATE DELIVERY' THEN 'Late delivery'
        ELSE 'On time'
    END AS Provisioning_Status,
    
    CASE 
        WHEN sla_breach_risk = 'HIGH' THEN 'High'
        WHEN sla_breach_risk = 'MEDIUM' THEN 'Medium'
        ELSE 'Low'
    END AS SLA_Breach_Risk,
    
    -- Financial Aggregations
    gross_sales AS Sales,
    net_profit AS [Order Profit Per Order],
    
    -- Calculated Metrics
    (gross_sales - net_profit) AS Operational_Cost_Leakage
FROM CleanedLogs
WHERE row_num = 1; -- Filter out duplicate server log spikes


-- STAGE 3: Validate and Profile Dimension Tables
-- Validate customer geography profiles, filtering out numeric anomalies (zip code bugs)
SELECT 
    customer_id AS Customer_Id,
    UPPER(TRIM(customer_fname)) AS Customer_Fname,
    UPPER(TRIM(customer_lname)) AS Customer_Lname,
    TRIM(customer_state) AS [Customer State],
    UPPER(TRIM(account_tier)) AS Account_Tier
FROM stage_customer_dim
WHERE customer_state NOT LIKE '%[0-9]%'; -- Removes dirty numeric state rows
