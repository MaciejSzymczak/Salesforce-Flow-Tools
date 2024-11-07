@isTest
public class JsonXPathTest {

    static testMethod void positiveTest1() {
        JsonXPath.Params x = new JsonXPath.Params();
        x.path = '//payload/actionMessages'; 
        x.json = '{"dateTime":"2024-02-07T09:48:20+00:00","identifier":{"system":"CISION_ONE","id":"2234"},"targetApplication":"CISION_ONE","payload":{"actionMessages":["base Email has already been taken","base Users is invalid"],"action":"creationFailed","customer":{"identifier":{"system":"SALESFORCE_EMEA","id":"0014J00000iJVjLQAW"},"address":{"country":"France","city":"Bayeux","postalCode":"14 400","line1":"4 Rue Genas duhomme,"},"phone":"0033772130249","gcid":"82600194004","name":"Bellaventura France (Adriatico)","users":[{"lastName":"Frampton","firstName":"Rosie","role":"Super user","email":"rosie@mprcommunications.co.uk"}],"email":"thomas@adriatico.fr"}},"parentEvent":{"system":"SALESFORCE_EMEA","id":"593793A"},"type":"Customer","version":"0.0.1"}';
        List<JsonXPath.Params> Params = new List<JsonXPath.Params> {x};
        List<String> res = JsonXPath.run(Params);        
        Assert.areEqual(res[0], 'base Email has already been taken,base Users is invalid');       
    }

    static testMethod void positiveTest2() {
        JsonXPath.Params x = new JsonXPath.Params();
        x.path = 'dateTime'; 
        x.json = '{"dateTime":"2024-02-07T09:48:20+00:00","identifier":{"system":"CISION_ONE","id":"2234"},"targetApplication":"CISION_ONE","payload":{"actionMessages":["base Email has already been taken","base Users is invalid"],"action":"creationFailed","customer":{"identifier":{"system":"SALESFORCE_EMEA","id":"0014J00000iJVjLQAW"},"address":{"country":"France","city":"Bayeux","postalCode":"14 400","line1":"4 Rue Genas duhomme,"},"phone":"0033772130249","gcid":"82600194004","name":"Bellaventura France (Adriatico)","users":[{"lastName":"Frampton","firstName":"Rosie","role":"Super user","email":"rosie@mprcommunications.co.uk"}],"email":"thomas@adriatico.fr"}},"parentEvent":{"system":"SALESFORCE_EMEA","id":"593793A"},"type":"Customer","version":"0.0.1"}';
        List<JsonXPath.Params> Params = new List<JsonXPath.Params> {x};
        List<String> res = JsonXPath.run(Params);        
        Assert.areEqual(res[0], '2024-02-07T09:48:20+00:00');       
    }
    
    
    static testMethod void negativeTest() {
        JsonXPath.Params x = new JsonXPath.Params();
        x.path = ''; 
        x.json = 'not recognized format';
        List<JsonXPath.Params> Params = new List<JsonXPath.Params> {x};
        List<String> res = JsonXPath.run(Params);        
        Assert.areEqual(res[0].substring(0,8), 'BAD FILE');       
    }

}