# Dalvin Colbert
# D598 - Analytics Programming
# QKN1 - Task 2 - Code.R

#########################################################################
# Import appropriate libraries
library(tidyverse)
library(data.table)
library(xlsx)

#  Import the data file into a data frame
#   Define the data frame and read the file into it.
        df <- read.csv("D598 Data Set.csv", sep=",", header = 1)

#  Verify the data was read.
        head(df, 5)

#  Identify duplicates
        duplicated(df)
        df[duplicated(df)]
#########################################################################
#  Group IDs by state and run Descriptive statistics
        stats_by_state <- function() {
          library(tidyverse)
          library(data.table)
# create matrix for new statistical dataframe 
          state_stats_matrix <- test_df %>% group_by(test_df$Business.State) %>% 
            summarize(LT_Debt.mean = mean(Total.Long.term.Debt), LT_Debt.median = median(Total.Long.term.Debt), LT_Debt.min = min(Total.Long.term.Debt), LT_Debt.max = max(Total.Long.term.Debt),
                      Equity.mean = mean(Total.Equity), Equity.median = median(Total.Equity), Equity.min = min(Total.Equity), Equity.max = max(Total.Equity),
                      DTE.mean = mean(Debt.to.Equity), DTE.median = median(Debt.to.Equity), DTE.min = min(Debt.to.Equity), DTE.max = max(Debt.to.Equity),
                      Liabilities.mean = mean(Total.Liabilities), Liabilities.median = median(Total.Liabilities), Liabilities.min = min(Total.Liabilities), Liabilities.max = max(Total.Liabilities),
                      Revenue.mean = mean(Total.Revenue), Revenue.median = median(Total.Revenue), Revenue.min = min(Total.Revenue), Revenue.max = max(Total.Revenue),
                      Profit.Margin.mean = mean(Profit.Margin), Profit.Margin.median = median(Profit.Margin), Profit.Margin.min = min(Profit.Margin), Profit.Margin.max = max(Profit.Margin))        
# create data frame state_stat_matrix
        state_stats_transposed=as.data.frame(state_stats_matrix)
          
# transpose
        state_stats = t(state_stats_transposed)
# print to verify
        str(state_stats)
        state_stats
        }
        
#  Identify negative DTE
        filter(df, df$Debt.to.Equity < 0)
        
#  Debt-to-income (DTI)
#   Compute DTI for every business and create a new column DTI
        df$DTI <- with(df, df$long_term_debt / df$revenue)
        
#  Verify appended DTI column
        df



