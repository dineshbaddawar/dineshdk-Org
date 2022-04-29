@isTest
public class DatabaseMethod_1Test {

    @isTest
    public static void ChekTest(){
        Contact con = new Contact();
        con.LastName = 'test';
        con.LastName = 'Contact';
        insert con;
        test.startTest();
        DatabaseMethod_1.Data();
        test.stopTest();
        
    }
}