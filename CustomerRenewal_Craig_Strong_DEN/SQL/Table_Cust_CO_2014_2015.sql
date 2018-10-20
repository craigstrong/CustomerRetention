IF OBJECT_ID('dbo.Cust_CO_2014_2015') IS NOT NULL
DROP TABLE [dbo].[Cust_CO_2014_2015]
GO

SELECT [Age], [StateProvinceCode], [CustomerLifetimeSpend], [Customer1YearSpend], [Customer3YearSpend], [ThreeYearVisitCount], 
	  [SkiLoyaltyIndexRating], [FrontRangeMarket], [CustId], [Spend_Winter_2010], [Spend_Winter_2011], [Spend_Winter_2012], [Spend_Winter_2013],
	  [Spend_Winter_2014], [Spend_Winter_2015], [Household1YearSpend], [Household3YearSpend], [HouseholdLifetimeSpend], [NumberOfHouseholdMembers], [NumberOfAdults], 
	  [NumberOfChildren], [Pass_Winter_2010], [Pass_Winter_2011], [Pass_Winter_2012], [Pass_Winter_2013], [Pass_Winter_2014], [Pass_Winter_2015], 
	  ISNULL(C.[CustomerId],[CustId]) as [CustomerId], ISNULL([Early_Purchase_2014_2015],0) as [Early_Purchase_2014_2015], ISNULL([Regular_Purchase_2014_2015],0) as [Regular_Purchase_2014_2015], ISNULL([Late_Purchase_2014_2015],0) as [Late_Purchase_2014_2015] , ISNULL([Super_Late_Purchase_2014_2015],0) as [Super_Late_Purchase_2014_2015],
	  ISNULL([January_15],0) as [January_15], ISNULL([February_15],0) as [February_15], ISNULL([March_15],0) as [March_15], ISNULL([April_15],0) as [April_15], ISNULL([November_14],0) as [November_14], ISNULL([December_14],0) as [December_14], ISNULL([Total_Days_14_15],0) as Total_Days_14_15, ISNULL([Total_Days_13_14],0) as Total_Days_13_14,
	  ISNULL([Ski_Resort1_2014_2015],0) as [Ski_Resort1_2014_2015], ISNULL([Ski_Resort2_2014_2015],0) as [Ski_Resort2_2014_2015], ISNULL([Ski_Resort3_2014_2015],0) as [Ski_Resort3_2014_2015], ISNULL([Ski_Resort4_2014_2015],0) as [Ski_Resort4_2014_2015], ISNULL([Ski_Resort5_2014_2015],0) as [Ski_Resort5_2014_2015]
--select count(*)
INTO Cust_CO_2014_2015
FROM  [dbo].[Customer] as C LEFT JOIN v_Usage_Month_2014_2015 as UM
  ON C.CustId = UM.CustomerId  LEFT JOIN v_Usage_Resort_2014_2015 as UR
  ON C.CustId = UR.CustomerId LEFT JOIN [dbo].[v_Usage_Month_2013_2014] UM_13_14
  ON C.CustId = UM_13_14.CustomerId
WHERE C.StateProvinceCode = 'CO'

/*
select PostalCode, City, count(*)
FROM  [dbo].[v_Customer] as C
where [StateProvinceCode] = 'CO'
group by PostalCode, City
*/

--Use this to create the Customer table for just CO records
--select * into Customer  from v_Customer WHERE StateProvinceCode = 'CO'