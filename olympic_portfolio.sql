--use olympic_games;
--select * from athletes_event_results
create view Olympic_Data
as select
		ID
		,Name as Competitor_Name
		,case when Sex = 'M' then 'Male' else 'Female' end Sex
		,Age
		,case when Age between 0 and 15 then 'Below 16'
			  when Age between 16 and 20 then 'Below 21'
			  when Age between 21 and 25 then 'Below 26'
			  when Age between 26 and 30 then 'Blow 31'
		else 'Above 30' end Age_Bracket
		,NOC as Nation
		,SUBSTRING(games, 1,CHARINDEX(' ',games)-1) Game_year
		,SUBSTRING(games,CHARINDEX(' ',games)+1,LEN(games)) Season
		,City
		,Sport
		,Event
		,case when Medal = 'NA' then 'No Medal'
		 else Medal end as Medal
from athletes_event_results

select * from Olympic_Data