📊 Actuarial Claims Analysis Project
📌 Project Overview

This project focuses on the analysis of insurance claims data using actuarial techniques. The objective is to explore claim trends, calculate claim frequency and severity, and evaluate how inflation-adjusted losses evolve over time. Pivot tables in Excel were used to summarize the data and generate insights.

📂 Dataset
-The dataset includes the following key fields:
-Year – Policy year of the claim.
-Claim ID – Unique identifier for each claim.
-Gross Tonnage (GT) – Exposure measure (used for claim frequency analysis).
-Capped Net Inflation Adjusted Incurred Claim – Claim amount adjusted for inflation, capped to exclude extreme large losses.

🔍 Key Assumptions
Commission = 0%
No adjustments for claims development patterns
Policy period runs from 1st January – 31st December each year
Large loss events are removed from severity calculations

📈 Analysis Performed
-Claim Frequency by Gross Tonnage

Claim Frequency = Number of Claims/Total Gross Tonnage
Calculated per year to understand how often claims occur relative to exposure.

-Loss Severity (Average Cost per Claim)

Loss Severity = Sum of Capped Net Inflation Adjusted Incurred Claim/Count of Claim ID
Calculated by year using pivot tables.

-Trend Analysis
Yearly changes in average claim amounts (adjusted for inflation).
Frequency and severity patterns across different exposure levels.

⚙️ Tools & Methods
Microsoft Excel – Pivot tables for aggregation, trend visualization, and calculated fields.
Formulas – To derive claim frequency, severity, and adjusted averages.

📊 Outputs
Pivot tables summarizing yearly frequency and severity.
Charts showing trend analysis (average claim costs and claim counts over time).
Tables comparing gross vs. inflation-adjusted claims.

🚀 Key Insights (Example placeholders – replace with your findings)
Claim frequency per 1,000 GT remained stable across most years.
Loss severity showed an increasing trend after adjusting for inflation.
Removal of extreme large losses provided a more realistic view of claim severity.

✅ Conclusion
This project demonstrates the use of actuarial methods in claims analysis, leveraging Excel pivot tables to calculate key metrics such as claim frequency and loss severity. The results help in understanding risk exposure, pricing adequacy, and loss trends over time.
