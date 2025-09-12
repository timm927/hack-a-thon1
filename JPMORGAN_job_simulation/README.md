Quantitative Analysis and Risk Modeling Project
Overview

This project applies data analysis, predictive modeling, and risk quantification to real-world financial problems in commodity trading and retail banking. It was developed as part of the J.P. Morgan Quantitative Finance Virtual Internship (Forage).

The work covers:

Natural Gas Price Analysis – forecasting and seasonal trend detection

Prototype Storage Contract Pricing – valuation of natural gas storage deals

Retail Credit Risk Modeling – default prediction and expected loss estimation

FICO Score Bucketing – optimized credit score segmentation for mortgage risk

The project is implemented in Python, using pandas, numpy, scikit-learn, and matplotlib.

Task 1: Natural Gas Price Analysis

Analyzed monthly natural gas prices (Oct 2020 – Sep 2024).

Detected seasonal trends and interpolated historical values.

Extrapolated prices one year ahead.

Built a function returning estimated prices for any given date.

Tools: pandas, numpy, matplotlib, scipy

Task 2: Storage Contract Pricing Model

Designed a prototype valuation function for natural gas storage contracts.

Captured cash flows from injection, withdrawal, and storage costs.

Tested scenarios with different volumes, rates, and cost assumptions.

Formula:

Value
=
(
Sell Price
−
Buy Price
)
×
Volume
−
Costs
Value=(Sell Price−Buy Price)×Volume−Costs

Tools: Python, pandas, numpy

Task 3: Credit Risk Analysis for Retail Loans

Built a probability of default (PD) model using logistic regression and tree-based methods.

Computed Expected Loss:

EL
=
PD
×
Exposure
×
(
1
−
Recovery Rate
)
EL=PD×Exposure×(1−Recovery Rate)

Assumed recovery rate of 10%.

Developed a function to estimate expected loss for any borrower profile.

Tools: scikit-learn, pandas, numpy, matplotlib

Task 4: FICO Score Bucketing for Mortgage Risk

Mapped continuous FICO scores (300–850) into optimized categorical buckets.

Used log-likelihood optimization to separate risk levels.

Produced a risk rating map and visualized default rates by bucket.

Tools: numpy, pandas, dynamic programming

Deliverables

Python scripts / Jupyter notebooks for each task

Functions for price estimation, contract valuation, credit loss prediction, and FICO bucketing

Visualizations: seasonal gas price trends, default rates vs. FICO buckets

Key Insights

Seasonal gas price patterns inform storage contract timing and profitability.

Pricing models must adjust for transaction and storage costs to remain realistic.

Predictive models significantly improve retail loan risk forecasting.

Optimal FICO bucketing improves credit model performance while preserving risk separation.

How to Use

Clone the repository and install dependencies:

pip install pandas numpy scikit-learn matplotlib seaborn


Run scripts:

Task1_price_analysis.py – analyze and forecast gas prices

Task2_contract_pricing.py – compute storage contract values

Task3_credit_risk_model.py – predict expected losses

Task4_fico_bucket.py – generate FICO buckets

Conclusion

This project demonstrates how quantitative methods, predictive modeling, and optimization can be applied to financial risk management. The techniques are generalizable to problems in commodities, retail credit, and mortgage risk, and provide a foundation for automated decision-making in financial institutions.
