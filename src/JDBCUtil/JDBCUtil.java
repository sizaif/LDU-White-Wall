package JDBCUtil;

import java.sql.*;

public class JDBCUtil {


    public Statement statement = null;
    public Connection con = null;
    public PreparedStatement preparedStatement = null;

    public static Connection getConnection(){
        try {
            String url = "jdbc:mysql://localhost:3306/123dd?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8";
            String name = "root";
//            String pwd = "root@admin@123FUCK";
            String pwd = "root";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, name, pwd);

           // System.out.println("数据库连接成功!");
            return con;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  null;
    }

    public static void closeAll(ResultSet  rs,PreparedStatement  pstm,Connection conn){

        try{
            if(rs!=null){rs.close();}
            if(pstm!=null){pstm.close();}
            if(conn!=null){conn.close();}
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        getConnection();
    }
}
