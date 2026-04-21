EXECUTIVE SUMMARY
Olist Brazilian E-Commerce Analytics Dashboard
Prepared by: Ravi | Dataset period: January 2016 – August 2018 | Tool: Power BI

1. Business Context
Olist is Brazil's largest online marketplace connecting small and medium-sized sellers to major e-commerce platforms such as Mercado Livre and B2W. Rather than selling products directly, Olist acts as a marketplace intermediary — sellers list their products through Olist's platform and Olist manages order logistics, customer communication, and fulfilment coordination.

This dashboard analyses 98,651 real commercial orders placed on the Olist platform between January 2016 and August 2018, across 23 Brazilian states and over 70 product categories. The dataset was publicly released by Olist on Kaggle for analytical purposes with all customer and seller identities anonymized.

The dashboard was built to answer five core business questions:

•	Is Olist's revenue growing year-over-year and which categories drive it?
•	Are orders being delivered reliably and on time?
•	Are customers satisfied and what is driving poor review scores?
•	How are customers paying and does payment behaviour affect order value?
•	What does the revenue trend look like and what can we expect in the next quarter?

2. Key Revenue Findings
R1	Revenue grew 20.02% year-over-year from 2017 to 2018
Total revenue across the 2016–2018 period reached R$13.6 million. In 2017, Olist earned R$6.2 million in product revenue. For the comparable period in 2018, this grew to R$7.4 million — a 20.02% year-over-year increase. This sustained double-digit growth indicates strong marketplace expansion and a growing seller and customer base on the platform.

R2	Health & Beauty and Watches & Gifts together account for nearly 20% of all revenue
The top two revenue categories — Health & Beauty (R$0.77M) and Watches & Gifts (R$0.71M) — collectively represent 18.1% of total platform revenue despite spanning entirely different customer needs. Both categories also maintain above-average review scores (4.1 and 4.2 respectively), suggesting that high-revenue categories on Olist tend to be those where customer satisfaction is well managed. In contrast, lower-revenue categories such as Security Services and Diapers & Hygiene carry the lowest review scores on the platform.

R3	Black Friday 2017 drove the single highest revenue spike — and the forecast projects continued growth
November 2017 was the platform's peak revenue month, driven by Black Friday demand. The month saw revenue approximately 40% above the surrounding period average. The 3-month moving average shows a clear upward trend through 2018, and the Power BI ETS forecast model projects continued growth for September–November 2018 at the 95% confidence interval. This suggests Olist's revenue trajectory is structurally positive — not solely dependent on seasonal spikes.

3. Key Operational Findings
O1	Delivery performance is strong overall but shows a significant geographic divide
93.4% of orders were delivered on time, comfortably exceeding the 80% operational target. However, this aggregate masks a sharp geographic split. States in northern Brazil — particularly Roraima (29.0 average days), Amapá (26.7 days), and Amazonas (26.0 days) — experience delivery times more than twice those of southern states such as São Paulo (8.3 days) and Rio de Janeiro (7.6 days). This disparity is driven by Brazil's logistics infrastructure, where remote northern states lack the fulfilment center proximity available in the south-east.

O2	Late delivery is the primary driver of poor customer review scores
The dashboard's scatter analysis on Page 3 reveals a clear negative correlation between delivery time and customer review score. Orders in categories with average delivery times above 20 days consistently score below 3.5 stars, while categories with delivery times under 10 days average above 4.0 stars. The 11.4% low-rating rate (scores of 1 or 2) exceeds the <10% target, and the data strongly suggests this is primarily a delivery problem rather than a product quality issue. When delivery is fast and reliable, customers are satisfied — regardless of category.

O3	Freight costs at 16.57% of revenue exceed the 15% target and correlate with lower satisfaction
Freight value represents 16.57% of product revenue on average — 4.7 percentage points above the <15% target. The Page 5 scatter analysis reveals that product categories with the highest freight-to-price ratios (such as heavy furniture and large appliances) also tend to receive below-average review scores. This dual impact — margin erosion AND customer dissatisfaction — makes freight cost reduction a high-priority operational lever. Credit cards dominate payment at 75.91% of orders, and Brazilian instalment culture means many customers spread payments across 2–6 instalments, suggesting price sensitivity that makes high freight costs particularly damaging to purchase experience.

4. Recommendations
Based on the two KPIs currently off-target (Freight Rate % at 19.7% vs <15% target, and Low Rating Rate at 11.4% vs <10% target), the following two actions are recommended:

REC
01	Establish regional fulfilment hubs in northern Brazil to reduce delivery time and freight cost
Supporting data: States RR, AP, AM average 24–28 delivery days vs 7–8 days for SP/RJ. Late rate for northern states is disproportionately high. Fast delivery = higher review scores (Page 3 scatter confirms correlation).
By positioning inventory or partner warehouses closer to northern customers, Olist can simultaneously reduce freight value per order (bringing Freight Rate % closer to the 15% target) and reduce delivery time (which drives up review scores and reduces the Low Rating Rate). The investment case is supported by the revenue data: even smaller states in the north represent growing customer bases that are currently underserved.

REC
02	Implement a seller quality program targeting the 5 lowest-rated categories
Supporting data: Security Services (2.5★), Diapers & Hygiene (3.7★), Office Furniture (3.6★), Fashion male clothing (3.7★), Fashion female clothing (3.8★) all below the 4.0 target. These categories also show higher late rates and higher freight ratios.
A seller quality programme — including minimum delivery time requirements, product description accuracy standards, and mandatory tracking updates — would directly address the root causes of poor reviews in these five categories. Olist should consider suspending sellers in these categories whose individual late rate exceeds 20%, as poor sellers damage the platform's overall satisfaction score disproportionately. Improving these 5 categories to 4.0+ would reduce the platform-wide Low Rating Rate from 11.4% to an estimated 8–9%, bringing it within the <10% target.

5. Limitations & Caveats
The following limitations should be noted when interpreting findings from this dashboard:

Limitation	Impact on Analysis	Mitigation Applied
Data covers January 2016 – August 2018 only	Revenue growth and trend findings cannot be extrapolated beyond Aug 2018. The 3-month forecast is indicative only.	Forecast clearly labelled with 95% confidence band. Findings stated as '2016–2018 period' throughout.
Product categories translated from Portuguese	Category names were automatically translated. A small number of categories may be imprecise (e.g. 'cool stuff', 'la cuisine' retained as approximate translations).	Translation file from Olist used directly. Any ambiguous categories are visible in the raw data.
No individual customer demographics	No age, gender, or income data. Customer segmentation is limited to state/city geography.	Geographic segmentation used. Behaviour proxies (instalment count, AOV) used as income proxies.
Freight Rate % target of 15% is a benchmark	The <15% target is an e-commerce industry benchmark, not an Olist-specific stated target.	Labelled clearly as 'industry benchmark target' in KPI definition document.
Review scores not mandatory	749 orders (~0.8%) have no review score. Analysis filters to reviewed orders only.	has_review flag created. All review measures use CALCULATE with has_review = 1 filter.

Prepared by:  Ravi
Role:  Data & Business Analyst | Project: Olist E-Commerce Analytics 
Tools:  Python · MS SQL Server · Power BI · DAX
Dataset:  Olist Brazilian E-Commerce (Kaggle) · Period: Jan 2016 – Aug 2018 · 100,000 orders

