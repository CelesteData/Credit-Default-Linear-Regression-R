#importing the csv file
#looking at the structure of the data frame
credit<- read.csv("credit_default.csv")
str(credit)

#selecting specific columns into edited data frame
credit_edit <- credit[, c("LIMIT_BAL", "AGE", "EDUCATION", "PAY_0", "PAY_2",
                          "BILL_AMT1","BILL_AMT2","default_payment_next_month")]

#converting EDUCATION to factor it is not a continuous variable it is categorical
credit_edit$EDUCATION <- as.factor(credit_edit$EDUCATION)

#converting PAY_0 to factor it is not a continuous variable it is categorical
credit_edit$PAY_0 <- as.factor(credit_edit$PAY_0)

#converting PAY_ to factor it is not a continuous variable it is categorical
credit_edit$PAY_2 <- as.factor(credit_edit$PAY_2)

#checking structure
str(credit_edit)

#checking for missing values
anyNA(credit_edit)

#converting default_payment_next_month to factor for logistic regression
#there's no logistic regression portion of the assignment
#but, if I did convert it, it would be like this:
#credit_edit$default_payment_next_month <- as.factor (credit_edit$default_payment_next_month)

#building a simple linear regression to predict BILL_AMT1
simplelm <- lm(BILL_AMT1 ~ LIMIT_BAL, data = credit_edit)
simplelm

#looking at the summary
summary(simplelm)

#Regression Equation
#y = a + bx1
#BILL_AMT1 = Intercept + (coefficient * LIMIT_BAL)
#BILL_AMT1 = 24092.481 + (0.162 * LIMIT_BAL)

#Interpreting the coefficients
#the intercept is the value of target variable BILL_AMT1 if all feature variables are 0.
#If the credit limit was zero dollars, then BILL_AMT1 would be equal to the intercept.
#This is also where the regression line crosses the y-axis.
#The coefficient of LIMIT_BAL although fairly close to zero indicates that there is a positive
#relationship between BILL_AMT1 and LIMIT_BAL.  As LIMIT_BAL increases by $1, BILL_AMT1
#increases by about $0.16.

#adding prediction column to the data frame
credit_edit$pred<- predict(simplelm)

#plotting prediction and target variable with a regression line
plot(credit_edit$pred, credit_edit$BILL_AMT1)
abline(a=0, b=1, col = "red", lwd = 3, lty = 2)

#building a multiple linear regression to predict BILL_AMT1
multilm <- lm(BILL_AMT1 ~ LIMIT_BAL + AGE + EDUCATION +
                PAY_0 + PAY_2, data = credit_edit)

#turning off scientific notation
options(scipen = 999)

#observing the model
multilm

#summarizing the model output
summary(multilm)

#Discussing the R^2 and variable significance
#The Multiple R^2 is 0.3721 and the Adjusted R^2 is 0.3715.  The model explains about 37% of 
#the variance of BILL_AMT1.  

#There are a number of significant variables:  LIMIT_BAL, AGE, some of the PAY_0s' factors, 
#and the majority of the PAY_2s' factors.  I would say that PAY_2 is more significant in 
#this case.  

#plotting the model
plot(multilm)

#calculating the correlations between continuous variables
cor(credit_edit[, c("BILL_AMT1", "LIMIT_BAL", "AGE")])
#none of these variables are highly correlated with one another.  
#there is no multicollinearity found in this model

#adding prediction2 column to the data frame
credit_edit$pred2<- predict(multilm)

#plotting prediction and target variable with a regression line
plot(credit_edit$pred2, credit_edit$BILL_AMT1)
abline(a=0, b=1, col = "red", lwd = 3, lty = 2)


