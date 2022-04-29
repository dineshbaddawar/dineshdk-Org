public class AsyncExecutionExample implements Queueable {

    public void execute(QueueableContext bc){
        Account acc=new Account(Name='Instagram',Phone='(415) 555-1212');
        insert acc; 
        
        // job chaining of other job
        system.enqueueJob(new AsyncExecutionJobChaining());
    }
}