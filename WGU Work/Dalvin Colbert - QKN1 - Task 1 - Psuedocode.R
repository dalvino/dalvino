# Dalvin Colbert
# D598 - Analytics Programming
# QKN1 - Task 1 - PseudoCode

#########################################################################

# Import the data file into a data frame
#   1. Define the data frame and read the file into it.
#       df <- read_csv("file_to_import",show_col_types = FALSE) OR
#       df <- read.table("file_to_import", sep=",", header = 1)

#   Verify the data was read.
#     head(df, 5)

#########################################################################

# Create new data frames
#    1. Debt-to-equity (DTE)
#       a. DTE <- df
#       b. Group IDs by state
#         * DTE[order(DTE$ID, DTE$state)]
#       c. Run Descriptive statistics
#          * DTE_stats <- summary(DTE_numeric_columns)
#       d. Identify negative DTE's
#           * DTE[DTE$DTE < 1]

#    2. Debt-to-income (DTI)
#       a. Compute DTI for every business and create a new column DTI
#           DTI <-df        
#          *  DTI$DTI <- with(DTI, DTI$long_term_debt / DTI$revenue)
#             
#
###########################################################################
