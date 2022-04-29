trigger U_RecersiveTrigger_Contact on Contact (after insert) {

    // Recursive Trigger
    /*
    if(trigger.isAfter && trigger.isInsert){
        Contact con=new Contact(FirstName='Ajeet',LastName='Agarkar');
        insert con;
    }
    */
    // Solution for Recursive Trigger
    
    if(trigger.isInsert && trigger.isAfter){
        
        if(U_RecersiveTrigger_Contact_Handler.condition){
            U_RecersiveTrigger_Contact_Handler.condition=false;
            Contact con=new Contact(FirstName='Amar',LastName='Singh');
            insert con;
        }
    }
}