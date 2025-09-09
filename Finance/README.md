Loan Portfolio Risk & Valuation Project 📊

Overview
Estimated credit risk and present value (PV) of expected cash flows for a portfolio of loans by combining loan-level probability of default (PD), loss given default (LGD), and cash flow schedules. The project evaluates expected portfolio performance under multiple discount rate scenarios, providing insights into credit risk and sensitivity.

Dataset

summary.csv – Loan-level data: LoanID, Principal, PD_Annual, LGD

LoanPortfolio.xlsx – Monthly amortization schedule: LoanID, Month, Cash Flow

Key Steps

Convert Annual to Monthly PD – Transformed annual PDs to monthly probabilities for accurate cash flow modeling.

Merge Loan Risk with Schedule – Combined each loan’s PD and LGD with its cash flow schedule.

Expected Cash Flow & Discounted PV – Calculated discounted cash flows under three scenarios:

Low rate: 3% annually

Base rate: 5% annually

High rate: 8% annually

Portfolio Aggregation – Aggregated monthly expected cash flows and computed total PVs for each rate.

Sensitivity Analysis – Measured change in portfolio PV under low and high rates compared to the base scenario.

Expected Loss Calculation – Computed expected credit loss = Cash Flow × PD × LGD, with optional discounting.

Tools & Methods

Python / Excel: Data processing, aggregation, and visualization

Discounted cash flow and risk formulas applied at loan and portfolio levels

Sensitivity analysis for rate changes and risk exposure

Outputs

portfolio_expected_cashflow.csv – Portfolio-level monthly expected cash flows and discount factors

Console outputs: Portfolio PV under low, base, high rates; sensitivity; total expected loss

Visualizations in Excel or Python charts for trend analysis and interpretation

Key Insights

Quantifies economic value and risk of a loan portfolio under varying discount rates

Incorporates credit risk through PD and LGD metrics

Produces actionable outputs: expected cash flows, expected losses, and sensitivity metrics

Conclusion
This project demonstrates quantitative credit risk modeling and portfolio valuation techniques. It provides a transparent, data-driven approach to understanding the financial impact of loans, discount rate sensitivity, and expected losses — skills directly applicable to Treasury operations and risk management.
