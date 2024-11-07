public  class IsOnTheList {

/*
 * This apex class is used by flows
 * The function checks if given element in on the list of elements:
 * IsOnTheList('POL', 'POL,USA') returns true
 * IsOnTheList('', 'POL,USA') returns false
 * IsOnTheList('X', 'POL,USA') returns false
 * 
 * @author Maciej Szymczak
 * @version 2019.08.22
 */    
    
   @InvocableMethod (label='Checks if given element in on the list of elements' description='') 
   public  static List<Boolean> Run(List<Params> params) {
       List<Boolean> result = new List<Boolean>();
	   String sep = ',';
       for (Params p : params) {
           result.add(  (sep+p.commaSeparatedElements+sep).contains(sep+p.element+sep)  );
       }
       return result;
   }
    
public  class Params {
    @InvocableVariable(required=false)
    public  String element; //POL
    @InvocableVariable(required=true)
    public  String commaSeparatedElements; //USA,POL
} 
        
}