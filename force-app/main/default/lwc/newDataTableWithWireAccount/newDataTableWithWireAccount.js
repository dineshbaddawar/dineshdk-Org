import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class NewDataTableWithWireAccount extends LightningElement {
    @track data;
    @track columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Phone',fieldName:'Phone'},
        
    ];

    @wire(getAccounts) getAccount({error,data}){
        if(data){
            this.data=data;
        }else if(error){
            this.data=undefined;
        }
    }
}