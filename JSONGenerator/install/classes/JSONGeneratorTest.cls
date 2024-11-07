@IsTest
public class JSONGeneratorTest {

    static testMethod void positiveTest() {
        JSONGenerator.Params x = new JSONGenerator.Params();
        x.soql = 'select Id from User where Id = :recordId';
        x.id = UserInfo.getUserId();
        List<JSONGenerator.Params> Params = new List<JSONGenerator.Params> {x};
        List<String> res = JSONGenerator.getJSON(Params);
        System.debug(res[0]);
        String expectedResult = '[{"attributes":{"type":"User","url":"/services/data/v61.0/sobjects/User/{userId}"},"Id":"{userId}"}]';
        expectedResult = expectedResult.replace('{userId}', x.Id);
        Assert.areEqual(res[0], expectedResult);
    }
    
    
}