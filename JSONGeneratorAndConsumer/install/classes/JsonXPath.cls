public  class JsonXPath {
    
/*@author Maciej Szymczak
* @version 2025.03.20
*/    
        
    @InvocableMethod (label='JsonXPath' description='Extracts string from JSON') 
    public static List<String> Run(List<Params> params) {
        List<String> result = new List<String>();
        for (Params p : params) {
            try {
            if (String.IsBlank(p.separator)) p.separator = ',';
            result.add( String.join(extractValues(p.json, p.path), p.separator) ); 
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
        @InvocableVariable(required=false)
        public  String separator; 
    } 

    public static List<String>  extractValues(String jsonString, String jsonPath) {
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
        List<String> results = new List<String>();
        processPath(jsonMap, jsonPath.split('/'), 0, results, -1);
        return results; 
    }

    //This apex class does not support the syntax 'OpportunityLineItems[recordNum]/records/Usages'
    //Instead, provide the path 'OpportunityLineItems/records/Usages' and recordNum as the parameter. 
    public static List<String>  extractValues(String jsonString, String jsonPath, Integer recordNum) {
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
        List<String> results = new List<String>();
        processPath(jsonMap, jsonPath.split('/'), 0, results, recordNum);
        return results; 
    }
    
    
    private static void debug(String m) {
      if (test.isRunningTest()) 
          System.debug('DEBUG JsonXPath:' + m);
    }
    
    private static void processPath(Object current, List<String> pathParts, Integer index, List<String> results, Integer recordNum) {
        debug('processPath. Current JSON:'+current);
        if (index >= pathParts.size() || current == null) {
            if (current instanceof List<Object>) {
                debug('Final. instanceof List<Object>');
                for (Object subElement : (List<Object>) current) {
                    debug('In loop:'+subElement);
                    if (subElement instanceof String) {
                        debug('FOUND Instanceof String');
                        results.add( (String) subElement );
                    }
                    if (subElement instanceof Boolean) {
                        debug('FOUND Instanceof Boolean');
                        results.add( String.valueOf(subElement) );
                    }
                    if (subElement instanceof Integer) {
                        debug('FOUND Instanceof Integer');
                        results.add( String.ValueOf((Integer) subElement) );
                    }
                    if (subElement instanceof Decimal) {
                        debug('FOUND Instanceof Decimal');
                        results.add( String.ValueOf((Decimal) subElement) );
                    }
                    if (subElement instanceof Map<String, Object>) {
                        debug('FOUND Instanceof Map<String, Object>');
                        results.add( String.ValueOf(  JSON.serialize (subElement) ));
                    }
                }
            }
            if (current instanceof Boolean) { debug('FOUND instanceof Boolean'); results.add( String.valueOf(current)           ); return; } 
            if (current instanceof String)  { debug('FOUND instanceof String');  results.add( (String) current                  ); return; }
            if (current instanceof Integer) { debug('FOUND instanceof Integer'); results.add( String.ValueOf((Integer) current) ); return; }
            if (current instanceof Decimal) { debug('FOUND instanceof Decimal'); results.add( String.ValueOf((Decimal) current) ); return; }
            if (current == null)            { debug('FOUND null');               results.add( null );                              return; }
            return;
        }

        String part = pathParts[index];
        debug('part:'+part);

        if (current instanceof Map<String, Object> && ((Map<String, Object>) current).containsKey(part)) {
            debug('Navigate into the OBJECT-Start');
            processPath(((Map<String, Object>) current).get(part), pathParts, index + 1, results, recordNum);
            debug('Navigate into the OBJECT-Stop');
        } else if (current instanceof List<Object>) {
            debug('Navigate into the LIST-Start');
            Integer currNum = 0;
            for (Object subElement : (List<Object>) current) {
                if (recordNum == -1 || currNum == recordNum)
                  processPath(subElement, pathParts, index, results, recordNum);
                currNum = currNum + 1;
            }
            debug('Navigate into the LIST-Stop');
        } else if (index == pathParts.size() - 1 && part.equals('*') && current != null) {
            debug('Capture the final value');
            results.add(String.valueOf(current));
        }
    }

    // *** Helpers ****

    public static String  S(String jsonString, String jsonPath) {
      return String.join(JsonXPath.extractValues(jsonString,jsonPath),',');
    }
    
    /*
    You can also use these methods. Have a look at NetsuiteProcessorInvoice to see real fine implmementation

    public static Decimal N (String fieldName) {
        String tmp = S(fieldName);
        return String.IsBlank(tmp)?0:Decimal.ValueOf(tmp);
    }
    public static Date D (String fieldName) {
        String tmp = S(fieldName);
        return Date.ValueOf(tmp);
    }
    public static Id I (String fieldName) {
        String tmp = S(fieldName);
        return String.IsBlank(tmp)?null:tmp;
    }
    public static DateTime T (String fieldName) {
        String tmp = S(fieldName);
        return DateTime.ValueOf(tmp);
    }
	*/
    
}