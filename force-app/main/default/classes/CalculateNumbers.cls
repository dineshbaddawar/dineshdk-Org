public with sharing class CalculateNumbers {
    public CalculateNumbers() {

    }
    @AuraEnabled 
    public static integer getSumResult(integer firstNumber, integer secondNumber){
        return (firstNumber+secondNumber);
    }
}