trigger Contact_Duplicate_Trigger on Contact (before insert) {

    
    /*
    // Write a trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.
    // Method 1
    List<String> EmailSet=new List<String>();
    List<String> PhoneSet=new List<String>();
    
    for(Contact con:trigger.new){
        EmailSet.add(con.Email);
        PhoneSet.add(con.Phone);
    }
    
    List<Contact> conList=[Select Id,Email,Phone From Contact Where Email IN:EmailSet AND Phone IN:PhoneSet];
    
    for(Contact con:trigger.new){
        if(conList.size()>0){
            con.addError('Duplicate Email & Phone found while inserting The Contact');
        }
    }
     */
    
    // Method 2
    Set<String> setEmailPhoneKeys = new Set<String>();
    Set<String> SetEmail = new Set<String>();
    Set<String> SetPhone = new Set<String>();
    
    for(Contact conObj : trigger.new){
        if(conObj.Email !=null && conObj.Phone !=null){
            SetEmail.add(conObj.Email);
            SetPhone.add(conOBj.Phone);
        }
    }
    
    for(Contact conList:[Select Phone,Email From Contact Where Phone IN:SetPhone AND Email IN:SetEmail]){
        setEmailPhoneKeys.add(conList.Email + '-' +conList.Phone);
    }
    
    for(Contact con:trigger.new){
        if(con.Email !=null && con.Phone !=null){
            String Key = con.Email + '-' +con.Phone;
            if(setEmailPhoneKeys.contains(Key)){
                con.addError('Duplicate Contact Exists !');
            }
        }
    }
    
}