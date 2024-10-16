<%-- 
    Document   : bai_3
    Created on : Oct 16, 2024, 8:45:13 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>DIỆN TÍCH-CHU VI HINH TRÒN</h1>
        <form action="bai_3.jsp" method="POST">
            <table border="0">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Hãy nhập bán kính</td>
                        <td><input type="text" name="bankinh" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Tính toán" />
                            <input type="reset" value="Tiếp tục" />
                        </td>
                        
                    </tr>
                </tbody>
            </table>

        </form>
        <%
            String bankinh=request.getParameter("bankinh");
            if(bankinh!=null){
            double r=Double.parseDouble(bankinh);
            double cv=2*Math.PI*r;
            double dt=Math.PI*r*r;
            out.println("Diện tích:"+dt+"</br>");
            out.println("Chu vi:"+cv+"</br>");
            }
            %>
    </body>
</html>
