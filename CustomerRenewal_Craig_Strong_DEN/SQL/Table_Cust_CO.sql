IF OBJECT_ID('dbo.Cust_CO_2011') IS NOT NULL
DROP TABLE [dbo].[Cust_CO_2011]
GO

SELECT C.*
		, UM.[January], UM.[February], UM.[March], UM.[April], UM.[November], UM.[December],
		UR.[Ski_Resort1], UR.[Ski_Resort2], UR.[Ski_Resort3], UR.[Ski_Resort4], UR.[Ski_Resort5]
--select count(*)
INTO Cust_CO_2011
FROM  [dbo].[Customer] as C JOIN v_Usage_Month_2010 as UM
  ON C.CustId = UM.CustomerId JOIN v_Usage_Resort_2010 as UR
  ON C.CustId = UR.CustomerId
--WHERE C.PostalCode in ('80401','80403')
--WHERE C.City in ('Arvada','Boulder','Golden','Aurora')
WHERE C.StateProvinceCode = 'CO'

/*select count(distinct CustomerId) from DimCustomer
where PostalCode in ('80401','80403') and IsDeleted = 'False'

select PostalCode, City, count(*)
FROM  [dbo].[v_Customer] as C
where [StateProvinceCode] = 'CO'
group by PostalCode, City
*/

--select * into Customer  from v_Customer WHERE StateProvinceCode = 'CO'