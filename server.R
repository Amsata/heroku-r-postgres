#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    library("httr")
    library("RPostgreSQL")
    library("RPostgres")
    db_uri <- Sys.getenv('DATABASE_URL')
    db_uri="postgres://xfaefhqgdtlcle:82ec6a4179aef9d3c11dbdc8cae8c0a78f258308c4a3844835330dfd81eb189b@ec2-52-6-211-59.compute-1.amazonaws.com:5432/d1qcu3g4pf06t5"
    parts <- parse_url(db_uri)
    
    # drv <- dbDriver("PostgreSQL")
    
    con <- dbConnect(
        RPostgres::Postgres(),
        host = parts$hostname,
        port = parts$port,
        user = parts$user,
        password = parts$password,
        dbname = parts$path
    )
    
    # dbWriteTable(con,mtcars)
    # dbListTables(con)
    
    output$server=renderText(parts$hostname)
    output$port=renderText(parts$port)
    output$user=renderText(parts$user)
    output$dbname=renderText(parts$path)
    
    dbDisconnect(con)
    
    cat("\nSuccess\n")

})
