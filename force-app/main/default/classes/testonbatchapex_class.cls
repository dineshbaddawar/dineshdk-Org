@isTest
public class testonbatchapex_class {
    public static testmethod void myTestBatch(){
        Account a = new Account(Name='Testing');
        insert a;
        Account query = [select id,name from Account where Id=:a.Id];
        mybatchApex_Class instance = new mybatchApex_Class();
        test.startTest();
        database.executeBatch(instance,200);
        test.stopTest();
    }
}