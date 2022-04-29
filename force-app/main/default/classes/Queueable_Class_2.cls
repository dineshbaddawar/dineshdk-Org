public class Queueable_Class_2 implements Queueable {

    public void execute(QueueableContext bc){
        Account acc=new Account();
        acc.name='Rahmanullah Gurbaz';
        insert acc;
    }
}