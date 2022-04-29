public class AccountPDFController {
    public AccountPDFController(ApexPages.StandardController controller) {
        Account acc = (Account)controller.getRecord();
        String accNum = acc.AccountNumber;
        //Assign "Account_[Ac].pdf" as a file name
        String fileName = 'Account_' + accNum + '.pdf';
        Apexpages.currentPage().getHeaders().put('content-disposition', 'attachment; filename=' + fileName);}}