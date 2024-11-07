public class redirectToURLClass {

    /*
     * This function generates CSRF protection link like /apex/dsfs__docusign_createenvelope?_CONFIRMATIONTOKEN=VmpFPSxNa...
     * It is used by Lightning Component
     * 
     * @author Maciej Szymczak
     * @version 2019.09.20
     */

    @AuraEnabled
    public static String CSRFUrl(String apexPage) {
        return new PageReference('/apex/'+apexPage).getUrl(); 
    }
}