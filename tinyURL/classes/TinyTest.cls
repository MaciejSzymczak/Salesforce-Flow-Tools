@isTest 
public class TinyTest {

    static testMethod void test() {
        String longURL = 'https://salesforce.com/longUrllongUrllongUrllongUrllongUrllongUrllongUrllongUrllongUrl';
        String tinyURL = Tiny.getTinyURL(longURL, false);
        Assert.AreEqual(tinyURL, longURL);

        tinyURL = Tiny.getTinyURL(longURL, true);
        PageReference pageRef = Page.TinyURL;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('Id',[select Id from TinyURL__c].Id); 
        New Tiny().redirectToPage();
    }


    
}