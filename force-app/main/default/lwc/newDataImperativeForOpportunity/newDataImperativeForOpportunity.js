import { LightningElement,track } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityClass.getOpportunity';

export default class NewDataImperativeForOpportunity extends LightningElement {

    @track data;
    @track errors;
    @track columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Amount',fieldName:'Amount'},
        {label:'StageName',fieldName:'StageName'},
    ];

    connectedCallback(){
        getOpportunity()
        .then(result=>{
            this.data=result;
        })
        .catch(errors=>{
            this.error=error;
        })
    }
}