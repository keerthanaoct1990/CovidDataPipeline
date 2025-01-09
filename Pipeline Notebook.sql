-- Databricks notebook source
 CREATE OR REFRESH LIVE TABLE raw_covid_data
 COMMENT "COVID sample dataset. This data was ingested from the COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University."
 AS SELECT
   Last_Update,
   Country_Region,
   Confirmed,
   Deaths,
   Recovered
 FROM read_files('dbfs:/delta_lab/covid_data.csv', format => 'csv');

-- COMMAND ----------

create or refresh live table processed_covid_data(
  constraint valid_country_region expect(Country_Region IS NOT NULL) on violation fail update
)
comment "Formatted and filtered data for analysis."
as select TO_DATE(Last_Update, 'MM/dd/yyyy') as Report_Date,Country_Region, Confirmed, Deaths,Recovered
from live.raw_covid_data;

-- COMMAND ----------

create or refresh live table aggregated_covid_data
COMMENT "Aggregated daily data for the US with total counts."
AS
 SELECT
     Report_Date,
     sum(Confirmed) as Total_Confirmed,
     sum(Deaths) as Total_Deaths,
     sum(Recovered) as Total_Recovered
 FROM live.processed_covid_data
 GROUP BY Report_Date;

