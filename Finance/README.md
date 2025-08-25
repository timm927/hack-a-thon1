1. Loan Portfolio Risk & Valuation

This project estimates credit risk and present value of expected cash flows for a portfolio of loans. It combines loan-level probability of default (PD), loss given default (LGD), and cash flow schedules to calculate expected performance under different discount rate scenarios.

2. 📂 Data Inputs
   summary.csv → Loan-level data (LoanID, Principal, PD_Annual, LGD).
   LoanPortfolio.xlsx → Amortization schedule by loan and month (LoanID, Month, Cash Flow).

3. 🔑 Key Steps
-Convert Annual to Monthly PD
-Annual PDs from summary.csv are converted to monthly probabilities.
-Merge Loan Risk with Schedule
-Each loan’s PD and LGD is combined with its cash flow schedule.
-Expected Cash Flow Calculation
Discounted Present Value (PV)
-Expected cash flows are discounted under three scenarios:
        Low rate: 3% annually
        Base rate: 5% annually
        High rate: 8% annually
Portfolio Aggregation
-Monthly expected cash flows are aggregated to portfolio level.
-Total present values are computed for each discount rate.
Sensitivity Analysis
-Change in portfolio PV under Low and High rates compared to Base.
Expected Loss Calculation
-Expected credit loss = Cash Flow × PD × LGD (with optional discounting).

4. Outputs
-portfolio_expected_cashflow.csv → Portfolio-level monthly expected cash flows and discount factors.
-Printed results in console:
   Portfolio PV under Low, Base, High discount rates
   Sensitivity of PV to discount rate changes
   Total expected loss

5. Results
-Provides a transparent way to estimate the economic value of a loan portfolio.
-Incorporates credit risk (PD, LGD) and discount rate sensitivity.
-Produces both expected cash flows and expected loss estimates for risk management and valuation purposes.

isualized in Excel or with Python charts for clear interpretation.
