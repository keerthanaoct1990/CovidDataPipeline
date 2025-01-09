-- Databricks notebook source
-- MAGIC %sh
-- MAGIC mkdir /dbfs/delta_lab

-- COMMAND ----------

-- MAGIC %sh
-- MAGIC wget -O /dbfs/delta_lab/covid_data.csv https://github.com/MicrosoftLearning/mslearn-databricks/raw/main/data/covid_data.csv

-- COMMAND ----------

-- MAGIC %python
-- MAGIC display(dbutils.fs.ls("dbfs:/delta_lab"))

-- COMMAND ----------

create or replace temporary view covid_data_temp
using csv
options(header='true', delimiter=',', inferSchema='true',path = '/delta_lab/covid_data.csv')


-- COMMAND ----------

select * from covid_data_temp;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC display(dbutils.fs.ls("dbfs:/pipelines/delta_lab/tables"))

-- COMMAND ----------

show tables

-- COMMAND ----------

SELECT * FROM hive_metastore.default.aggregated_covid_data;
