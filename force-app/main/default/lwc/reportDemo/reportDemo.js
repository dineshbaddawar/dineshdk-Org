import { LightningElement, wire, track } from 'lwc';
import getInFlightOpportunitiesCnt from 
    '@salesforce/apex/ReportController.getInFlightOpportunitiesCnt';
import getReportURLInFlightOpps from 
    '@salesforce/apex/ReportController.getReportURLInFlightOpps';

export default class TaskDashboardInFlightCnt extends LightningElement {
    @track inFlightOppsCnt;
    @track inFlightOppsReportURL;
    
    connectedCallback() {
        this.getCnt();
        this.getReportURL();
    }

    getCnt() {
        getInFlightOpportunitiesCnt() 
            .then(result => {
                this.inFlightOppsCnt = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.inFlightOppsCnt = undefined;
            }); 
    }
  
    getReportURL() {
        getReportURLInFlightOpps()
            .then(result => {
                this.error = undefined;
                this.inFlightOppsReportURL = result;
            }) 
            .catch(error => {
                this.error = error
                this.inFlightOppsReportURL = undefined;
            });
    }
}