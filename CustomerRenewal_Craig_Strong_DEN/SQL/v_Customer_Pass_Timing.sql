IF OBJECT_ID('dbo.v_Customer_Pass_Timing') IS NOT NULL
DROP VIEW [dbo].[v_Customer_Pass_Timing]
GO

-- Create a view.  
CREATE VIEW v_Customer_Pass_Timing 
AS  
--select top 100 [CustomerId], SeasonName, year(CalendarDate), month([CalendarDate]),
select [CustomerId],
	CASE WHEN year(CalendarDate) = '2014' and month([CalendarDate]) in ('1','2','3','4') THEN 1 ELSE 0 END AS Early_Purchase_2014_2015,
	CASE WHEN year(CalendarDate) = '2014' and month([CalendarDate]) in ('5','6','7','8','9') THEN 1 ELSE 0 END AS Regular_Purchase_2014_2015, 
	CASE WHEN year(CalendarDate) = '2014' and month([CalendarDate]) in ('10','11','12') THEN 1 ELSE 0 END AS Late_Purchase_2014_2015,
	CASE WHEN year(CalendarDate) = '2015' THEN 1 ELSE 0 END AS Super_Late_Purchase_2014_2015 
from v_Sales where ProductFamily = 'Paid Pass' and SeasonName = 'Winter 2014/2015' AND IsDeleted = 'False'
--and StateProvinceCode = 'CO' 