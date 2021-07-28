resource "aws_glue_catalog_database" "aws_glue_catalog_database" {
  name = var.catalogDatabaseName
}

resource "aws_glue_crawler" "crawler" {
  database_name = aws_glue_catalog_database.aws_glue_catalog_database.name
  name          = var.crawlerName
  role          = var.roleArn

  jdbc_target {
    connection_name = var.connectionName
    path            = var.connectionPath
  }
}
