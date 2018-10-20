IF OBJECT_ID('dbo.v_Usage_Month_2010') IS NOT NULL
DROP VIEW [dbo].[v_Usage_Month_2010]
GO

-- Create a view.  
CREATE VIEW v_Usage_Month_2010  
AS 
SELECT CustomerId, ISNULL([1],0) as January, ISNULL([2],0) as February, ISNULL([3],0) as March, ISNULL([4],0) as April, ISNULL([11],0) as November, ISNULL([12],0) as December from (select [CustomerId], MONTH([CalendarDate]) as season_month, isnull([UsageCount],0) as [UsageCount] from v_Usage where SeasonName = 'Winter 2010/2011') src
	pivot (sum([UsageCount]) for season_month in ([1],[2],[3],[4],[11],[12])) as piv
