IF OBJECT_ID('dbo.v_Usage') IS NOT NULL
DROP VIEW [dbo].[v_Usage]
GO

-- Create a view.  
CREATE VIEW v_Usage  
AS  
SELECT U.[SourceSystemName], U.UsageCount, U.UsageValue, U.[HasResortCharge], U.[CustomerId], U.ProductId,
	   D.CalendarDate, Se.SeasonName, PP.ProductPackageName, L.LocationName, L.LocationType,
	   P.ProductClass, P.ProductFamily, P.ProductName, P.ProductType
--select count(*)
FROM [dbo].[MountainAccessUsage] as U JOIN [dbo].[DimDate] as D
  ON U.UsageDateId = D.DateId JOIN [dbo].[DimSeason] as Se
  ON U.SeasonId = Se.SeasonId  LEFT JOIN [dbo].[DimProductPackage] PP
  ON U.ProductPackageId = PP.ProductPackageId LEFT JOIN [dbo].[v_Product] as P
  ON U.ProductId = P.ProductId LEFT JOIN [dbo].[DimLocation] as L
  ON U.UsageLocationId = L.[LocationId]
