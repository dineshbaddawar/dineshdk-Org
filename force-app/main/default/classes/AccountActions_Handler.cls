public class AccountActions_Handler {

    public static void CreateContacts(list<account> accountList){
        list<contact> contactList = new list<contact>();
        for(Account actobj :accountList){
            contact contactobj= new contact ();
            contactobj.AccountId = actobj.id;
            contactobj.LastName = actobj.Name;
            contactList.add(contactobj);
        }
        if(!contactList.isEmpty()){
            insert contactList;
        }
    }
   
}