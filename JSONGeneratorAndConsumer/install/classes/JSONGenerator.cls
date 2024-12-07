public class JSONGenerator {

/*
 * @description Returns data in JSON format. Used by the flow.
 * 
 * @author Maciej Szymczak
 * @version 2024.09.18
 */    
    
   @InvocableMethod (label='getJSON' description='Returns data in JSON format') 
   public static List<String> getJSON(List<Params> params) {
       List<String> result = new List<String>();
       for (Params p : params) {
		   String recordId = p.id;           
           result.add(  JSON.serialize( Database.query( p.soql ) )  );
       }
       return result;
   }
    
public  class Params {
    @InvocableVariable(required=false)
    public  String soql; 
    @InvocableVariable(required=true)
    public  String id;
} 
        
}