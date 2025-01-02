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
                if ( String.IsNotBlank(p.key2) ) tmp.remove( p.key2 );
                if ( String.IsNotBlank(p.key3) ) tmp.remove( p.key3 );
                if ( String.IsNotBlank(p.key4) ) tmp.remove( p.key4 );
                if ( String.IsNotBlank(p.key5) ) tmp.remove( p.key5 );
                if ( String.IsNotBlank(p.key6) ) tmp.remove( p.key6 );
                if ( String.IsNotBlank(p.key7) ) tmp.remove( p.key7 );
                if ( String.IsNotBlank(p.key8) ) tmp.remove( p.key8 );
                if ( String.IsNotBlank(p.key9) ) tmp.remove( p.key9 );
                if ( String.IsNotBlank(p.key10) ) tmp.remove( p.key10 );
                result.add( opB+JSON.Serialize(tmp)+clB );
            }
            if (p.operation.equalsIgnoreCase('put')) {
                tmp.put(p.key, p.value);
                if ( String.IsNotBlank(p.key2) ) tmp.put(p.key2, p.value2);
                if ( String.IsNotBlank(p.key3) ) tmp.put(p.key3, p.value3);
                if ( String.IsNotBlank(p.key4) ) tmp.put(p.key4, p.value4);
                if ( String.IsNotBlank(p.key5) ) tmp.put(p.key5, p.value5);
                if ( String.IsNotBlank(p.key6) ) tmp.put(p.key6, p.value6);
                if ( String.IsNotBlank(p.key7) ) tmp.put(p.key7, p.value7);
                if ( String.IsNotBlank(p.key8) ) tmp.put(p.key8, p.value8);
                if ( String.IsNotBlank(p.key9) ) tmp.put(p.key9, p.value9);
                if ( String.IsNotBlank(p.key10) ) tmp.put(p.key10, p.value10);
                if ( String.IsNotBlank(p.keyBoolean) ) tmp.put(p.keyBoolean, p.valueBoolean);
                if ( String.IsNotBlank(p.keyBoolean2) ) tmp.put(p.keyBoolean, p.valueBoolean2);
                if ( String.IsNotBlank(p.keyBoolean3) ) tmp.put(p.keyBoolean, p.valueBoolean3);
                result.add( opB+JSON.Serialize(tmp)+clB );
            }
            
        }
        return result; 
    }
    
    public  class Params {
        @InvocableVariable(required=true)
        public  String jsonString; 
        @InvocableVariable(required=true description='get,put,delete')
        public  String operation;
        @InvocableVariable(required=true)
        public  String key;
        @InvocableVariable(required=false description='for operation "put" enter value. Leave it blank for get and delete')
        public  String value;
        @InvocableVariable(required=false description='optional key2 for operation put and delete. Leave it blank for get')
        public  String key2;
        @InvocableVariable(required=false)
        public  String value2;
        @InvocableVariable(required=false description='optional key3 for operation put and delete. Leave it blank for get')
        public  String key3;
        @InvocableVariable(required=false)
        public  String value3;
        @InvocableVariable(required=false)
        public  String key4;
        @InvocableVariable(required=false)
        public  String value4;
        @InvocableVariable(required=false)
        public  String key5;
        @InvocableVariable(required=false)
        public  String value5;
        @InvocableVariable(required=false)
        public  String key6;
        @InvocableVariable(required=false)
        public  String value6;
        @InvocableVariable(required=false)
        public  String key7;
        @InvocableVariable(required=false)
        public  String value7;
        @InvocableVariable(required=false)
        public  String key8;
        @InvocableVariable(required=false)
        public  String value8;
        @InvocableVariable(required=false)
        public  String key9;
        @InvocableVariable(required=false)
        public  String value9;
        @InvocableVariable(required=false)
        public  String key10;
        @InvocableVariable(required=false)
        public  String value10;
        //Boolean values
        @InvocableVariable(required=false description='Use this to set boolean value')
        public  String keyBoolean;
        @InvocableVariable(required=false description='Boolean value')
        public  Boolean valueBoolean;
        @InvocableVariable(required=false description='Use this to set boolean value')
        public  String keyBoolean2;
        @InvocableVariable(required=false description='Boolean value')
        public  Boolean valueBoolean2;
        @InvocableVariable(required=false description='Use this to set boolean value')
        public  String keyBoolean3;
        @InvocableVariable(required=false description='Boolean value')
        public  Boolean valueBoolean3;
    } 
    
}