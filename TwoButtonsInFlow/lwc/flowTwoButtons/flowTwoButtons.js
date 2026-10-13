import { LightningElement, api } from 'lwc';
import { FlowAttributeChangeEvent, FlowNavigationNextEvent } from 'lightning/flowSupport';

export default class FlowTwoButtons extends LightningElement {
    @api button1Label;
    @api button2Label;
    @api button2DownloadUrl;
    // Optional - when set, button 1 only proceeds once this value is filled in (reactive screen input)
    @api button1RequiredValue;
    @api button1RequiredMessage;
    @api selectedButton;

    errorMessage;

    handleButton1() {
        if (this.button1RequiredMessage && !this.button1RequiredValue) {
            this.errorMessage = this.button1RequiredMessage;
            return;
        }
        this.select(this.button1Label);
    }

    handleButton2() {
        // Opened directly from the click so the browser does not block it as a pop-up;
        // the download response leaves the new tab empty and the browser closes it.
        if (this.button2DownloadUrl) {
            window.open(this.button2DownloadUrl, '_blank');
        }
        this.select(this.button2Label);
    }

    select(label) {
        this.errorMessage = undefined;
        this.selectedButton = label;
        this.dispatchEvent(new FlowAttributeChangeEvent('selectedButton', label));
        this.dispatchEvent(new FlowNavigationNextEvent());
    }
}