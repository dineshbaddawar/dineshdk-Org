public class Queueable_Class_1 implements Queueable {

    public void execute(QueueableContext bc){
        List<Account> accList=[Select Id,Phone From Account];
        for(Account acc:accList){
            if(acc.phone==null){
                acc.phone='9890000000';
            }
        } update accList;
       
     system.enqueueJob(new Queueable_Class_2());
    }
     }