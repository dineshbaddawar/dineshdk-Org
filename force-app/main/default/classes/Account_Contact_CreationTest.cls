@isTest
public class Account_Contact_CreationTest {

    @isTest
    public static void Method(){
        Account acc = new Account();
        acc.Name = 'Test';
        acc.Number_of_Locations__c = 2;
        test.startTest();
        insert acc;
        test.stopTest();
    }
}