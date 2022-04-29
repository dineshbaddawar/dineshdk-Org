@isTest
public class AsyncExecutionExampleTest {

    public static testmethod void test1(){
        
        Test.startTest();
        system.enqueueJob(new AsyncExecutionExample());	
        Test.stopTest();
        
        Account acc=[Select Id,Name From Account Where Name='Acme' Limit 1];
        system.assertNotEquals(null, acc);
        system.assertEquals('Acme', acc.name);
    }
}