@isTest
public class Opportunity_Update_1Test {

    @isTest
    public static void Method(){
        Opportunity opp = new Opportunity();
        opp.Name = 'test';
        opp.CloseDate = system.today();
        opp.StageName = 'Prospecting';
        insert opp;
        opp.Amount = 900;
        opp.Description = 'updated';
        opp.StageName = 'Closed Won';
        update opp;
    }
}