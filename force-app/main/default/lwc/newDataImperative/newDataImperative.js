import { LightningElement,track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class NewDataImperative extends LightningElement {
    @track data;
    @track errors;
    @track columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Phone',fieldName:'Phone'},
        {label:'Type',fieldName:'Type'},
        {label:'Industry',fieldName:'Industry'},
    ];

    connectedCallback(){
        getAccounts()
        .then(result=>{
            this.data= result;
        })
        .catch(error=>{
            this.errors=error;
        })
    }
}