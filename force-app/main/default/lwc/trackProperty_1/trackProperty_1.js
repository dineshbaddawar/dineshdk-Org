import { LightningElement,track } from 'lwc';

export default class TrackProperty_1 extends LightningElement {

    @track name;
    @track location;
    @track phone;

    handleName(event){
        this.name=event.target.value;
    }

    handlePhone(event){
        this.phone=event.target.value;
    }

    handleLocation(event){
        this.location=event.target.value;
    }
    
}