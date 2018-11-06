package entity;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class mysql {
    public String url = "jdbc:mysql://localhost:3306/123dd?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8";
    public String name = "root";
    public String pwd = "root";
    public Statement statement = null;
    public Connection con = null;
    public PreparedStatement preparedStatement = null;

    public mysql() {
        Connect();
    }
    public void Connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, name, pwd);
            statement = con.createStatement();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public  Statement getStatement() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, name, pwd);
            statement = con.createStatement();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statement;
    }

    public void Close() throws SQLException {
        statement.close();
        con.close();
    }

    public void Insert(String To, String Tofirst, String Tosecond, String item1, String item2)// To(Tofirst,Tosecond)->(item1,item2)
    {
        try {
            // 开始插入到数据库
            String sql = "insert into " + To + "(" + Tofirst + "," + Tosecond + ") values('" + item1 + "','" + item2 + "')";
            int tr = statement.executeUpdate(sql);
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }
    public boolean Insert(String sql)// insert sql;
    {
        try {
            // 开始插入到数据库
            int tr = statement.executeUpdate(sql);

            statement.close();
            con.close();
            if( tr !=0)
                return true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return false;
    }

    public void Insert(String To, String Tofirst, String item1)//  To(Tofirst)->item1
    {

        try {
            // 开始插入到数据库
            String sql = "insert into " + To + "(" + Tofirst + ") values('" + item1 + "')";
            statement.executeUpdate(sql);
            //System.out.println(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }
    public void Delete(String Toset,String t1,String s1) throws SQLException {
        /*
        删除一条记录 从To 中  where t1 = s1   t1 为整形
         */
        String sll = "DELETE FROM "+Toset+"  WHERE "+t1+"=?";
        statement = con.createStatement();
        PreparedStatement ps = con.prepareStatement(sll);
        ps.setInt(1,Integer.parseInt(s1));

        ps.executeUpdate();
        ps.close();
    }
    public void Update(String Toset,String t1,String t2,String s1,String s2) throws SQLException {
        /*
            修改 数据库 中  表 Toset 中  t2 的 值 为s2  当 t1 = s1
         */
        String sll = "update "+Toset+" set "+t2+"=? WHERE "+t1+"=?";
        statement = con.createStatement();
        PreparedStatement ps = con.prepareStatement(sll);
        ps.setString(1,s2);
        ps.setInt(2,Integer.parseInt(s1));

        ps.executeUpdate();
        ps.close();
    }
    public boolean CheckisExit(String To, String Tofirst, String fd) {

        try {

            // 开始查找是否存在
            String sql = "SELECT " + Tofirst + " FROM " + To + " WHERE " + Tofirst + "='" + fd + "'";
            System.out.println(sql);
            statement = getStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            // 判断是否存在
            boolean tr = resultSet.next();
            System.out.println(tr);
            resultSet.close();
            if (tr == true)
                return false;
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return true;
    }

    public List Select(String To, String Tofirst, String Tosecond) // 查询 2 个
    {
        List<String> res = new ArrayList<>();
        try {

            // 开始查找
            String sql = "SELECT " + Tofirst + "," + Tosecond + " FROM " + To + "";
            // System.out.println(sql);
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String the = resultSet.getInt(Tofirst) + " " + resultSet.getString(Tosecond);
                res.add(the);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public ResultSet Select(String Sql) throws SQLException {
        // 开始查找
        ResultSet resultSet = statement.executeQuery(Sql);
        return resultSet;
    }
    public List Select(String To, String Tofirst, String item1, String item2) {  // 1 个
        List<String> res = new ArrayList<>();
        try {

            // 开始查找
            String sql = "SELECT " + Tofirst + " FROM " + To + "";
            // System.out.println(sql);
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String the = resultSet.getString(item1) + " " + resultSet.getString(item2);
                res.add(the);
            }
            resultSet.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public List Select(String sql,String first,String second,int flag) {  // sql 语句查询
        List<String> res = new ArrayList<>();
        try {
            // 开始查找
            // System.out.println(sql);
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String the = resultSet.getString(first) + " " + resultSet.getString(second);
                System.out.println(the);
                res.add(the);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public List Select(String sql,String Tabfirst,String Tabsecond,String Tabthrid,int flag) {  // sql 语句查询
        List<String> res = new ArrayList<>();
        try {
            // 开始查找
            // System.out.println(sql);
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String the = resultSet.getString(Tabfirst) + " " + resultSet.getString(Tabsecond)+" "+resultSet.getString(Tabthrid);
                System.out.println(the);
                res.add(the);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public int getCount(String to) throws SQLException {
        String sql  = "SELECT count(*) FROM "+to;
        ResultSet resultSet = statement.executeQuery(sql);
        int num = 0;
        while (resultSet.next())
        {
            num = resultSet.getInt(1);
            System.out.println(num);
        }
        statement.close();
        return  num;
    }
}




