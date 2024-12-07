@IsTest
public class JSONUpdateTest {

    static testMethod void getTest() {
        JSONUpdate.Params x = new JSONUpdate.Params();
        x.jsonString = '[{"type":"Account","Id":"001TA00000OUwVSYA1","Name":"My example account","Contacts":{"done":"true","queryLocator":null,"records":{"type":"Contact","Id":"003TA00000PdPwMYAV","LastName":"Test"},"size":"1"}}]';
        x.operation = 'get';
        x.key = 'Id';
        List<JSONUpdate.Params> Params = new List<JSONUpdate.Params> {x};
        List<String> res = JSONUpdate.run(Params);
        String expectedResult = '001TA00000OUwVSYA1';
        system.debug('getTest');
        system.debug('expectedResult:'+expectedResult);
        system.debug('actualResult:'+res[0]);
        Assert.areEqual(expectedResult, res[0]);
    }    
    
    static testMethod void putTest() {
        JSONUpdate.Params x = new JSONUpdate.Params();
        x.jsonString = '[{"type":"Account","Id":"001TA00000OUwVSYA1","Name":"My example account","Contacts":{"done":"true","queryLocator":null,"records":{"type":"Contact","Id":"003TA00000PdPwMYAV","LastName":"Test"},"size":"1"}}]';
        x.operation = 'put';
        x.key = 'AnotherKey';
        x.value = 'AnotherValue';
        List<JSONUpdate.Params> Params = new List<JSONUpdate.Params> {x};
        List<String> res = JSONUpdate.run(Params);
        system.debug('putTest');
        system.debug('actualResult:'+res[0]);
        Assert.areEqual(res[0].contains('AnotherKey'), true);
    }    

    static testMethod void deleteTest() {
        JSONUpdate.Params x = new JSONUpdate.Params();
        x.jsonString = '[{"type":"Account","Id":"001TA00000OUwVSYA1","Name":"My example account","Contacts":{"done":"true","queryLocator":null,"records":{"type":"Contact","Id":"003TA00000PdPwMYAV","LastName":"Test"},"size":"1"}}]';
        x.operation = 'delete';
        x.key = 'Id';
        List<JSONUpdate.Params> Params = new List<JSONUpdate.Params> {x};
        List<String> res = JSONUpdate.run(Params);
        String expectedResult = '[{"type":"Account","Name":"My example account","Contacts":{"done":"true","queryLocator":null,"records":{"type":"Contact","Id":"003TA00000PdPwMYAV","LastName":"Test"},"size":"1"}}]';
        system.debug('deleteTest');
        system.debug('expectedResult:'+expectedResult);
        system.debug('actualResult:'+res[0]);
        //the result may be shuffled so we only compare the size 
        Assert.areEqual(expectedResult.length(), res[0].length());
    }    
    
    
}