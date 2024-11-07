@istest
public class sequenceTest {

public static testMethod void test() {
   List<Sequence.SeqParams> spList = new List<Sequence.SeqParams>();
    Sequence.SeqParams sp = new Sequence.SeqParams();
    sp.SeqNum = 1;
    sp.QueueLen = 6;
    spList.add(sp);
    Integer i1= sequence.nextval(spList)[0];
    Integer i2= sequence.nextval(spList)[0];
    Integer i3= sequence.nextval(spList)[0];
    Integer i4= sequence.nextval(spList)[0];
    Integer i5= sequence.nextval(spList)[0];
    Integer i6= sequence.nextval(spList)[0];
    Integer i7= sequence.nextval(spList)[0];
    System.debug(
        i1+' '+i2+' '+i3+' '+i4+' '+i5+' '+i6+' '+i7   
    ); 
}
    
}