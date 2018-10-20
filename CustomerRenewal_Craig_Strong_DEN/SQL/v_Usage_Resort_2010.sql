IF OBJECT_ID('dbo.v_Usage_Resort_2010') IS NOT NULL
DROP VIEW [dbo].[v_Usage_Resort_2010]
GO

-- Create a view.  
CREATE VIEW v_Usage_Resort_2010 
AS 
SELECT CustomerId, ISNULL([Ski Resort1],0) as Ski_Resort1, ISNULL([Ski Resort2],0) as Ski_Resort2, ISNULL([Ski Resort3],0) as Ski_Resort3, ISNULL([Ski Resort4],0) as Ski_Resort4, ISNULL([Ski Resort5],0) as Ski_Resort5 from (select [CustomerId], [LocationName] , [UsageCount] from v_Usage where SeasonName = 'Winter 2010/2011') src
	pivot (sum([UsageCount]) for [LocationName] in ([Ski Resort1],[Ski Resort2],[Ski Resort3],[Ski Resort4],[Ski Resort5])) as piv
