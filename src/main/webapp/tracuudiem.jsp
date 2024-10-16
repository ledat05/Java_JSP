<%-- 
    Document   : tracuudiem
    Created on : Oct 16, 2024, 10:57:23 AM
    Author     : ADMIN
--%>

<%@page import="my.common.DatabaseUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tra cứu điểm</h1>
        <form action="tracuudiem.jsp" method="POST">
            Số báo danh <input type="text" name="sobd" value="" />
            Họ Tên <input type="text" name="hoten" value="" />
            <input type="submit" value="Tra cứu" />
        </form>
        <%
            request.setCharacterEncoding("UTF-8");
            String hoten = request.getParameter("hoten");
            String sobd = request.getParameter("sobd");
            if (hoten != null || sobd != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                conn = DatabaseUtil.getConnection();
                if (hoten != null && !hoten.isEmpty()) {
                    ps = conn.prepareStatement("Select * from thisinh where hoten like ?");
                    ps.setString(1, "%" + hoten + "%");
                } else if (sobd != null && !sobd.isEmpty()) {
                    ps = conn.prepareStatement("Select * from thisinh where sobd =?");
                    ps.setString(1, sobd);
                }
                rs = ps.executeQuery();
            

        %>
        <table border="1">        
            <tr>
                <th>Số báo danh</th>
                <th>Họ tên</th>
                <th>Điạ chỉ</th>
                <th>Điểm toán</th>
                <th>Điểm lý</th>
                <th>Điểm hoá</th>
                <th>Tổng điểm</th>
            </tr>
            <%                        while (rs.next()) {
                    double tongdiem = rs.getFloat("toan") + rs.getFloat("ly") + rs.getFloat("hoa");


            %>
            <tbody>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getFloat(4)%></td>
                    <td><%=rs.getFloat(5)%></td>
                    <td><%=rs.getFloat(6)%></td>
                    <td><%=tongdiem%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }
        %>


    </body>
</html>
