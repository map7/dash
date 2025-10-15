import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    url: String,
    login: String,
    password: String,
    app: String
  }
  
  send() {
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
