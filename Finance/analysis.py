import pandas as pd

loans = pd.read_csv("summary.csv")
print("Loans Data: ")
print(loans.head())

# Convert annual PD to monthly
loans["PD_Month"] = 1 - (1 - loans["PD_Annual"])**(1/12)

print("Loans with monthly PD:")
print(loans[["LoanID", "Principal", "PD_Annual", "PD_Month", "LGD"]])

# 2. Load amortization schedule from Excel
schedule = pd.read_excel("LoanPortfolio.xlsx", sheet_name="Schedule")

# 3. Merged schedule with loan PD and LGD
schedule = schedule.merge(loans[["LoanID", "PD_Month", "LGD"]], on="LoanID", how="left")

# Expected CF = CashFlow * (1 - PD_month * LGD)
schedule["Exp_CashFlow"] = schedule["Cash Flow"] * (1 - schedule["PD_Month"] * schedule["LGD"])

# 5. Aggregate portfolio expected cash flows by Month
portfolio_exp = schedule.groupby("Month")["Exp_CashFlow"].sum().reset_index()

print(portfolio_exp.head(10))

# Save to CSV for reference
portfolio_exp.to_csv("portfolio_expected_cashflow.csv", index=False)
print("\nPortfolio expected cash flows saved to data/portfolio_expected_cashflow.csv")

# Example annual discount rates
DiscRate_Low = 0.05
DiscRate_Base = 0.07
DiscRate_High = 0.09

# Monthly discount rates
r_low_m = (1 + DiscRate_Low)**(1/12) - 1
r_base_m = (1 + DiscRate_Base)**(1/12) - 1
r_high_m = (1 + DiscRate_High)**(1/12) - 1

# Discounted cash flows using your existing monthly rates
#Base
portfolio_exp["DF_Base"] = 1 / (1 + r_base_m)**portfolio_exp["Month"]
portfolio_exp["PV_Base"] = portfolio_exp["Exp_CashFlow"] * portfolio_exp["DF_Base"]

total_PV_base = portfolio_exp["PV_Base"].sum()
print(f"Portfolio Present Value (Base Rate): {total_PV_base:,.2f}")

#Low
portfolio_exp["DF_Low"] = 1 / (1 + r_low_m)**portfolio_exp["Month"]
portfolio_exp["PV_Low"] = portfolio_exp["Exp_CashFlow"] * portfolio_exp["DF_Low"]

total_PV_low = portfolio_exp["PV_Low"].sum()
print(f"Portfolio Present Value (Low Rate): {total_PV_low:,.2f}")

#High
portfolio_exp["DF_High"] = 1 / (1 + r_high_m)**portfolio_exp["Month"]
portfolio_exp["PV_High"] = portfolio_exp["Exp_CashFlow"] * portfolio_exp["DF_High"]

total_PV_high = portfolio_exp["PV_High"].sum()
print(f"Portfolio Present Value (High Rate): {total_PV_high:,.2f}")

# Save PV table to CSV
portfolio_exp.to_csv("portfolio_expected_cashflow.csv", index=False)
print("Portfolio expected cash flows")


sensitivity_low = (total_PV_low - total_PV_base) / total_PV_base * 100
sensitivity_high = (total_PV_high - total_PV_base) / total_PV_base * 100

print(f"Sensitivity to Low Rate: {sensitivity_low:.2f}%")
print(f"Sensitivity to High Rate: {sensitivity_high:.2f}%")

schedule["Exp_Loss"] = schedule["Cash Flow"] * schedule["PD_Month"] * schedule["LGD"]

# Aggregate over portfolio
total_expected_loss = schedule["Exp_Loss"].sum()
print(f"Total Expected Loss: {total_expected_loss:,.2f}")
