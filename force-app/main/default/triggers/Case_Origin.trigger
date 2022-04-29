trigger Case_Origin on Case (before insert) {

    // When ever a case is created with origin as email then set status as new and Priority as Medium.
    for(Case ca:trigger.new){
        if(ca.Origin=='Email'){
            ca.status='Working';
            ca.priority='Low';
        }
    }
}