public class AccountRelatedContacts {
    public list<account> acc{get;set;}
    public AccountRelatedContacts(){
        acc = new list<account>();
        acc = [select name,(select id,lastname,email,phone,accountid from contacts) from account];
    }
}