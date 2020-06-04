[![CRAN status](https://www.r-pkg.org/badges/version/DriveML)](https://cran.r-project.org/package=DriveML)

---

# Background

  **DriveML** is a series of functions sucha as `AutoDataPrep`, `AutoMAR`, `autoMLmodel`.  **DriveML** automates some of the most difficult machine learning functions such as data exploratory analysis, data cleaning, data tranformations, feature engineering, model training, model validation, model tuning and model selection. 

## Functionalities of DriveML

DriveML R package has four unique functionalities 

1. Data Exploration
    + `SmartEDA` has a complete exploratory data analysis function

2. Data preparations
    + `AutoDataPrep` function to generate a novel features based on the functional understanding of the dataset
    
3. Machine learning models
    + `autoMLmodel` function to develope baseline machine learning models using regression and tree based classfication techniques

4. Model report
    + `autoMLReport` function to print the machine learning model outcome in HTML format

# Installation

The package can be installed directly from CRAN.

```R
install.packages("DriveML")
```
# Example

## Data
In this vignette, we will be using Heart Disease - Classifications data set

Data Source [kaggle](https://www.kaggle.com/cdabakoglu/heart-disease-classifications-machine-learning).

```R
	install.packages("DriveML")
	install.packages("SmartEDA")
	library("DriveML")
	library("SmartEDA")
	## Load heart desease dataset 
	heart <- DriveML::heart
	
```

## Overview of the data
Understanding the dimensions of the dataset, variable names, overall missing summary and data types of each variables

```R
## overview of the data; 
	ExpData(data = heart, type = 1)
## structure of the data	
	ExpData(data = heart, type = 2)
```

## Summary of numerical variables
To summarise the numeric variables, you can use following r codes from this pacakge

```R
## Summary statistics by – overall
	ExpNumStat(heart, by = "GA", gp = "target_var", Qnt = seq(0, 1, 0.1), MesofShape = 2, Outlier = TRUE, round = 2)
```
## Graphical representation of all numeric features

```R
## Generate Boxplot by category
ExpNumViz(heart, gp = "target_var", type = 2, nlim = 25, Page = c(2, 2))

## Generate Density plot
ExpNumViz(heart, gp = NULL, type = 3, nlim = 10, Page = c(2, 2))

## Generate Scatter plot
ExpNumViz(heart, target="target_var", nlim = 4, scatter = TRUE, Page=c(2, 1))
```

# Machine learning model using 3 simple steps

## Data preparation using autoDataprep function

Single function to prepare end to end data preparation for machine learning models

```R
# Data Preparation
small_data <- autoDataprep(heart, target = "target_var", missimpute = "default",
                       auto_mar = TRUE, mar_object = NULL, dummyvar = TRUE,
                       char_var_limit = 12, aucv = 0.02, corr = 0.99,
                       outlier_flag = TRUE, interaction_var = TRUE,
                       frequent_var = TRUE, uid = NULL, onlykeep = NULL, drop = NULL)

# Print output on R console
printautoDataprep(small_data)

# Final prepared master data

small_data_t <- small_data$master_data
```

## Machine learning classification model using autoMLmodel function

Single function to develope six different types of machine learning binary classification models with the help of hyperparameter tuining using random search

```R
# DriveML Model development
small_ml_random <- autoMLmodel(small_data_t,  target = "target_var",  testSplit = 0.2,
                      tuneIters = 100,  tuneType = "random",
                      models = "all", varImp = 20,  liftGroup = 10,  maxObs = 10000,  uid = NULL,
                      pdp = T, positive = 1, htmlreport = FALSE, seed = 1991)

# Model summary results
small_ml_random$results

```

## Present model report using autoMLReport function

Generate a report in html format for the output of autoDataprep and autoMLmodel DriveML fucntions. Alos autoMLReport is an inbuilt function under autoMLmodel. 

```R
autoMLReport(mlobject = small_ml_random, mldata = small_data, op_file = "driveML_ouput_heart_data.html")

```

## Articles

