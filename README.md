# GA4 Journey analysis
A Big Query SQL request to simplify journey analysis from Google Analytics 4

As most Google Analytics 3 (aka Universal Analytics) users are migrating to Google Analytics 4, once first implementation is done, it is important to understand what are the gaps between the two tools

This query is intended to help in finding and fixing those gaps

Here is a step by step guide on how to use it

0. Make sure you have connected  GA4 to Big Query
   You can find tutorials here: [connect GA4 to BigQuery](https://support.google.com/analytics/answer/9823238?hl=en#zippy=%2Cin-this-article) (for all clients)
   
1. Copy Paste the file [GA4_Journey_Sunburst.sql] in a Big Query SQL environment (or if you are familiar with git, clone it on desired place)
2. Specify the proper dates for analysis in the query by replacing with your own dates if need be - that would be typically the last week
3. Find and replace the name of the GA3 (```your_project.your_GA3_ID.ga_sessions_20*```) and GA4 (```your_project.your_GA4_ID.events_20*```) tables with the proper names of your table in the whole query
4. Run the query
