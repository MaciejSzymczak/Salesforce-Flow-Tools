({    invoke : function(component, event, helper) {
        
        var url = component.get("v.URL");
        var doneFlag = false;
        
        if (url.startsWith("/apex/")) {
           //alert('CSRF Protection');
           var apexPage = url.substring(6,url.indexOf("?"));
           url = url.substring(url.indexOf("?"));
            
           var action = component.get("c.CSRFUrl");
           action.setParams({
               "apexPage": apexPage
           });
            
           function waitForAsyncCall(){
               return new Promise(function(resolve, reject){
                  try {

                       action.setCallback(this, function(response) {
                            
                            var state = response.getState();
                            if(state == "SUCCESS" && component.isValid()){
                                var CSRFUrl = response.getReturnValue();
                                var eUrl= $A.get("e.force:navigateToURL");
                                eUrl.setParams({
                                    "url": CSRFUrl+url 
                                });
                                eUrl.fire();  
                            }
                            else{
                                alert("fail:" + response.getError()[0].message); 
                            }
                           doneFlag = true;
                       });
                       $A.enqueueAction(action);
                      
                     resolve();
                  } catch(e){
                     reject();
                  }
               });
           } 
            
           waitForAsyncCall()
              .then(function(){})
              .catch(function(){
                 alert('Whoops! Something went wrong.');
               });            
            
        } else {
            //alert('Regular call - No CSRF Protection');
            var eUrl= $A.get("e.force:navigateToURL");
            eUrl.setParams({
                "url": url 
            });
            eUrl.fire();  
        } 

    }
  
})