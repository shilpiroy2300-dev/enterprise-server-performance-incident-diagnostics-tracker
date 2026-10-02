# Enterprise Server Performance & Incident Diagnostics Tracker

A cross-functional, 3-page advanced log analytics and business intelligence architecture integrated with custom Python statistical scripts to ingest, monitor, and diagnose operational infrastructure pipelines, transaction latency bottlenecks, and financial risk profiles.

## 🔍 Problem Statement

Enterprise server infrastructure and fulfillment pipelines often encounter invisible operational friction. When transaction pipelines drop or encounter system anomalies, incident response teams struggle to tie raw infrastructure error logs directly to revenue leakage. 

Without an integrated view, organizations cannot easily determine which product lines cause fulfillment delays, where financial risk is concentrated, or how system faults impact customer account tiers. This dashboard bridges the gap between raw order status logs and revenue exposure fields to provide a single source of truth for infrastructure monitoring and patch compliance reporting.

### Core Business Questions Answered:
* **Fulfillment Latency Crises:** *Which specific product catalogs or server configurations suffer from systemic distribution bottlenecks, and what is the mean processing delay in hours?*
* **Financial Risk Exposure Mapping:** *Where is our \$20.8M+ in exposed revenue leakage trapped across various customer account tiers and provisioning staging queues?*
* **Root-Cause Latency Analysis:** *What percentage of total transaction volume fails to clear the operational funnel, and how do database logging constraints skew the risk threshold assessment?*

---

## ⚙️ Dashboard Features & Key Performance Indicators (KPIs)

### Core Features:
* Interactive KPI cards tracking high-level pipeline health parameters.
* Granular patch month, customer region, and account tier filter panels.
* Dynamic cross-filtering and multi-dimensional navigation pathways across all visuals.
* Dark-themed enterprise dashboard design optimized for Operations Centers.

### Engineered KPIs (Centralized `_Measures` Block):
* **Total Orders / Total System Transactions:** Ingests and processes **66K+ operational system log entries** to monitor full infrastructure transaction volume.
* **True Fallout Volume / Log Error Flags Detected:** Isolates the active footprint of failed actions, tracking **59K log errors**.
* **Exposed Revenue Leakage:** Aggregates the total dollar value (**\$20.87M**) trapped inside high-risk, un-provisioned exception state queues.
* **System Fallout Rate:** Tracks the percentage performance threshold of incomplete or broken transaction steps relative to the full pipeline footprint (**89.18%**).
* **Avg Loss Per Incident:** Measures the direct mean financial penalty (**\$355.85**) of blocked or canceled actions to evaluate incident response costs.
* **Critical Cancelled Actions:** Explicitly isolates severe application drop-offs (**298 critical cancellations**).

---

## 📁 Project Components & Tech Stack

* **Business Intelligence & Reporting:** Microsoft Power BI Desktop, Power Query (ETL), Data Modeling
* **Database Management & Querying:** SQL, Data Mappings, Relational Star Schema Optimization
* **Statistical Modeling & Visualizations:** Python (`pandas`, `numpy`, `matplotlib`)
* **Interactive Artifacts Available:**
  * **Power BI Workbook:** Due to GitHub's file size limitations, you can download the full interactive `.pbix` workbook here: **[Download Interactive .pbix File](https://drive.google.com/file/d/1zY8v63b9bAM6yOyQo-mccHw1awugGq4y/view?usp=sharing)**
  * **Dataset (CSV):** Due to GitHub's file size limitations, the raw data file (91 MB) is hosted externally. You can download the source dataset here: **[Download Raw CSV Dataset (Google Drive)]([https://google.com](https://drive.google.com/file/d/1UMWkw_qXSKuddBR-R9a2P2Br74v_m6hH/view?usp=sharing))**
* **Python Visual Scripts:** Contained directly within the Power BI layer to execute advanced data frame processing (`pandas`), statistical distributions (`numpy`), and advanced scatter matrix plotting (`matplotlib`).

---

## 📐 Data Architecture (Star Schema Model)

The data model utilizes a highly interconnected, optimized **Star Schema Framework** centered around a transactional core. This eliminates redundant paths and maximizes filter propagation pathways across the report layer:

* `Fact_Order_Pipeline`: The central transactional core tracking sales performance, margins, active orders, and multi-year timestamps (`Activation_Date`, `Order_Creation_Date`).
* `Dim_Customer`: Houses customer demographic dimensions (`Customer City`, `Customer State`, `Customer Country`) and strategic business classifications (`Account_Tier`).
* `Dim_Products`: Contains detailed product catalog metadata including exact pricing parameters (`Catalog_Category`, `Product Card Id`, `Product Price`, `Service_Product_Type`).
* `Dim_Status_Logs`: Tracks granular operational logical categories, platform tracking states, error boundaries (`System_Err_Code`), provisioning tags, and historical risk status metrics (`SLA_Breach_Risk`).

```text
       [Dim_Customer] 1 ────────── *
                                    │
       [Dim_Products] 1 ────────── * ──> [Fact_Order_Pipeline] <─── [Measures]
                                    │
    [Dim_Status_Logs] 1 ────────── *
```

---

## 🎨 Core Visualizations & Analytics Layout

### Page 1: OMS Fulfillment & Fallout Analytics
1. **Fulfillment Funnel Volume by Category:** Visualizes order dropping mechanics by catalog category to highlight initial pipeline friction.
2. **Monthly Provisioning Trend Line:** Tracks macro-level order clearing velocities over multi-year timelines.
3. **Master Fallout Core Matrix Grid:** A dense multi-dimensional matrix cross-tabulating `Provisioning_Status` against product groups, mapping total orders explicitly against active financial leakage fields.

### Page 2: OMS System Log Diagnostics & Error Root-Cause
1. **System Error Code Distribution:** Isolates systemic log exceptions (such as `ERR_PROVISIONING_SLA_BREACH` and `ERR_NONE`) to quantify architectural stability issues.
2. **Incident Velocity & SLA Breach Trends:** A dual-axis time-series visualization tracking real-time fault frequency and SLA breach patterns.
3. **Exposed Revenue Leakage by Account Tier:** A high-impact categorical chart identifying financial exposure across Consumer, Corporate, and Home Office business lines.
4. **Profit Margins vs. System Log Status Matrix:** A comprehensive native grid tracking active pipeline exception errors.

### Page 3: Product Supply Chain SLAs & Market Logistics (Python Suite)
1. **Fulfillment Latency Bar Chart (Python Visual):** Custom script plotting mean processing delays, highlighting severe latency hotspots in *Cleats* (55.8 hours), *Shop By Sport* (47.4 hours), and *Electronics* (44.1 hours).
2. **Top 5 Revenue Generating Markets (Python Visual):** Highlight-coded column chart plotting market sales volume in Millions (\$M) across dominant regional territories (PA, CA, NY, TX, IL).
3. **Transaction Profitability Scatter Matrix (Python Visual):** Jittered cluster map visualizing net margins vs. SLA risk portfolios, clustering thousands of discrete net margin entries against categorical SLA Risk Profiles and Gross Sales values.

---

## 🧠 Advanced Technical Concepts Applied

### DAX Concepts Used:
* **Filter Context Manipulation & Evaluation:** `CALCULATE()`
* **Row-Count Aggregations:** `COUNTROWS()`
* **Safe Mathematical Operations:** `DIVIDE()`
* **Iterator Calculations:** `AVERAGEX()`
* **Conditional Logic Blocks:** `SWITCH(TRUE(), ...)`

### Embedded Python Architecture:
By integrating a local Python environment directly inside the BI reporting layer, the dashboard handles complex coordinate layouts and statistical mapping using custom script engines:
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Dataset automatically bound from model fields by Power BI
# Fields used: ['Catalog_Category', 'Mean Fulfillment Latency', 'Net Profit', 'SLA_Breach_Risk']

# Processing Bottleneck Visual Engine
df_sorted = dataset.sort_values(by='Mean Fulfillment Latency', ascending=False)
plt.barh(df_sorted['Catalog_Category'], df_sorted['Mean Fulfillment Latency'], color='#00a4e4')
plt.xlabel('Mean Fulfillment Latency (Hours)')
```

---

## 💡 Business Questions Answered & Insights Delivered

* **Time Bottleneck Isolation:** Discovered that specific high-volume product catalogs (such as *Cleats* and *Electronics*) experienced systemic delays, averaging over **44 to 55+ hours of fulfillment latency**.
* **Financial Risk Stratification:** Mapped transaction-level profit distributions directly against system logic fault codes to identify **\$20.8M+ in exposed revenue leakage** trapped in staging queues, proving that the *Consumer* account tier represents over 50% of total financial exposure.
* **Database Logging Constraints:** Uncovered key structural distribution imbalances where **95%+ of transactional records** defaulted to low-risk categories, prompting a threshold reassessment, alongside a high historical baseline **89.18% System Fallout Rate**.

---

## 🌳 Project Structure

```text
Enterprise-Server-Performance-Incident-Diagnostics-Tracker
│
├── Images/
│   ├── page1_preview.png
│   ├── page2_preview.png
│   └── page3_preview.png
├── .gitattributes
├── Enterprise_Server_Performance_Incident_Diagnostics_Tracker.pbix
└── README.md
```

---

