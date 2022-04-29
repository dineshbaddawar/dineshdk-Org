public class OpportunityAmountCheckHelper {

    public static void validate20KCondition(List<Opportunity> oppList){
        List<Account> accList=new List<Account>();
        for(Opportunity opp:oppList){
            Account acc=new Account();
            acc.Id=opp.AccountId;
            if(opp.Amount > 20000){
                acc.is_gold__c=true;
            }else{
                acc.is_gold__c=false;
            }
            accList.add(acc);
        }
        update accList;
    }
}