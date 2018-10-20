IF OBJECT_ID('dbo.v_Customer_Pass') IS NOT NULL
DROP VIEW [dbo].[v_Customer_Pass]
GO

-- Create a view.  
CREATE VIEW v_Customer_Pass 
AS  
select * from (select [CustomerId], SeasonName, 1 as Pass from v_Sales where IsDeleted = 'False' and ProductFamily = 'Paid Pass') src 
pivot ( sum(Pass) for SeasonName in ([Winter 2010/2011] , [Winter 2011/2012] , [Winter 2012/2013] , [Winter 2013/2014] , [Winter 2014/2015], [Winter 2015/2016])) piv
