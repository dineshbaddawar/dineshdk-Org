public class DebugingPrintAH {

    public static void DeleteData(){
        
        List<Account> accList=[Select Id,Name From Account];
        
        Set<Id> IdSet=new Set<Id>();
        List<Account> accToBedeleted = new List<Account>();
        for(Account acc:accList){
            System.debug('acc.Name.Length()>>'+acc.Name.Length());
            if(acc.Name.Length()<10){
                accToBedeleted.add(acc);
            }
        }
        system.debug('The Deleted Record Size: '+accToBedeleted.size());
        delete accToBedeleted;
       
    }
}