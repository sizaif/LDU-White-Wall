<%@ page import="entity.mysql" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="DaoImp.NewsDaoImp" %><%--
  Created by IntelliJ IDEA.
  User: SIZ
  Date: 10/23/2018
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>news_list</title>
</head>
<body>
<div class="Header">
    <header tabindex="0" class="frame-main-cont-head" id="">
        <div role="toolbar" id="_mail_toolbar_0_179" class="js-component-toolbar nui-toolbar ">
            <div class="nui-toolbar-item">
                <div role="button" tabindex="0" id="_mail_button_4_180"
                     class="js-component-button nui-dropdownBtn nui-btn nui-btn-hasOnlyIcon nui-dropdownBtn-hasOnlyIcon  "
                     aria-expanded="false">
                        <span class="nui-btn-icon">
                            <span role="checkbox" tabindex="0" id="_mail_checkbox_0_181"
                                  class="nui-chk js-component-checkbox-dc" aria-checked="false">
                                <span class="nui-chk-symbol">
                                    <b id="fly0" class="js-component-icon nui-ico nui-ico-checkbox"></b>
                                </span>
                            </span>
                        </span>
                    <span class="nui-btn-text"></span>
                    <span class="nui-dropdownBtn-arr" tabindex="0">
                            <b class="nui-ico nui-ico-dArr"></b>
                    </span>
                </div>
            </div>
            <div class="nui-toolbar-item">
                <div role="button" tabindex="0" id="_mail_button_5_182" class="js-component-button nui-btn ">
                    <span class="nui-btn-text">删 除</span>
                </div>
            </div>
            <div class="nui-toolbar-item">
                <div role="button" tabindex="0" id="_mail_button_6_183" class="js-component-button nui-btn ">
                    <span class="nui-btn-text">举 报</span>
                </div>
            </div>
            <div class="nui-toolbar-item">
                <div role="button" tabindex="0" id="_mail_button_10_187" class="js-component-button nui-btn "><span
                        class="nui-btn-text">刷 新</span></div>
            </div>
            <div class="nui-toolbar-ext">
                <div class="nui-toolbar-item">
                    <div id="_mail_calendar_0_188" class="js-component-calendar nui-calendar" role="application"><b
                            class="nui-ico nui-ico-calendar"></b></div>
                </div>
                <div class="nui-toolbar-item">
                    <div tabindex="0" aria-expanded="false" role="button" id="_mail_select_0_189"
                         class="js-component-select nui-simpleSelect nui-select " 当前第1页=""><span
                            class="nui-select-text">1/4</span><span class="nui-select-arr"><b
                            class="nui-ico nui-ico-dArr"></b></span></div>
                </div>
                <div class="nui-toolbar-item">
                    <div role="button" tabindex="0" id="_mail_button_11_190"
                         class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  nui-btn-disabled nui-roundBtn-disabled  "
                         title="上一页"><span class="nui-btn-icon"><b id="_mail_icon_30_191"
                                                                   class="js-component-icon nui-ico nui-ico-prev  "></b></span><span
                            class="nui-btn-text"></span></div>
                    <div role="button" tabindex="0" id="_mail_button_12_192"
                         class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
                         title="下一页"><span class="nui-btn-icon"><b id="_mail_icon_31_193"
                                                                   class="js-component-icon nui-ico nui-ico-next  "></b></span><span
                            class="nui-btn-text"></span></div>
                </div>
                <div class="nui-toolbar-item">
                    <div role="button" tabindex="0" id="_mail_button_13_194"
                         class="js-component-button nui-roundBtn nui-btn nui-btn-hasIcon nui-roundBtn-hasIcon  "
                         title="设置"><span class="nui-btn-icon"><b id="_mail_icon_32_195"
                                                                  class="js-component-icon nui-ico nui-ico-setting  "></b></span><span
                            class="nui-btn-text"></span></div>
                </div>
            </div>
        </div>
    </header>
</div>

    <div >
        <table  border="1" bgcolor="#f5f5dc" align="center">
            <tr>
                <th>编号</th>
                <th>题目</th>
                <th>内容</th>
                <th>标题</th>
            </tr>
            <%
                /*
                 * 分页显示,
                 */
            %>
            <%
                request.setCharacterEncoding("UTF-8");


                // 获得 当前的页数
                String getStrPage = request.getParameter("page");


                // 连接数据库
                NewsDaoImp Sql = new NewsDaoImp();

                String t1 = "", t2 = "";

                try {
                    ResultSet resultSet = Sql.Select("SELECT * From news");


                    // List 与迭代器

                    if (resultSet.next()) {
                        while ( idexI < PageSize && !resultSet.isAfterLast() ) {
                            String the = resultSet.getInt("nid") + " " + resultSet.getString("ntheme") + " " + resultSet.getString("nnews") + " " + resultSet.getString("ntitle");
                            list.add(the);
                            resultSet.next();
                            //out.print(the);
                            idexI ++ ;
                        }
                    }
                    resultSet.close();
                    Iterator<String> iter = list.iterator();
                    while (iter.hasNext()) {
                        String[] display_themes = iter.next().split(" ");
                        out.print("<tr>");
                        out.print("<td>" + display_themes[0] + "</td><td>" + display_themes[1] + "</td><td>" + display_themes[2] + "</td> <td>" + display_themes[3]+"</td>");
                        t1 = display_themes[0];
                        t2 = display_themes[1];
//                        out.print(" <button type=\"button\" name=\"change\" id=\"change\" onclick=\"javascrtpt:window.location.href='themes_update.jsp?tid=" + t1 + "+&tname=" + t2 + "'\" >修改</button> " +
//                                "<button type=\"button\" name=\"delete\" id=\"delete\" onclick=\"javascrtpt:window.location.href='themes_delete.jsp?tid=" + t1 + "'\">删除</button>");
                        out.print("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                }
                /*
                Sql.Connect();
                Countnum = Sql.getCount("news"); // 获得数据总记录
                也可以实现:
                */
            %>
        </table>
    </div>
    <div align="center">
        当前页数: <%=nowPage%> , 共 <%=PageCount%> 页
        <%
            if( nowPage <PageCount){
                out.print("<a  target=\"mainFrame\" href=\"news_list.jsp? page="+(nowPage+1)+"\">下一页</a>");
            }
            if( nowPage > 1){
                out.print("<a target=\"mainFrame\" href=\"news_list.jsp? page="+(nowPage-1)+"\">下一页</a>");
            }
        %>
    </div>
</body>
</html>
