@istest
class UniqueValuesTest {

private static TestMethod void test(){
   uniqueValues.Params p = new uniqueValues.Params();
   p.elements = new list<String>{'a','b','c','d','e','c','b','a','b','b','b','b','b'};
   String res = String.join(uniqueValues.Run ( new list<uniqueValues.Params>{p} )[0],'');
   System.assert(res=='abcde');
  } 
  
}