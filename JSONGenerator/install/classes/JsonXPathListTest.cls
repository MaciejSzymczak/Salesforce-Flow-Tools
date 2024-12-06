@isTest
public class JsonXPathListTest {

    static testMethod void positiveTest1() {
        JsonXPathList.Params x = new JsonXPathList.Params();
        x.path = 'OpportunityLineItems/records/Id'; 
        x.json = '{"dateTime":"2024-02-07T09:48:20+00:00","identifier":{"system":"CISION_ONE","id":"2234"},"targetApplication":"CISION_ONE","payload":{"actionMessages":["base Email has already been taken","base Users is invalid"],"action":"creationFailed","customer":{"identifier":{"system":"SALESFORCE_EMEA","id":"0014J00000iJVjLQAW"},"address":{"country":"France","city":"Bayeux","postalCode":"14 400","line1":"4 Rue Genas duhomme,"},"phone":"0033772130249","gcid":"82600194004","name":"Bellaventura France (Adriatico)","users":[{"lastName":"Frampton","firstName":"Rosie","role":"Super user","email":"rosie@mprcommunications.co.uk"}],"email":"thomas@adriatico.fr"}},"parentEvent":{"system":"SALESFORCE_EMEA","id":"593793A"},"type":"Customer","version":"0.0.1,", "OpportunityLineItems": {"totalSize": 4, "done": true,"records": [{"Id": "00kSq000001htDZIAY","OriginalUsage": 1,"RemainingUsage": 0},{"Id": "00kSq000001htDaIAI","OriginalUsage": 1,"RemainingUsage": 0},{"Id": "00kSq000001htDbIAI","OriginalUsage": 1,"RemainingUsage": 0},{"Id": "00kSq000001htDcIAI","OriginalUsage": 1,"RemainingUsage": 0}]}}';
        List<JsonXPathList.Params> Params = new List<JsonXPathList.Params> {x};
        List<List<String>> res = JsonXPathList.run(Params);        
    }
    
    
}