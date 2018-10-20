IF OBJECT_ID('dbo.v_Customer_non_Pass') IS NOT NULL
DROP VIEW [dbo].[v_Customer_non_Pass]
GO

-- Create a view.  
CREATE VIEW v_Customer_non_Pass 
AS  
select * from (select [CustomerId], SeasonName,  [Price] from v_Sales where IsDeleted = 'False' and ProductFamily <> 'Paid Pass') src 
pivot ( sum([Price]) for SeasonName in ([Winter 2010/2011] , [Winter 2011/2012] , [Winter 2012/2013] , [Winter 2013/2014] , [Winter 2014/2015], [Winter 2015/2016])) piv
