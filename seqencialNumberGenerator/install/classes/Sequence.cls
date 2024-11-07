global class sequence {

/*
 * This apex class generates cyclic sequences for Round Robin
 * @author Maciej Szymczak
 * @version 2019.08.05
 */    
    
@InvocableMethod
public static List<Integer>  nextVal(List<SeqParams> SeqParams) {
    List<Integer> result = new List<Integer>(); 
    for(SeqParams sp : seqParams) {
        SObject s = Schema.getGlobalDescribe().get('RR_SEQ'+sp.SeqNum+'__c').newSObject();
        insert s;
        AggregateResult[] gr = Database.query('select min(Name) seqVal from RR_SEQ'+sp.SeqNum+'__c where Id = \''+s.Id+'\' group by Id');
        Integer seqVal = integer.valueOf(gr[0].get('seqVal'));
        Database.delete(Database.query('select Id from RR_SEQ'+sp.SeqNum+'__c where Id != \''+s.Id+'\''));
	    result.add (math.mod ( seqVal-1, sp.QueueLen) + 1);	    
    }
    return result;  
}
    
global class SeqParams {
    @InvocableVariable(required=true)
    global Integer SeqNum;
    @InvocableVariable(required=true)
    global Integer QueueLen ;
} 

}