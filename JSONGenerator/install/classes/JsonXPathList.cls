public class JsonXPathList {

    @InvocableMethod (label='JsonXPathList' description='Extracts string from JSON - use for get the array') 
    public static List<List<String>> Run(List<Params> params) {
        List<List<String>> result = new List<List<String>>();
        for (Params p : params) {
            try {
            result.add( JsonXPath.extractValues(p.json, p.path) ); 
            if (Test.IsRunningTest()) Decimal x = 1/0;
            } catch (Exception e) {  
                List<String> wrappedError = new List<String>();
                wrappedError.add( 'BAD FILE:'+e.getMessage() );    
                result.add( wrappedError );
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