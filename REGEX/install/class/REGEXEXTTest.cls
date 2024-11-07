@isTest
public class REGEXEXTTest {
    
    static testMethod void Test() {
        REGEXEXT.Params params = new REGEXEXT.Params();
        params.searchedString = 'Blackwing xyz';
        params.keywords = 'Business Intelligence Report|Blackwing|Inquérito / Survey';
        
        List<String> result = REGEXEXT.searchForKeywords ( new List<REGEXEXT.Params>{params} );
        assert.areEqual('Blackwing', result[0]);
            
        params.searchedString = 'xyz';
        params.keywords = 'Business Intelligence Report|Blackwing|Inquérito / Survey';
        result = REGEXEXT.searchForKeywords ( new List<REGEXEXT.Params>{params} );
        assert.areEqual('', result[0]);
            
    }

}