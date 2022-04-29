import { LightningElement,track,wire } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityClass.getOpportunity';

export default class NewDataTableWithWireOpportunity extends LightningElement {

    @track data;
    @track columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Stage',fieldName:'StageName'},
        {label:'Amount',fieldName:'Amount'},
    ];

    @wire(getOpportunity) getRecord({error,data}){
        if(data){
            this.data=data;
        } else if(error){
            this.data=undefined;
        }
    }
}