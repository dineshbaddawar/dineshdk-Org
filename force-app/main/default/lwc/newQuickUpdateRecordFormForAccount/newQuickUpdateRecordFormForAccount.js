import { LightningElement,api } from 'lwc';
import Acccount_Name from '@salesforce/schema/Account.Name';
import Account_Email from '@salesforce/schema/Account.Phone';
import Account_Site from '@salesforce/schema/Account.Site';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class NewQuickUpdateRecordFormForAccount extends LightningElement {

    @api recordId;
    @api objectApiName;
    fields=[Acccount_Name,Account_Email,Account_Site];

    handleAccountUpdate(event){
        // Run code when the record is created
        const evt=new ShowToastEvent({
            title: 'Account Updated',
            message: 'Account Created:'+event.detail.fields.Name.value+" is Successfully Updated",
            variant: 'success'
        });
        this.dispatchEvent(evt);
    }
}