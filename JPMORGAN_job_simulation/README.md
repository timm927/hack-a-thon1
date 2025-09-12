📊 Quantitative Analysis and Risk Modeling Project
🌍 Overview

This project applies data analysis, predictive modeling, and risk quantification to real-world financial challenges in commodity trading and retail banking.
Developed as part of the J.P. Morgan Quantitative Finance Virtual Internship (Forage).

🔑 Core Areas:

     📈 Natural Gas Price Analysis – forecasting & seasonal trends

     💰 Storage Contract Pricing – prototype valuation model

     🏦 Credit Risk Modeling – default prediction & expected loss

     📉 FICO Score Bucketing – optimized segmentation for mortgage risk

      Tech Stack: Python, pandas, numpy, scikit-learn, matplotlib

📈 Task 1: Natural Gas Price Analysis

    Analyzed monthly natural gas prices (Oct 2020 – Sep 2024)

    Detected seasonal price trends and interpolated missing values

    Extrapolated prices 1 year ahead

    Built a reusable Python function returning estimated prices for any date

    Tools: pandas, numpy, matplotlib, scipy

💰 Task 2: Storage Contract Pricing Model

    Designed a prototype valuation model for natural gas storage contracts

    Captured cash flows from injection, withdrawal, and storage costs

    Tested scenarios with different volumes, rates, and cost assumptions

Formula:        
Value=(Sell Price−Buy Price)×Volume−Costs

    Tools: Python, pandas, numpy

🏦 Task 3: Credit Risk Analysis for Retail Loans

    Built a Probability of Default (PD) model using logistic regression & tree-based methods

    Computed Expected Loss (EL):
     EL=PD×Exposure×(1−Recovery Rate)

    Assumed 10% recovery rate

    Created a function to estimate expected loss for borrower profiles

    Tools: scikit-learn, pandas, numpy, matplotlib

📉 Task 4: FICO Score Bucketing for Mortgage Risk

    Converted continuous FICO scores (300–850) into optimized buckets

    Applied log-likelihood optimization to separate risk levels

    Visualized default rates per FICO bucket for clear risk stratification

    Tools: numpy, pandas, dynamic programming

📦 Deliverables

✅ Python scripts / Jupyter notebooks for each task
✅ Functions for price estimation, contract valuation, credit risk, and FICO bucketing
✅ Visualizations: gas price trends, credit default rates, FICO buckets

💡 Key Insights

   Seasonal gas price patterns reveal profitable storage opportunities

   Storage/transaction costs are critical in contract pricing

   Predictive models improve retail loan risk forecasting

   Optimized FICO buckets enable better categorical risk modeling

⚙️ How to Use

   Clone repo & install dependencies:

    pip install pandas numpy scikit-learn matplotlib seaborn


  Run scripts:
  1️⃣ Task1_price_analysis.py → analyze & forecast gas prices
  2️⃣ Task2_contract_pricing.py → compute storage contract values
  3️⃣ Task3_credit_risk_model.py → predict expected losses
  4️⃣ Task4_fico_bucket.py → generate optimized FICO buckets

🏁 Conclusion

This project showcases how quantitative finance, predictive modeling, and optimization can drive data-driven decision-making in:

    Commodity trading

    Retail credit

    Mortgage risk

The methods are scalable and generalizable, making them highly relevant to modern financial institutions.
