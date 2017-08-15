/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [TransactionPK]
      ,[ProcessDate]
      ,[Credit]
      ,[Debit]
      ,[LoanPK]
      ,[ClientPK]
      ,[BranchPK]
  FROM [MyTestDB].[dbo].[SSIS_FactTrans]


  DELETE FROM [MyTestDB].[dbo].[SSIS_FactTrans]
WHERE [TransactionPK] IN 
(
  SELECT TOP 10195 
    [TransactionPK] 
  FROM [MyTestDB].[dbo].[SSIS_FactTrans]
  
)