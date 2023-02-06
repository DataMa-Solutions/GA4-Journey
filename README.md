# GA4 Journey analysis
A Big Query SQL request to simplify journey analysis from Google Analytics 4

It helps generating a file that contains user "Journeys" (with column that is "Journey") that can then be used for visualizing sunbursts and optimizing behaviors

A good example of usage can be found on this article explaining [how to get value from a sunburst](https://www.datama.io/getting-value-out-of-a-sunburst/))

Here is a step by step guide on how to use it

0. Make sure you have connected  GA4 to Big Query
   You can find tutorials here: [connect GA4 to BigQuery](https://support.google.com/analytics/answer/9823238?hl=en#zippy=%2Cin-this-article) (for all clients)
   
1. Copy Paste the file [GA4_Journey_Sunburst.sql](https://github.com/DataMa-Solutions/GA4-Journey/blob/main/GA4_Journey_Sunburst.sql) in a Big Query SQL environment (or if you are familiar with git, clone it on desired place)
2. Specify the proper dates for analysis in the query by replacing with your own dates if need be - that would be typically the last week
3. Find and replace the name of the GA4 (```your_project.your_GA4_ID.events_20*```) event tables with the proper names of your table in the whole query
4. Run the query and download results - data should look like [this](https://docs.google.com/spreadsheets/d/1Z2JovUx_q7uLR2iy_fukiJWpIrA1o5wfvfnaHQUgBE4/edit#gid=0)
5. Visualize the Journeys and get insights 
   . You can use any open source packages to visualize sunbursts - [SunburstR](https://cran.r-project.org/web/packages/sunburstR/index.html) is a good option in R
   . Or you can use DataMa Journey SaaS : create account on [DataMa platform](app.datama.io) and upload your CSV in DataMa Journey - free access is available for 15 days. 
   DataMa Journey will provide not only Sunbursts visualization but also comparison and attribution features to understand where you can optimize your journeys. 
   Learn more on [DataMa Journey](https://datama-solutions.github.io/docs/core_app/journey.html) 