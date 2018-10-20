IF OBJECT_ID('dbo.v_Customer') IS NOT NULL
DROP VIEW [dbo].[v_Customer]
GO

-- Create a view.  
CREATE VIEW v_Customer  
AS  
SELECT C.Age, C.[StateProvinceCode], /*C.City, C.[PostalCode],*/ C.CustomerLifetimeSpend, C.Customer1YearSpend, C.Customer3YearSpend,
	   /*C.IsDeleted, C.[NearestMajorAirportCode], */ ISNULL(C.[ThreeYearVisitCount],0) as [ThreeYearVisitCount], /*C.SkiAbility,*/ ISNULL(C.SkiLoyaltyIndexRating,0) as SkiLoyaltyIndexRating,
	   /*C.[IsWinterGuest], C.[IsSummerGuest],*/ ISNULL(C.[FrontRangeMarket],1) as [FrontRangeMarket] , C.CustomerId as CustId, 
	   ISNULL(CNP.[Winter 2010/2011],0) as [Spend_Winter_2010],
	   ISNULL(CNP.[Winter 2011/2012],0) as [Spend_Winter_2011],
	   ISNULL(CNP.[Winter 2012/2013],0) as [Spend_Winter_2012],
	   ISNULL(CNP.[Winter 2013/2014],0) as [Spend_Winter_2013],
	   ISNULL(CNP.[Winter 2014/2015],0) as [Spend_Winter_2014],
	   ISNULL(CNP.[Winter 2015/2016],0) as [Spend_Winter_2015],
	   HH.[Household1YearSpend], HH.[Household3YearSpend], HH.[HouseholdLifetimeSpend], /*HH.[HouseholdIncome],*/
	   ISNULL(HH.[NumberOfHouseholdMembers],1) as [NumberOfHouseholdMembers], ISNULL(HH.[NumberOfAdults],1) as [NumberOfAdults], 
	   ISNULL(HH.[NumberOfChildren],0) as [NumberOfChildren], /*HH.[CreateDate] as [HouseholdCreateDate],*/
	   CASE WHEN CP.[Winter 2010/2011] >= 1 THEN 1 ELSE 0 END as [Pass_Winter_2010],
	   CASE WHEN CP.[Winter 2011/2012] >= 1 THEN 1 ELSE 0 END as [Pass_Winter_2011],
	   CASE WHEN CP.[Winter 2012/2013] >= 1 THEN 1 ELSE 0 END as [Pass_Winter_2012],
	   CASE WHEN CP.[Winter 2013/2014] >= 1 THEN 1 ELSE 0 END as [Pass_Winter_2013],
	   CASE WHEN CP.[Winter 2014/2015] >= 1 THEN 1 ELSE 0 END as [Pass_Winter_2014],
	   CASE WHEN CP.[Winter 2015/2016] >= 1 THEN 1 ELSE 0 END as [Pass_Winter_2015],
	   CPT.*
FROM [dbo].[DimCustomer] as C JOIN [dbo].[v_Customer_Pass] as CP
  ON C.CustomerId = CP.[CustomerId] LEFT JOIN [dbo].[v_Customer_non_Pass] as CNP
  ON C.CustomerId = CNP.[CustomerId] JOIN [dbo].[DimHousehold] as HH
  ON C.HouseholdId = HH.HouseholdId LEFT JOIN [dbo].[v_Customer_Pass_Timing] as CPT
  ON C.CustomerId = CPT.CustomerId