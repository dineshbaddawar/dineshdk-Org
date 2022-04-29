public class dmloperation_apexclass {
List<Account> accs = new List<Account>();
    public void myInsertionRec(){
         Account a1 = new Account(Name='NareshIT',Industry='Education');
         Account a2 = new Account(Name='DurgaSoft',Industry='Finance');
         Account a3 = new Account(Name='Satya',Industry='Entertainment');
         Account a4 = new Account(Name='Capital',Industry='Education');
         Account a5 = new Account(Name='SuryaTechsolve',Industry='Biotechnology');
        accs.add(a1);
        accs.add(a2);
        accs.add(a3);
        accs.add(a4);
        accs.add(a5);
        Insert accs;  
    }
}