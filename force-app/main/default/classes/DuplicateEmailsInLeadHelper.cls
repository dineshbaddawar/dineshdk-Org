public class DuplicateEmailsInLeadHelper {
// 100% Code Coverage
    public Static void UpdateInsertedLead(List<Lead> LeadObjList){
        Set<String> LeadSet=new Set<String>();
        List<Lead> LeadObj=new List<Lead>();
        List<Lead> LeadList=[Select id,Email,Phone From Lead Where Email !=null];
        system.debug('LeadList>>'+LeadList);
        for(Lead d1:LeadList){
            LeadSet.add(d1.Email);
        }
        
        for(Lead d2:LeadObjList){
            if(LeadSet.Contains(d2.Email)){
                d2.addError('Duplicate Email Found In The Database');
            }
        }
    }
}