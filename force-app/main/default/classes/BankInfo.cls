public class BankInfo {

    public string bankName;  
    public decimal bankPrice; 
    public decimal bankQuantity; 
    public decimal banktotal; 
    public BankInfo(string name,decimal price){
        bankName=name;
        bankPrice=price;
        bankQuantity=20;
    }
    public void calculate(){
        bankTotal=bankPrice+bankQuantity;
        system.debug('Quantity:'+bankQuantity);
        system.debug('Price:'+bankPrice);
        system.debug('Total:'+banktotal);
        
    }
}