package DaoImp;

import JDBCUtil.JDBCUtil;
import entity.WhiteWall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoImp {

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet res = null;

    public List<String> getAllPhoto(){
        List<String > list = null;
        String sql = "";

        try {
            list = new ArrayList();
            conn = JDBCUtil.getConnection();
            sql = "SELECT img FROM upload_img";
            pstm = conn.prepareStatement(sql);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(res.getString(1));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return  list;
    }
    public List<WhiteWall> getAllWhiteByID(int id){

        List<WhiteWall> list = null;
        String sql = "";

        try {
            list = new ArrayList();
            conn = JDBCUtil.getConnection();
            sql = "SELECT * FROM whitewall WHERE uid=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1,id);
            res = pstm.executeQuery();
            while (res.next()){
                list.add(new WhiteWall(res.getInt(1),res.getString(2),res.getString(3),res.getInt(4)));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtil.closeAll(res,pstm,conn);
        }
        return  list;
    }
}
