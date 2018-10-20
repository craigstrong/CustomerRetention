USE [BIDataMarts2];  
GO  

IF OBJECT_ID('dbo.v_Product') IS NOT NULL
DROP VIEW [dbo].[v_Product]
GO

-- Create a view.  
CREATE VIEW v_Product  
AS  
SELECT PF.ProductFamily, PC.ProductClass, PT.ProductType, P.ProductId, P.ProductName, P.SourceSystemName
FROM [dbo].[DimProductFamily] as PF JOIN [dbo].[DimProductClass] as PC
  ON PF.ProductFamilyId = PC.ProductFamilyId JOIN [dbo].[DimProductType] as PT
  ON PC.ProductClassId = PT.ProductClassId and PC.ProductFamilyId = PT.ProductFamilyId JOIN [dbo].[DimProduct] AS P
  ON PT.ProductClassId = P.ProductClassId and PT.ProductFamilyId = P.ProductFamilyId AND PT.ProductTypeId = P.ProductTypeId 
 ;