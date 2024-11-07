public  class JsonXPath {
    
/*SFL8N-4705
 * 
* @author Maciej Szymczak
* @version 2024.02.07
*/    
    
    public static String run(String path, String jsonString) {
        if (path == '//payload/actionMessages') {
            Map<String, Object> m =  (Map<String, Object>) JSON.deserializeUntyped(jsonString);
            Map<String, Object> payload = (Map<String, Object>)m.get('payload');
            List<Object> actionMessages = (List<Object>)payload.get('actionMessages');
            List<String> resultArray = new List<String>();
            for (Object o :actionMessages) { resultArray.add((String)o); }
            return String.join(resultArray, ',');
        }
        Map<String, Object> m =  (Map<String, Object>) JSON.deserializeUntyped(jsonString);
        return  (String)m.get(path);
    }
    
    @InvocableMethod (label='JsonXPath' description='Extracts string from json') 
    public static List<String> Run(List<Params> params) {
        List<String> result = new List<String>();
        for (Params p : params) {
            try {
            result.add( run(p.path,p.json) );
            } catch (Exception e) {  
                result.add( 'BAD FILE:'+e.getMessage() );
			}
        }
        return result;
    }
    
    public  class Params {
        @InvocableVariable(required=false)
        public  String path; 
        @InvocableVariable(required=true)
        public  String json; 
    } 
    
}