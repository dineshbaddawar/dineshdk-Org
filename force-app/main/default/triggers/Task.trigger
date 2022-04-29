trigger Task on Task (before insert) {

   List<Lead> LeadList = [SELECT Id,LastName,(SELECT WhoId,Status FROM Tasks Where Status='Not Started') FROM Lead];
  
}