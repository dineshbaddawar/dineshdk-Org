public with sharing class OpportunityClass {
    public OpportunityClass() {

    }
    @AuraEnabled(cacheable=true)
    public Static List<Opportunity> getOpportunity(){
        return [Select Id,Name,Amount,StageName From Opportunity Limit 10];
    }
}