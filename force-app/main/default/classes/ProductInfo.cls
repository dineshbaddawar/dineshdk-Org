public class ProductInfo {
   public string prodName;
   public decimal prodPrice;
   public decimal quantity;
   public decimal total;
    public ProductInfo(string name,decimal price){
       prodName=name;
       prodPrice=price;
        quantity=10;
    }
    public void calculate(){
        total=prodPrice*quantity;
        system.debug('Quantity:'+quantity);
        system.debug('Price:'+prodPrice);
        system.debug('Total:'+total);
    }
}