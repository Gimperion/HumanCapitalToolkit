#--------------------------------------------------------------------------#
#                                                                          #
#                  Harvard SDP Human Capital Diagnostic                    #
#                                                                          #
# Programmer: Bo Yan                                                       #
# Email: bo.yan@jefferson.kyschools.us                                     #
# Created: 2014-11-10                                                      #
# Last revision: 2014-11-10                                                #
#                                                                          #
# Description:                                                             #
# 1. Read Stata data files into R                                          #
# 2. Clean the raw data                                                    #
# 3. Prepare the cleaned data for analysis by joining and transformation   #
#                                                                          #
#--------------------------------------------------------------------------#



# ============================ IMPORT ============================ #

# Read Stata data into R
library(foreign)
raw_school <- read.dta("../data/raw/School_Raw.dta")
raw_staff_certification <- read.dta("../data/raw/staff_certifications.dta")
raw_staff_classification <- read.dta("../data/raw/Staff_Classifications_Raw.dta")
raw_staff_schoolyear <- read.dta("../data/raw/Staff_School_Year_Raw.dta")
raw_student_enrollment <- read.dta("../data/raw/Student_Class_Enrollment_Raw.dta")
raw_student_demographics <- read.dta("../data/raw/Student_Demographics_Raw.dta")
raw_student_schoolyear <- read.dta("../data/raw/Student_School_Year_Raw.dta")
raw_student_score <- read.dta("../data/raw/Student_Test_Scores_Raw.dta")



# ============================ EXPLORE ============================ #

# Explore the raw data all together
sapply(ls(), function(x) nrow(get(x)))               # Number of rows
sapply(ls(), function(x) names(get(x)))              # Columns
sapply(ls(), function(x) any(!complete.cases(x)))    # Missing data
sapply(ls(), function(x) head(get(x))                # First 6 rows


# ---------------------- RAW_SCHOOL ---------------------- #

# Uniqueness of identifier
sapply(raw_school[, c(1, 2)], function(x) any(duplicated(x)))

# Acruracy of school level
raw_school <- within(raw_school, {
  level <- NULL
  level[grep("Elementary", school_name)] <- 'Elem'
  level[grep("Middle", school_name)] <- 'Mid'
  level[grep("High", school_name)] <- 'High'
  level[is.na(level)] <- ""
})
with(raw_school, all(school_lvl==level))



# ============================ TRANSFORMATION ============================ #


# ---------------------- RAW_SCHOOL ---------------------- #

school <- within(raw_school, {
  level <- NULL
  level[school_lvl=='Elem'] <-
})




