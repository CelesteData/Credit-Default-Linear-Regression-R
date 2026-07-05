# Predictive Modeling for Credit Card Utilization

## 📌 Project Overview
Predicting customer credit utilization is a critical component of risk management and portfolio analysis in banking operations. This project applies statistical modeling in R to the UCI Taiwan Credit Card Default dataset to predict a customer's future billing amount (`BILL_AMT1`) based on their credit limit, demographic data, and historical payment statuses. 

By comparing a Simple Linear Regression model against a Multiple Linear Regression model, this project demonstrates the necessity of multivariate analysis when evaluating complex financial behaviors.

## 🛠️ Tools & Technologies
* **Language:** R
* **Libraries:** Base R (Stats)
* **Techniques:** Simple Linear Regression, Multiple Linear Regression, Feature Engineering (Categorical Dummy Variables), Statistical Diagnostics (Homoscedasticity, Multicollinearity)

## 📊 Methodology
1. **Data Preparation:** Cleaned and subsetted the UCI dataset. Converted non-continuous categorical variables (such as `EDUCATION` and payment histories `PAY_0`, `PAY_2`) into factors to allow the model to calculate flat-dollar baseline adjustments.
2. **Simple Linear Regression:** Built a baseline model predicting `BILL_AMT1` using only the customer's credit limit (`LIMIT_BAL`). 
3. **Multiple Linear Regression:** Expanded the model to include `AGE`, `EDUCATION`, and payment history, testing the assumption that customer billing behavior is driven by multiple interacting factors.
4. **Model Diagnostics:** Evaluated R-squared values, standard errors, residual plots, and ran a correlation matrix on continuous variables to check for multicollinearity.

## 📈 Key Insights & Results
The Multiple Linear Regression model provided a significantly better fit for the data compared to the Simple Linear baseline:
* **Explained Variance:** The R-squared value jumped from **0.0814** (Simple) to **0.3721** (Multiple), indicating the multilinear model explains over 37% of the variance in customer billing behavior.
* **Error Reduction:** The Standard Error decreased from 0.00314 to 0.002866, and the Maximum Residuals dropped from 778,428 to 673,571.
* **Feature Importance:** `LIMIT_BAL` remained a consistently significant predictor across both models. Furthermore, specific historical payment statuses within the `PAY_2` feature were flagged as highly significant categorical drivers.
* **Diagnostic Checks:** A correlation matrix confirmed no significant multicollinearity between the continuous variables (highest correlation was 0.285 between `BILL_AMT1` and `LIMIT_BAL`).

## ⚙️ How to Run the Code
1. Clone this repository to your local machine.
2. Ensure the `credit_default.csv` dataset is downloaded and saved in the same working directory.
3. Run the `regression_models_credit_default.R` script in RStudio or your preferred R environment. 

## 📁 Repository Files
* `regression_models_credit_default.R`: The complete, fully commented R script containing all data cleaning, model building, and diagnostic analysis.
* `credit_default.csv`: The subset of the UCI dataset used for this analysis. *(Note: Add the file or a link to the UCI repository here)*
