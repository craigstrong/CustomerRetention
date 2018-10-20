IF OBJECT_ID('dbo.v_Usage_Resort_2013_2014') IS NOT NULL
DROP VIEW [dbo].[v_Usage_Resort_2013_2014]
GO

-- Create a view.  
CREATE VIEW v_Usage_Resort_2013_2014 
AS 
SELECT CustomerId, ISNULL([Ski Resort1],0) as Ski_Resort1_2013_2014, ISNULL([Ski Resort2],0) as Ski_Resort2_2013_2014, ISNULL([Ski Resort3],0) as Ski_Resort3_2013_2014, ISNULL([Ski Resort4],0) as Ski_Resort4_2013_2014, ISNULL([Ski Resort5],0) as Ski_Resort5_2013_2014 from (select [CustomerId], [LocationName] , [UsageCount] from v_Usage where SeasonName = 'Winter 2013/2014') src
	pivot (sum([UsageCount]) for [LocationName] in ([Ski Resort1],[Ski Resort2],[Ski Resort3],[Ski Resort4],[Ski Resort5])) as piv
