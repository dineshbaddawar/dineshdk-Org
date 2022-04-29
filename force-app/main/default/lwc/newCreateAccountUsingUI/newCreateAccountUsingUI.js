import { LightningElement } from 'lwc';
import Account_Object from '@salesforce/schema/Account';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Phone from '@salesforce/schema/Account.Phone';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {createRecord} from 'lightning/uiRecordApi';
import {NavigationMixin} from 'lightning/navigation';

export default class NewCreateAccountUsingUI extends LightningElement {

    Name;
    Phone;

    handleChange(event){
        if(event.target.label=='Name'){
            this.Name=event.target.value;
        }
        if(event.target.label=='Phone'){
            this.Phone=event.target.value;
        }
    }

    createAccount(){
        const fields={};
        fields[Account_Name.fieldApiName] = this.Name;
        fields[Account_Phone.fieldApiName] = this.Phone;

        const recordInput = {apiName: Account_Object.objectApiName, fields};

        createRecord(recordInput)
        .then(account=>{
            this.accountId = account.id;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account Created',
                    variant: 'success',
                }),
            );

            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: account.id,
                    objectApiName: 'Account',
                    actionName: 'view'
                },
            });

        })
        .catch(error=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error While Creating Record',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
        });
    }
}