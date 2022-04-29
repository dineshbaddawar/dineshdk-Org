public class Example12 {

    public decimal calculate(integer age,decimal exp){
        decimal salary ,bonus,total;
        if(age > 40 && exp > 10){
            salary=50000;
            bonus=1000;
        }else{
            salary=30000;
            bonus=500;
        }
        total=salary+bonus;
        return total;
    }
}