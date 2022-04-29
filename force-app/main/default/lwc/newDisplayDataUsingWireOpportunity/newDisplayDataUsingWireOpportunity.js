import { LightningElement,track,wire } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityClass.getOpportunity';

export default class NewDisplayDataUsingWireOpportunity extends LightningElement {

    @track data;
    @wire(getOpportunity) getOpportunity({error,data}){
        if(data){
            this.data=data;
        }else if(error){
            this.data=undefined;
        }
    }
}