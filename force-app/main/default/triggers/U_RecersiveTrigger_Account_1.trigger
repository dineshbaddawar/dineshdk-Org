trigger U_RecersiveTrigger_Account_1 on Account (after insert) {

    // Recursion Example- it will run in infinite lopp
    
    if(trigger.isAfter && trigger.isInsert){
        Account acc=new Account(Name='Account 1');
        insert acc;
    }
   
    
    /*
    // Solution of Recursion Trigger
    if(trigger.isInsert && trigger.isAfter){
        
        if(U_RecersiveTriggerHandler.Condition){
            U_RecersiveTriggerHandler.Condition=false;
            Account acc=new Account(Name='Test Account');
            insert acc;
        }
    }
    */
}