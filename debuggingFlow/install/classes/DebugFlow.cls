public class DebugFlow {

    /*  When the flows fails during INSERT operation due to error you cannot see the data of the record because it was not saved into Database. 
     *  This apex class is to expose the record details in the email like "Subject: Error Occurred During Flow "<flow name>": An Apex error occurred"
     * 
     *  @author Maciej Szymczak
     *  @version 2022.12.14
     */
    
    @InvocableMethod
    public static void debug(List<String> debugMessage) {}
    
}