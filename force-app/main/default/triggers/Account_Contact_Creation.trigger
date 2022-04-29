trigger Account_Contact_Creation on Account (after insert) {

    // Creates the number of contacts which are equal to the Number of Locations field on the Account Object.
   // 100% Code Coverage
    List<Contact> conList=new List<Contact>();
    Map<Id,Decimal> AccMap=new Map<Id,Decimal>();
    
    for(Account acc:trigger.new){
        AccMap.put(acc.Id,acc.Number_of_Locations__c);
    }
    
    if(AccMap.size()> 0 && AccMap !=null){
        for(Id accId:AccMap.keySet()){
            for(Integer i=0;i<AccMap.get(accId);i++){
                Contact con=new Contact();
                con.accountId=accId;
                con.LastName='AccContact'+i;
                conList.add(con);
            }
        }
    }
    if(conList.size()> 0 && conList !=null){
        insert  conList;
    }
}