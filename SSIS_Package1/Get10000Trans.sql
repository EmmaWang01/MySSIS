

select top 10000
	rtm.RTM_ID as TransactionPK,
	rtm.RTM_DateC as ProcessDate,
	rtm.RTM_ValueCR as Credit,
	rtm.RTM_ValueDB as Debit,
	rtm.RTM_IDLink_RMR as LoanPK,
	ClientCMR.CMR_ID as ClientPK,
	BranchCMR.CMR_ID as BranchPK
from iO_Product_Transaction RTM

join iO_Link_MasterReference ClientLMR on rtm.RTM_IDLink_RMR=ClientLMR.LMR_IDLink_Code_ID
	and ClientLMR.LMR_IDLink_Association='{146afcaa-059b-469e-a000-0103e84144dc}' -- primaryBorrower
join iO_Client_MasterReference ClientCMR on ClientCMR.CMR_ID=ClientLMR.LMR_IDLink_CMR

join iO_Link_MasterReference BranchLMR on RTM.RTM_IDLink_RMR=BranchLMR.LMR_IDLink_Code_ID
	and BranchLMR.LMR_IDLink_Association='{b55145aa-2697-43b5-9c6a-c4a0960823d8}' -- owning branch
join iO_Client_MasterReference BranchCMR on BranchLMR.LMR_IDLink_CMR=BranchCMR.CMR_ID

order by newid()

--join iO_Product_MasterReference RMR on RMR.rmr_id=rtm.RTM_IDLink_RMR
--select * from iO_Control_LinkMaster where xlk_detail like '%Loan%Branch%'

--- Branches

select top 1 percent * from [tablename] order by newid()

select * from [tablename] tablesample(1 percent)