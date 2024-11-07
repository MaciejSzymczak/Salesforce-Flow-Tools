@istest
public class ApprovalTest {
    
     static testmethod void test () {
       TestLibrary tl = new TestLibrary();
       List<Account> account = new List<Account>();
       account = tl.createTestAccounts(1, UserInfo.getUserId() );
       insert account;          
       test.startTest();
       ApprovalLock.run( new List<String>{account[0].Id});
       Boolean isLocked1 = ApprovalIsLocked.run( new List<String>{account[0].Id})[0];
       ApprovalUnLock.run( new List<String>{account[0].Id});
       Boolean isLocked2 = ApprovalIsLocked.run( new List<String>{account[0].Id})[0];
       system.assert(isLocked1);
       system.assert(!isLocked2);
       test.stopTest();
    } 

}