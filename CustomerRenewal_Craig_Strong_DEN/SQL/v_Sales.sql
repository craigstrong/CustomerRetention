IF OBJECT_ID('dbo.v_Sales') IS NOT NULL
DROP VIEW [dbo].[v_Sales]
GO

-- Create a view.  
CREATE VIEW v_Sales  
AS  
SELECT S.[SourceSystemName], S.[Quantity], S.[Price], S.[HasResortCharge], S.[PriceInCorporateCurrency],
	   S.[TotalUsageDays], S.[PurchaserCustomerId], S.[ProductOwnerCustomerId], S.ProductId,
	   D.CalendarDate, Se.SeasonName, PP.ProductPackageName, L.LocationName, L.LocationType,
	   P.ProductClass, P.ProductFamily, P.ProductName, P.ProductType, C.CountryCode,
	   C.Age, C.City, C.[StateProvinceCode], C.[PostalCode], C.CustomerLifetimeSpend, C.Customer1YearSpend, C.Customer3YearSpend,
	   C.IsDeleted, C.[ThreeYearVisitCount], C.SkiAbility, C.[NearestMajorAirportCode], C.SkiLoyaltyIndexRating,
	   C.[IsWinterGuest], C.[IsSummerGuest], C.[FrontRangeMarket], C.CustomerId
--select count(*)
FROM [dbo].[MountainAccessSales] as S JOIN [dbo].[DimDate] as D
  ON S.SaleDateId = D.DateId JOIN [dbo].[DimSeason] as Se
  ON S.SeasonId = Se.SeasonId  LEFT JOIN [dbo].[v_Product] as P
  ON S.ProductId = P.ProductId LEFT JOIN [dbo].[DimProductPackage] as PP
  ON S.[ProductPackageId] = PP.ProductPackageId LEFT JOIN [dbo].[DimLocation] as L
  ON S.FulfillmentLocationId = L.[LocationId] JOIN [dbo].[DimCustomer] as C
  ON S.[ProductOwnerCustomerId] = C.CustomerId
WHERE C.IsDeleted = 'False'