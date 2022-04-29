import { LightningElement } from 'lwc';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Type from '@salesforce/schema/Account.Type';
import Account_Industry from '@salesforce/schema/Account.Industry';
export default class AccountCreateLWC extends LightningElement {
    objectApiName= 'Account';
    fieldList= [Account_Name,Account_Type,Account_Industry];
    handleAccount(event){

    }
}