package entity;

public class Main {
    public static void main(String[] args){
        //new mysql().Insert("users","uname","upwd","23","123");
        String name = "123";
        String st = "SELECT uname,upwd FROM users WHERE uname='"+name+"'";
        System.out.println(st);
        try {
            mysql Test = new mysql();
            Test.Connect();
            System.out.println(Test.getCount("users"));
//            ResultSet resultSet = Test.Select("SELECT * From news");
//            while (resultSet.next())
//            {
//                String the = resultSet.getInt("nid")+" "+resultSet.getString("ntheme")+" "+resultSet.getString("nnews")+" "+resultSet.getString("ntitle");
//                System.out.println(the);
//            }
            //Test.Select("SELECT uname,upwd,uflag FROM users WHERE uname='"+name+"'and upwd='"+pwd+"'","uname","upwd","uflag",1);
            //Test.Delete("themes","tid","4");
            //Test.Update("themes","tid","tname","4","444");
            //Test.Insert("themes","tname","oopp");
//            List<String> list =  Test.Select("SELECT uname,upwd,upermission FROM users WHERE uname ='23' and upwd ='123'","uname","upwd","upermission",1);
           // List<String> list = Test.Select("SELECT uname,upwd FROM users WHERE uname='QQ'and upwd='12345678'","uname","upwd",1);
           // Iterator<String > iterator = list2.iterator();
//            Iterator<String> iter = list.iterator();
//            while(iter.hasNext()){
//                System.out.println("B");
//                System.out.println(iter.next());
//                System.out.println("A");
//           }
//           System.out.println(list.size());
            //System.out.println(new mysql().CheckisExit("themes","tname","军事"));
        }catch(Exception e){
            e.printStackTrace();
        }finally{

        }
    }
}
