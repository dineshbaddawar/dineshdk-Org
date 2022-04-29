public class AccountMappingWrapper {
    public String mobile_number; //7084615451
    public String name; //Sanchit
    public String email; //nil
    public cls_companies[] companies;
    public cls_subscriptions[] subscriptions;
    public cls_Contacts[] Contacts;
    
    public class cls_companies {
        public String mobile_number; //partner
        public String id; //daca9766-62d6-4af1-8a3c-871c6345d1ad
        public String name; //Ghanshyam enterprises
        public String Industry_Type; //nil
    }
    
    public class cls_address {
        public String city; //nil
        public String state; //nil
        public String pincode; //nil
        public String street_address; //nil
    }
    
    public class cls_subscriptions {
        public String id; //dfe7d54d-dea1-41c4-ba35-4e10bd58259d
        public String subscription_type; //silver
        public String activated_at; //2021-05-14T20:22:46.988+05:30
        public String expired_at; //2021-05-14T20:22:46.988+05:30
        public String amount; //0.471e3
    }
    
    
    public class cls_Contacts {
        public String id; //942cc430-a51a-4b61-9002-9733929f8956
        public String FirstName; //trial
        Public String LastName;
        public String Email; //2021-05-14T20:22:46.988+05:30
        public String Level; //2021-05-14T20:22:46.988+05:30
    }
    
    public static AccountMappingWrapper parse(String json){
        return (AccountMappingWrapper) System.JSON.deserialize(json, AccountMappingWrapper.class);
    }
}