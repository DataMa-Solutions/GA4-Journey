/*

 _____        _  _          _                                       
  / ____|   /\ | || |        | |                                      
 | |  __   /  \| || |_       | | ___  _   _ _ __ _ __   ___ _   _ ___ 
 | | |_ | / /\ \__   _|  _   | |/ _ \| | | | '__| '_ \ / _ \ | | / __|
 | |__| |/ ____ \ | |   | |__| | (_) | |_| | |  | | | |  __/ |_| \__ \
  \_____/_/    \_\|_|    \____/ \___/ \__,_|_|  |_| |_|\___|\__, |___/
                                                             __/ |    
                                                            |___/    


FIRST WRITTEN ON: 2023-02-03
BY: DATAMA - GUILLAUME@DATAMA.IO
LICENCE:MIT
NOTE: This query has been written for helping analysing Journeys from Google Analytics 4
      Please read more instructions on https://github.com/DataMa-Solutions/GA4-Journey
      DataMa is a SaaS tool that helps finding insights and generate business actions based on data.
      Contact us for automatic analysis of your Journeys with sunbursts and attribution model in our app, as a SaaS or as an extension of visualisation Tools (Looker Studio, Tableau, PowerBI)
*/



--- Change Date Range below

with date_range as (
  select
    "2023-02-01" as start_date,
    "2023-02-01" as end_date)

, base AS(
 SELECT
    device.category as Device,
    concat(case when user_pseudo_id is null then "_" else user_pseudo_id end, (select value.int_value from unnest(event_params) where key = 'ga_session_id')) as Session_Id,
    STRING_AGG((select value.string_value 
                from unnest(event_params) 
                where key = 'content_group' -- <--- Replace by the right key that you are using in you're tracking for page type aggregation
                      and event_name = "page_view"
                ), "-" ORDER BY event_timestamp) as Journey,
    count(distinct case when event_name IN ('in_app_purchase', 'purchase') then concat(case when user_pseudo_id is null then "_" else user_pseudo_id end, cast(event_timestamp as string)) end) as purchases
 FROM
    `your_project.your_GA4_ID.events_20*` -- <--- Change your project and GA4 table ID here
 , date_range
  WHERE PARSE_DATE('%y%m%d',_table_suffix) BETWEEN  DATE(date_range.start_date) and DATE(date_range.end_date)  
 group by 1,2
)

Select Device, Journey, count(*) as sessions, sum(purchases) purchases
from base
where Journey is not null
group by 1,2
order by sessions desc
