import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    id: String,
    url: String,
    login: String,
    password: String,
    app: String
  }
  
  send() {

    if (this.appValue == ""){
      let url = window.location.href.replace("dashboard","accesses/" + this.idValue + "/edit");
      alert("Please fill in auth login method and credentials, then retry");
      window.location.replace(url);
      
    } else if (this.appValue == 'None') {
      window.open(this.urlValue, '_blank').focus();

    } else if (this.appValue != 'None' & this.loginValue == "" & this.passwordValue == "" ){
      let url = window.location.href.replace("dashboard","accesses/" + this.idValue + "/edit");
      alert("Please fill in login & password in the next screen, then retry");
      window.location.replace(url);
      
    } else if (this.appValue == 'Basic Auth' ){
      let url = this.urlValue.replace("//", "//" + this.loginValue + ":"  + this.passwordValue + "@");
      window.open(url, '_blank').focus();
    } else {

      console.log("app: " + this.appValue);
      
      // alert("url: " + this.urlValue + "\n" +
      //       "login: " + this.loginValue + "\n" +
      //       "password: " + this.passwordValue + "\n" + 
      //       "app: " + this.appValue + "\n" );

      window.postMessage({ type: "DASH",
                         url: this.urlValue,
                         login: this.loginValue,
                         password: this.passwordValue,
                         app: this.appValue
                       }, "*");

    }
    
   
  }
}
