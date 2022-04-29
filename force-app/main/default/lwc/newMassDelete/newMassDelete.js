import { LightningElement,wire,track } from 'lwc';
import getContactList from '@salesforce/apex/MassDeleteContacts.getContactList';
import DeleteSelectedContact from '@salesforce/apex/MassDeleteContacts.DeleteSelectedContact';
import { refreshApex } from '@salesforce/apex';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class NewMassDelete extends LightningElement {

    @wire(getContactList) contacts;
    @track ContactIdList=[];
    @track message;
    @track columns=[
        {label:'FirstName',fieldName:'FirstName'},
        {label:'LastName',fieldName:'LastName'}
    ];

    deleteRecords(){

        DeleteSelectedContact({ContactIdList:this.ContactIdList})
        .then(result=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Selected Contacs are deleted',
                    variant: 'success',
                }),
            );

            // for clearing selected row index
            this.template.querySelector('lightning-datatable').selectedRows = [];
            return refreshApex(this.contacts);
        })
        .catch(error=>{
            this.message=undefined;
            this.error=error;
            this.dispatchEvent(
                new ShowToastEvent({
                    title:'Error',
                    message:'error.body.pageErrors[0].message',
                    variant: 'error',
                }),
            );
        });

    }
    prepareSelectedRows(event){
        const selectedRows=event.detail.selectedRows;
        this.ContactIdList=[];
        for(let i = 0; i<selectedRows.length; i++){
            this.ContactIdList.push(selectedRows[i].Id);
        }
        console.log(this.ContactIdList);
    }
}