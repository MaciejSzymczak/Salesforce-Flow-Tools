public  class UniqueValues {

/*
 * Returns unique list of elements
 * 
 * @author Maciej Szymczak
 * @version 2019.09.08
 */    
    
   @InvocableMethod (label='Returns unique list of elements' description='') 
   public  static List<List<String>> Run(List<Params> params) {
       List<List<String>> result = new List<List<String>>();
       for (Params p : params) {
             Set<String> uniqueValues = new Set<String>();
             if (p.elements!=null)
                 for (String s : p.elements) {
                   uniqueValues.add(s);
                 }   
             result.add( new List<String>(uniqueValues) );
       }
       return result;
   }
    
  public  class Params {
      @InvocableVariable(required=false)
      public List<String> elements; 
  } 
     
}