public class ApprovalIsLocked {

/*
 * This apex class is used by flows
 * @author Maciej Szymczak
 * @version 2019.08.16
 */    
    
   @InvocableMethod
   public static List<Boolean> Run(List<String> Ids) {
       List<Boolean> result = new List<Boolean>();
       for (String p : Ids) {
           result.add( Approval.isLocked (p));
       }
       return result;
   }    



  

    
}