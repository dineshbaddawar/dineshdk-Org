import { LightningElement,track } from 'lwc';
import SubtractMethod from '@salesforce/apex/NewSubtractionClass.SubtractMethod';

export default class NewSubtractionCalculator extends LightningElement {

  
    @track FirstNo;
    @track SecondNo;
    @track sub;
    @track errors;
    handleClick(){
        SubtractMethod({firstNumber:this.FirstNo,secondNumber:this.SecondNo})
        .then(result=>{
            this.sub = result;
        })
        .catch(error=>{
            this.errors= error;
        });
    }
    handleChange(event){
        if(event.target.name==='first'){
            this.FirstNo = event.target.value;
        }
        else if(event.target.name==='second'){
            this.SecondNo= event.target.value;
        }
    }

}