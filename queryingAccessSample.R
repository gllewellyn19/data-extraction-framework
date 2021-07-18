install.packages("RODBC")
library(RODBC)
# Comment the below line in when you receive the uid and pwd from David Gill, Duke University Marine Lab
#db <- odbcDriverConnect(connection="driver={MySQL ODBC 8.0 ANSI Driver}; server=oegm.rc.duke.edu; port=3306; database=Article; uid=ASK_DAVID; pwd=ASK_DAVID;")
sqlQuery(db, "show tables")
sqlQuery(db, "select * from Codes")
sqlUpdate(db, "INSERT INTO Article VALUES (2, Test Title, Test journal, Test publication Type, 2020, Test author, Test author countries, Test author affiliation, Test funding source, Test DOI);")