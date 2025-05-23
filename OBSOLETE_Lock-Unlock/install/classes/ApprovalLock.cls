public class ApprovalLock {

/*
 * This apex class is used by flows
 * @author Maciej Szymczak
 * @version 2019.08.16
 */    
    
   @InvocableMethod
   public static List<Boolean> Run(List<String> Ids) {
       List<Boolean> result = new List<Boolean>();
       for (String p : Ids) {
           Approval.lock(p);
           result.add(true);
       }
       return result;
   }    
    
}