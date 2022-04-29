@isTest
public class accountdescription_test {
    public static testmethod void myTestForacc(){
        List<Account> accs = new List<Account>();
        for(Integer i=0;i<200;i++){
            Account a = new Account(name='Testing',Industry='Education');
            accs.add(a);
        }
        insert accs;
        List<Account> inserted_accs = [select Id,name,Description from Account where ID IN:accs];
        for(Account a1:inserted_accs){
            system.assertEquals(a1.Description, 'Education Industry');
        }
    }
}