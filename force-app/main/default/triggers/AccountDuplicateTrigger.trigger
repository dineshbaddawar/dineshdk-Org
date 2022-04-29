trigger AccountDuplicateTrigger on Account (before insert,before update) {
 /*
    // Method 2
    
    List<String> accList=new List<String>();
    for(Account acc:trigger.new){
        accList.add(acc.Name);
    }
    
    List<Account> ListOfDuplicateAccount=[Select Id,Name From Account Where Name IN:accList];
    for(Account acc1:trigger.new){
        if(trigger.isInsert){
            if(ListOfDuplicateAccount.size()!=0){
                acc1.addError('Duplicate Account Found In the Database');
            }
        }
        
        if(trigger.isUpdate){
            for(Account oldAccount:trigger.old){
                if(acc1.Name !=oldAccount.Name && ListOfDuplicateAccount.size() !=0){
                    acc1.addError('Account Already Exist In The Database');
                }
            }
        }
    }
   */
    
   Set<String> SetName = new Set<String>();
    for(Account acc:trigger.new){
        SetName.add(acc.Name);
    }

    if(SetName.size()>0){
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name IN:SetName];
        Map<String,Account> MapNameWiseAccount = new Map<String,Account>();
        for(Account acc:accList){
            MapNameWiseAccount.put(acc.Name,acc);
        }

        For(Account acc:trigger.new){
            if(MapNameWiseAccount.containsKey(acc.Name)){
                acc.Name.addError('While Inserting & Updating Account Name is already present in the database');
            }
        }
    }
}