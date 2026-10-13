public without sharing class flowHelper {

/*
 * Use this apex class to bypass the permissions imposed on current user, that block some updates like update the record type of the record from EDITABLE to LOCK.
 * 
 * @author Maciej Szymczak
 * @version 2024.03.28
 */    
    
   @InvocableMethod (label='FlowHelper' description='Use this apex class to bypass the permissions imposed on current user, that block some updates like update the record type of the record from EDITABLE to LOCK.') 
    public static void Run(List<Params> params) {
        String sep = ',';
        for (Params p : params) {
            if (p.action=='UPDATE') {
                //update new SBQQ__Quote__c (Id=p.recordId, recordTypeId=p.FielValue1);
                sObject sObj = Schema.getGlobalDescribe().get(p.sObjectName).newSObject() ;                
                sObj.put('Id', p.recordId);
                String fieldType = Schema.getGlobalDescribe().get(p.sObjectName).getDescribe().Fields.getMap().get(p.FieldName1).getDescribe().getType()+'';
                if (fieldType=='BOOLEAN') {
                    sObj.put(p.FieldName1, p.FielValue1.ToUpperCase()=='TRUE');
                } else {
                    sObj.put(p.FieldName1, p.FielValue1);
                }
                update sObj;
            }
        }
    }
    
public  class Params {
    @InvocableVariable(required=true)
    public  String action; 
    @InvocableVariable(required=true)
    public  String sObjectName; 
    @InvocableVariable(required=true)
    public  Id recordId; 
    @InvocableVariable(required=true)
    public  String FieldName1; 
    @InvocableVariable(required=true)
    public  String FielValue1; 
} 
       
    
    
}