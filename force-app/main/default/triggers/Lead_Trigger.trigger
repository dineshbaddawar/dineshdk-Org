trigger Lead_Trigger on Lead (before insert) {

    // When ever Lead is created with LeadSource as Web then give rating as cold otherwise hot.
    for(Lead le:trigger.new){
        if(le.LeadSource=='Web'){
            le.Rating='Cold';
        }else{
            le.Rating='Hot';
        }
    }
}