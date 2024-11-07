@isTest
public class IsOnTheListTest {

    static testMethod void positiveTest() {
        IsOnTheList.Params x = new IsOnTheList.Params();
        x.element = 'POL';
        x.commaSeparatedElements = 'POL,USA';
        List<IsOnTheList.Params> Params = new List<IsOnTheList.Params> {x};
        List<Boolean> res = IsOnTheList.run(Params);
        System.assert(res[0]==true);
    }
    
    static testMethod void negativeTest() {
        IsOnTheList.Params x = new IsOnTheList.Params();
        x.element = 'NotInList';
        x.commaSeparatedElements = 'POL,USA';
        List<IsOnTheList.Params> Params = new List<IsOnTheList.Params> {x};
        List<Boolean> res = IsOnTheList.run(Params);
        System.assert(res[0]==false);
    }

}