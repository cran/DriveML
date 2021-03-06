% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autoFeature.R
\name{generateFeature}
\alias{generateFeature}
\title{Automated column transformer}
\usage{
generateFeature(data, varlist, type = "Frequent", method = NULL)
}
\arguments{
\item{data}{[data.frame  | Required] dataframe or data.table}

\item{varlist}{[text  | Required] variable list to generate the additional features}

\item{type}{[text  | Required] variable transformation with type - 'Dummy','Outlier','Frequent' or 'Interaction'}

\item{method}{[text  | Required] input for variabe transformation for type = 'Frequent' then the method should be 'Frequency' or 'Percent'. Please refer to the "details" section to know more}
}
\value{
generated transformed features
}
\description{
This function automatically scans through each variable and generate features based on the type listed in the "details"
}
\details{
This function is for generating features based on different transformation methods such as interaction, outliers, Dummy coding, etc.

Interaction type
\itemize{
  \item multiply - multiplication
  \item add - addition
  \item substract - substraction
  \item divide - division
}
Frequency type
\itemize{
  \item Frequency - frequency
  \item Percent - percentage
}
Outlier type
\itemize{
  \item Flag - flag outlier values like 1 or 0
  \item Capping - impute outlier value by 95th or 5th percentile value
}
Date type
\itemize{
  \item Year
  \item Month
  \item Quarter
  \item Week
}
}
\examples{
# Generate interaction features
generateFeature(heart, varlist = c("cp", "chol", "trestbps"), type = "Interaction",
method = "add")
generateFeature(heart, varlist = c("cp", "chol", "trestbps"), type = "Interaction",
method = "multiply")

# Generate frequency features
generateFeature(heart, varlist = c("cp", "thal"), type = "Frequent", method = "Percent")
generateFeature(heart, varlist = c("cp", "thal"), type = "Frequent", method = "Frequency")

}
