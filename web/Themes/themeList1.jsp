<%--suppress ALL --%>
<%@ page import="entity.mysql" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/8/2018
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>themeaddlist</title>
    <script>
        function Jumpto(ID,name) {
            /*
                修改按钮
                传  ID 和 name
                要求: 将值name传送给新的页面上  并在 显示在 vluae 上
                思路: 查询数据库,  查询ID  修改对应的ID  并 返回到本页面
             */
            alert(ID,name);

        }
    </script>
</head>
<body>
    <div style="color: #4d90fe">
            <table border="1">
            <%
                request.setCharacterEncoding("UTF-8");
                mysql Sql = new mysql();
                String t1 = "",t2="";
                List<String>list = Sql.Select("themes","tid","tname");
                try {
                    Iterator<String> iter = list.iterator();
                    while(iter.hasNext()){
                        String []display_themes = iter.next().split(" ");
                        out.print("<ul><li>");
                        out.print("<span>"+display_themes[1]);
                        t1 = display_themes[0];
                        t2 = display_themes[1];
                                 out.print(" <button type=\"button\" name=\"change\" id=\"change\" onclick=\"javascrtpt:window.location.href='themes_update.jsp?tid="+t1+"+&tname="+t2+"'\" >修改</button> " +
                                "<button type=\"button\" name=\"delete\" id=\"delete\" onclick=\"javascrtpt:window.location.href='themes_delete.jsp?tid="+t1+"'\">删除</button>");
                        out.print("</span></li></ul>");
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }finally{
                }
            %>
            </table>
    </div>


</body>
</html>
