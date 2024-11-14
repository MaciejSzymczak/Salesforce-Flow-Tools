public class JSONUpdate {
    
/*
* @description Updates JSON. Used by the flow.
*  Provides 3 operations: 
*          get    : gets value for provided key
*          put    : creates new key/updates existing with provided values 
*          delete : deletes key
* 
* @author Maciej Szymczak
* @version 2024.11.14
*/    
    
    @InvocableMethod (label='updateJSON' description='Updates JSON. Provides 3 operations: get (gets value for provided key), put (creates new key/updates existing with provided values) and delete (deletes key)') 
    public static List<String> run(List<Params> params) {
        List<String> result = new List<String>();
        for (Params p : params) {
            String myString = p.jsonString;
            String opB = '[';
            String clB = ']';
            if (myString.startsWith(opB) && myString.endsWith(clB)) {
                myString = myString.substring(1, myString.length() - 1);
            } else {
                opB='';
                clB= '';
            }          
            Map<String, Object> tmp = (Map<String, Object>) JSON.deserializeUntyped( myString );
            if (p.operation.equalsIgnoreCase('get')) {
                String v = (String)tmp.get(p.key);
                result.add( v );
            }
            if (p.operation.equalsIgnoreCase('delete')) {
                tmp.remove( p.key );
                result.add( opB+JSON.Serialize(tmp)+clB );
            }
            if (p.operation.equalsIgnoreCase('put')) {
                tmp.put(p.key, p.value);
                result.add( opB+JSON.Serialize(tmp)+clB );
            }
            
        }
        return result; 
    }
    
    public  class Params {
        @InvocableVariable(required=true)
        public  String jsonString; 
        @InvocableVariable(required=true)
        public  String operation;
        @InvocableVariable(required=true)
        public  String key;
        @InvocableVariable(required=false)
        public  String value;
    } 
    
}