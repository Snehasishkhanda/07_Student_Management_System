<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>

<%
String course = request.getParameter("course");
String branch = request.getParameter("branch");
String rollNo = request.getParameter("rollNo");
String name = request.getParameter("name");
String fatherName = request.getParameter("fatherName");
String gender = request.getParameter("gender");

Connection con = null;
PreparedStatement ps = null;

try {
    con = ConnectionProvider.getCon();
    String query = "INSERT INTO student VALUES (?, ?, ?, ?, ?, ?)";
    ps = con.prepareStatement(query);
    ps.setString(1, course);
    ps.setString(2, branch);
    ps.setString(3, rollNo);
    ps.setString(4, name);
    ps.setString(5, fatherName);
    ps.setString(6, gender);
    ps.executeUpdate();
    response.sendRedirect("adminHome.jsp");
} catch (Exception e) {
    e.printStackTrace();
    out.println("Error occurred: " + e.getMessage());
} finally {
    try {
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
%>
