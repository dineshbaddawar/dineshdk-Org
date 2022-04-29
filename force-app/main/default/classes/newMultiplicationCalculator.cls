public with sharing class newMultiplicationCalculator {
    public newMultiplicationCalculator() {

    }
    @AuraEnabled 
    Public Static Integer MultiplicationMethod(Integer First,Integer Second){
        return (First * Second);
    }
}