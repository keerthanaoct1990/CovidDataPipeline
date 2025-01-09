# CovidDataPipeline
Create a data pipeline with Delta Live Tables.
The purpose of the pipeline is to fetch raw covid data ,process them and make them ready for further analysis
Steps
_______
1. Download the covid data from 'https://github.com/MicrosoftLearning/mslearn-databricks/raw/main/data/covid_data.csv'
2. Create 3 delta live tables
   1. raw_covid_data from the csv file
   2. processed_covid_data by querying, filtering and formating data from raw_covid_data
   3. aggregated_covid_data containing total deaths, total recovery and total confirmed covid caseswhich can further be used for analysis or visualization
3. Create the pipeline . Start the pipeline. Verify all the tables are created and filled with data.
4. Create a visualization


Aggregated covid data

![image](https://github.com/user-attachments/assets/3fc8a3fc-11ba-4b8b-b26a-8f9d742510d5)


Visualisation of aggregated covid data.
Visualization type: Line
X Column: Report_Date
Y Column: Add a new column and select Total_Confirmed. Apply the Sum aggregation.

![image](https://github.com/user-attachments/assets/5ae5b4a2-bdab-4691-ad1a-61223930ce1c)
