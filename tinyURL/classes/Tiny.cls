public class Tiny{
 
   /* Generate tiny URL.
    * Why do I need this? Becuase Salesforce URL can have max 255 characters. You can make it shorter using this apex class.
    * @author Maciej Szymczak
    * @version 2025.01.27
    */ 
    
    public PageReference redirectToPage() {
        PageReference pageRef = new PageReference([select URL__c from TinyURL__c where Id = :System.currentPageReference().getParameters().get('id')].URL__c);
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public static String getTinyURL (String url, Boolean AlwaysGenerateTinyURL ) {
        if (AlwaysGenerateTinyURL==false && url.length()<255 ) return url;
        TinyURL__c tiny = new TinyURL__c(URL__c =url);
        insert tiny;
        return System.URL.getOrgDomainUrl().toExternalForm()+'/apex/TinyURL?Id='+tiny.Id;
    }
    
}