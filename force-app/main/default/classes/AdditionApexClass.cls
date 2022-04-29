public with sharing class AdditionApexClass {
    public AdditionApexClass() {

    }
    @AuraEnabled 
    Public Static Integer AdditionMethod(Integer firstNumber, Integer SecondNumber){
        return (firstNumber + SecondNumber);
    }
}