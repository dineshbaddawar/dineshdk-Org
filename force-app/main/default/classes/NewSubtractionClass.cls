public with sharing class NewSubtractionClass {
    public NewSubtractionClass() {

    }
    @AuraEnabled 
    Public static Integer SubtractMethod(Integer firstNumber,Integer secondNumber){
        return (firstNumber - secondNumber);
    }
}