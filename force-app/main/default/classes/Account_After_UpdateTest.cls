@isTest
public class Account_After_UpdateTest {

    @isTest
    public static void CheckData(){
        Account acc = new Account();
        acc.Name = 'Mukesh';
        acc.Rating = null;
        test.startTest();
        insert acc;
       
        Contact con = new Contact();
        con.LastName = 'test';
        con.AccountId = acc.Id;
        insert con;
        
        acc.Rating = 'Hot';
        update acc;
       // delete con;
        test.stopTest();
    }
    
    @isTest
    public static void CheckData1(){
       Account acc = new Account();
        acc.Name = 'Test';
        acc.Rating = 'Hot';
        test.startTest();
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'test';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        opp.AccountId = acc.Id;
        insert opp;
        
        acc.Rating = 'Warm';
        update acc;
        test.stopTest();
    }
}