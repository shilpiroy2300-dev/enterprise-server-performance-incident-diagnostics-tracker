# Enterprise Order Management System (OMS) Log Diagnostics & SLA Tracker

A cross-functional 3-page Power BI dashboard integrated with custom Python statistical scripts to ingest, monitor, and diagnose operational order processing pipelines, transaction latency bottlenecks, and financial risk profiles.

## 📊 Interactive Dashboard Previews

### Page 1: Executive Operations Pipeline Funnel
![Page 1 Preview](Images/page1_preview.png)

### Page 2: System Log & Root-Cause Exception Diagnostics
![Page 2 Preview](Images/page2_preview.png)

### Page 3: Product Supply Chain SLAs & Market Logistics (Python Suite)
![Page 3 Preview](Images/page3_preview.png)

## 📁 Project Components

* **Python Visual Scripts:** Contained directly within the Power BI layer to execute advanced data frame processing (`pandas`), statistical distributions (`numpy`), and advanced scatter matrix plotting (`matplotlib`).
* **Power BI Workbook:** Due to GitHub's file size limitations, you can download the full interactive `.pbix` workbook here: **[Download Interactive .pbix File](https://drive.google.com/file/d/12r6C5M-g4OZqT06ItmLGTtFRls6RsDk_/view?usp=sharing)**

## 🔍 Project Overview

This enterprise-level Data Analytics project leverages a multi-table star schema framework to process **66K+ operational system log entries**. 

Instead of tracking standard sales metrics, this dashboard bridges the gap between raw order status logs and revenue exposure fields. It isolates supply chain distribution blockages, calculates real-time operational latency using custom mathematical simulation engines, and maps profit margins against risk portfolios.

## 🛠️ Tech Stack

* **Business Intelligence & Reporting:** Power BI Desktop, DAX, Custom Embedded Python Containers
* **Statistical Modeling & Visualizations:** Python (`pandas`, `numpy`, `matplotlib`)
* **Database Management:** SQL, Data Mappings, Relational Star Schema Optimization

## 📐 Data Architecture (Star Schema Model)

The data model utilizes highly interconnected dimensions to optimize filter pathways across the report layer:
* `Dim_Products`: Contains detailed product catalog metadata including exact pricing parameters.
* `Dim_Status_Logs`: Tracks granular operational logical categories and SLA breach risk status metrics.
* `Dim_Customer`: Houses customer demographic dimensions and structural tracking tiers.
* `Fact_Order_Pipeline`: The central transactional core tracking sales performance, margins, and active orders.

## 💡 Business Questions Answered & Insights Delivered

* **Time Bottleneck Isolation:** Discovered that specific high-volume product catalogs (such as *Cleats* and *Electronics*) experienced systemic delays, averaging over **44+ hours of fulfillment latency**.
* **Financial Risk Stratification:** Mapped transaction-level profit distributions directly against system logic fault codes to identify **\$20.8M+ in exposed revenue leakage** trapped in staging queues.
* **Database Logging Constraints:** Uncovered key structural distribution imbalances where **95%+ of transactional records** defaulted to low-risk categories, prompting a threshold reassessment.

## 🎨 Core Visualizations Included

1. **Fulfillment Latency Bar Chart (Python):** Custom script tracking mean processing delays by catalog category.
2. **Top 5 Revenue Generating Markets (Python):** Highlight-coded column chart plotting market sales volume in Millions (\$M).
3. **Transaction Profitability Scatter Matrix (Python):** Jittered cluster map visualizing net margins vs. SLA risk portfolios.
4. **Log Diagnostic Breakdown (Native Grid):** Granular matrix table tracking active pipeline exception errors.
