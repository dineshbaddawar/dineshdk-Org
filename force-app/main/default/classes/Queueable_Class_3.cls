public class Queueable_Class_3 implements Queueable {

    public void Execute(QueueableContext bc){
        List<Contact> conList=[Select Id,Email From Contact];
        for(Contact con:conList){
            if(con.Email==null){
                con.Email='dineshbaddawar@gmail.com';
            }
        }
        update conList;
    }
}