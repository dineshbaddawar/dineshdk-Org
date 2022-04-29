@isTest
public class DuplicateEmailsInLeadTest {

    @isTest
    public static void TestData(){
        Lead led = new Lead();
        led.LastName = 'Test';
        led.Email = 'dbaddawar123@gmail.com';
        led.Company = 'Salesforce';
        led.Status = 'Open - Not Contacted	';
        insert led;
    }
}