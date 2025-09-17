# 📊 World Bank – Kenya Debt & Bond Market Risk Analysis  

## 📝 Project Overview 

This project studies Kenya’s sovereign debt position and interest rate risk using **World Bank datasets**.  
The analysis tracks historical debt trends, repayment risks, and government revenue from **2015–2024**, and develops a simple **2025 projection** to evaluate short-term sustainability.  

The aim is to highlight the balance between **economic growth, debt accumulation, and repayment capacity**—key issues for policymakers, investors, and institutions like the World Bank Treasury.  

---

## 📂 Dataset  

- **Source**: World Bank Open Data
    
- **Country**: Kenya
  
- **Period**: 2014–2024 (historical) + 2025 (projection)
   
- **Key Variables**:
  
  - `GDP_USD` – Gross Domestic Product (current USD)  
  - `External_debt` – External debt stock  
  - `DebtService_USD` – External debt service payments  
  - `Revenue_USD` – Government revenue  
  - `Debt_to_GDP_pct` – External debt as % of GDP (calculated)  
  - `Revenue_pct_GDP` – Government revenue as % of GDP (calculated)  

---

## ⚙️ Data Preparation  

- **Merged Indicators**: Combined Kenya-specific series from multiple World Bank datasets into a single sheet.
   
- **Handled Missing Data**:
  
  - Linear trend used for missing external debt values.
    
  - Revenue-to-GDP ratio calculated when revenue data was incomplete.
     
- **Derived Metrics**:  
  - `Debt_to_GDP_pct = ExternalDebt / GDP × 100`  
  - `Revenue_pct_GDP = Revenue / GDP × 100`  
  - `Effective Interest Rate (r) = DebtService / ExternalDebt`  

---

## 📈 2025 Projection  

- **GDP (2025)** = GDP(2024) × (1 + avg growth over past 5 years)
  
- **External Debt (2025)** = Debt_to_GDP(2024) × GDP(2025)
  
- **Revenue (2025)** = Revenue(2024) × (1 + avg growth)
  
- **Debt Service (2025)** = ExternalDebt(2025) × r (2024 interest rate)  

This projection provides a **baseline scenario** for near-term risk analysis.  

---

## 📊 Visualizations 

- **Debt-to-GDP Trend** – line chart of debt sustainability over time.
    
- **GDP vs. External Debt** – line chart showing growth vs. borrowing.
   
- **Debt Service vs. Revenue** – combo chart highlighting repayment burden relative to fiscal capacity.  

---
## 📌 Insights & Observations  

- **Debt-to-GDP Ratio**:
  
  - Has steadily increased since 2015 as both GDP and external debt grew.
      
  - Growth in debt has been slightly faster than GDP in some years, raising sustainability questions.  

- **GDP vs External Debt**:
  
  - Both indicators rise at similar rates, showing a linked trend.
     
  - A sharp rise in GDP was observed post-2019 (pandemic recovery).
     
  - A slight dip in 2023 may reflect estimation adjustments when forecasting 2024 values.  

- **Debt Service vs Revenue**:
   
  - Debt service has consistently accounted for **28%–39% of annual revenue**.
     
  - This indicates that Kenya has been able to cover debt service obligations each year, though the burden is significant.  

- **2025 Outlook**:
  
  - If revenue ratios remain constant and debt continues to grow with GDP, the repayment burden will persist.
    
  - Fiscal strain may intensify if revenue growth does not accelerate relative to debt service.  

---

## 💡 Policy Relevance  

- Rising **debt-to-GDP levels** may increase repayment risk and reduce fiscal flexibility.
  
- The share of revenue spent on **debt service** leaves less room for social and development spending.
   
- Insights are relevant for discussions on **debt restructuring, borrowing strategy, and fiscal reforms**.  

---

## 📁 Deliverables  

- **Clean dataset** – merged and processed Excel sheet.
   
- **Charts** – visual summaries of debt, GDP, and repayment trends.
   
- **Documentation (README)** – this report.  

---

## 👩‍💻 Author 

**Tracy Musiomi** 

*Actuarial Science & Financial Risk Student* 

**Tools**: Microsoft Excel, World Bank Data API 

 Excel, World Bank Data API  
