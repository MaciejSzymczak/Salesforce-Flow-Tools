public class REGEXEXT {
    
    /* Checks if given searchedString contains any word listed in keywords
     * Helps to reduce the size of formulas in flows.
     * Please mind: the standard REGEX function available in flows is not working as expected. Use this one instead.
     * @author Maciej Szymczak
     * @version 2023.09.02
     */
    
    public static String searchForKeywords (String searchedString, String keywords) {
        // (?i) means case insensitive
        // \\b means whole words only
        // | means OR
        // if needed, use this syntax to change comma separated string into pipe separated string: String.join( commaDelimitedKeywords.Split(','),'|')
        Pattern p = Pattern.compile('(?i)\\b(' + keywords +  ')\\b');
        Matcher m = p.matcher(searchedString);
        if ( m.find() ) {
            return searchedString.substring(m.start(),m.end());
        } 
        else
            return '';
    }
    
    @InvocableMethod (label='Checks if given searchedString contains any word listed in keywords' description='') 
    public static List<String> searchForKeywords(List<Params> params) {
        List<String> result = new List<String>();
        for (Params p : params) {
            result.add(  searchForKeywords ( p.searchedString,  p.keywords)  );
        }
        return result;
    }
    
    public  class Params {
        @InvocableVariable(required=false)
        public  String searchedString; 
        @InvocableVariable(required=true)
        public  String keywords; 
    } 
    
    
}