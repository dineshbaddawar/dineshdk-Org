@isTest
public class ApexBatchTest {

    @isTest 
    public static void Method(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.Amount =null;
        opp.CloseDate = System.today();
        opp.StageName = 'Prospecting';
        insert opp;
 
        test.startTest();
        Database.executeBatch(new ApexBatch());
        test.stopTest();
    }
}