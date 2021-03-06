/****** Script for SelectTopNRows command from SSMS  ******/

with c as
(
SELECT [TransactionPK]
      ,[ProcessDate]
      ,[Credit]
      ,[Debit]
      ,[LoanPK]
      ,[ClientPK]
      ,[BranchPK]
	  ,ROW_NUMBER() over(partition by [TransactionPK] order by [TransactionPK]) as 'RowNo'
  FROM [MyTestDB].[dbo].[SSIS_FactTrans]
 )
 
 select * from c where RowNo>1 

 truncate table  [MyTestDB].[dbo].[SSIS_FactTrans]

 SELECT TOP 100 *
FROM [MyTestDB].[dbo].[SSIS_FactTrans]
ORDER BY RAND(CHECKSUM(*) * RAND())


