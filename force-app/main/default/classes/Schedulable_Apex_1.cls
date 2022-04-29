public class Schedulable_Apex_1 implements Schedulable {

    public void Execute(SchedulableContext bc){
        List<Opportunity> oppList=[Select Id,Amount From Opportunity];
        for(Opportunity opp:oppList){
            if(opp.Amount ==null){
            }
        }
        delete oppList;
    }
}