IF OBJECT_ID('dbo.v_Usage_Month_2013_2014') IS NOT NULL
DROP VIEW [dbo].[v_Usage_Month_2013_2014]
GO

-- Create a view.  
CREATE VIEW v_Usage_Month_2013_2014
AS 
SELECT CustomerId, ISNULL([1],0) as January_14, ISNULL([2],0) as February_14, ISNULL([3],0) as March_14, ISNULL([4],0) as April_14, ISNULL([11],0) as November_13, ISNULL([12],0) as December_13, (ISNULL([1],0) + ISNULL([2],0) + ISNULL([3],0) + ISNULL([4],0) + ISNULL([11],0) +ISNULL([12],0) ) as Total_Days_13_14 from (select [CustomerId], MONTH([CalendarDate]) as season_month, isnull([UsageCount],0) as [UsageCount] from v_Usage where SeasonName = 'Winter 2013/2014') src
	pivot (sum([UsageCount]) for season_month in ([1],[2],[3],[4],[11],[12])) as piv
