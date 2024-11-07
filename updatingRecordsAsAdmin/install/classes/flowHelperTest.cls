@isTest
public class flowHelperTest {
    
    static testMethod void negativeTest() {
        insert new task (subject='test');
        
        flowHelper.Params x = new flowHelper.Params();
        x.action = 'UPDATE';
        x.sObjectName = 'Task'; 
        x.recordId = [select Id from task].Id; 
        x.FieldName1 = 'Subject'; 
        x.FielValue1 = 'changed'; 
        
        List<flowHelper.Params> Params = new List<flowHelper.Params> {x};
            flowHelper.run(Params);
        Assert.areEqual([select subject from task].subject, 'changed');
    }
    
    
}