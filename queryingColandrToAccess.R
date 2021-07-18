install.packages('RODBC')
library('RODBC')

# Function that takes in an export list from the Colandr_get.R function and a tablename in an SQL database, 
# and connects to a database to import the given information
import_data_sql <- function(export, tableName) {
  # Connect to database
  
  # Comment the below line in when you receive the uid and pwd from David Gill, Duke University Marine Lab
  #db <- odbcDriverConnect(connection="driver={MySQL ODBC 8.0 ANSI Driver}; server=oegm.rc.duke.edu; port=3306; database=Article; uid=ASK_DAVID; pwd=ASK_DAVID;")
  
  # Make the given export list into a dataframe since a dataframe is required for the sqlSave function
  df <- data.frame(matrix(unlist(export), nrow=length(export), byrow=TRUE))
  
  # Drop all rows from the dataframe that were not included at the abstract level
  df[df$'t&a_status' != 'included', ] 
  
  # Not dropping any columns from Colandr export for now
  #columnsToDrop <- c('uploaded_by','duplicate')
  #updated_df = df[,!(names(df) %in% columnsToDrop)]
  
  # Input the database into the SQL database 
  sqlSave(channel=db, dat=df, tablename=tableName, rownames=FALSE, colnames= TRUE, append=TRUE)
}