@isTest
public class AsyncExecutionJobChainingTest {

    public static testmethod void test1(){
        Test.startTest();
        system.enqueuejob(new AsyncExecutionJobChaining());
        Test.stopTest();
        
        Account Acc=[Select id,Name,Phone From Account Where Name='Facebook'];
        system.assertNotEquals(null, Acc);
        system.assertEquals('Facebook', Acc.Name);
    }
}