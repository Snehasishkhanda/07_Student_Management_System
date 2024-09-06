<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        img {
            margin: 10px;
        }

        center {
            display: block;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .footer {
            font-weight: bold;
            background-color: #4CAF50;
            color: white;
        }

        .new1 {
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <%
    try {
        String rollNo = request.getParameter("rollNo");
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM student INNER JOIN result ON student.rollNo=result.rollNo WHERE student.rollNo='" + rollNo + "'");
        if (rs.next()) {
    %>
    
    <img src="logo.png" align="left" width="150" height="150">
    <center>
        <img src="dgi.png" width="150" height="150">
        <img src="cgu logo.png" align="right" width="150" height="150">
    </center>
    <a href="dgiOneView.html">Back</a>
    <hr class="new1">
    <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
                <tr>
                    <th>institution Name:CGU</th>
                    <th>Course Name:<%=rs.getString(1)%></th>
                    <th>Branch Name:<%=rs.getString(2)%></th>
                    <th><center><%=rs.getString(3)%></center></th>
                </tr>
            </thead>
            <thead>
                <tr>
                    <th>Name: <%=rs.getString(4)%></th>
                    <th>Parent Name: <%=rs.getString(5)%></th>
                    <th>Gender: <%=rs.getString(6)%></th>
                    <th><a titlt="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;"><center><img src="print.png"></center></a></th>
                </tr>
            </thead>
        </table>
    </div>
    <table>
        <thead>
            <tr>
                <td colspan="3">Course</td>
                <td rowspan="2">Type</td>
                <td rowspan="2">Full Marks</td>
                <td rowspan="2">Passing Marks</td>
                <td rowspan="2">Obtained Marks</td>
            </tr>
            <tr>
                <td>Code</td>
                <td colspan="2">Name</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>CS100</td>
                <td colspan="2">E JAVA</td>
                <td>Theory</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(8)%></td>
            </tr>
            <tr>
                <td>CS101</td>
                <td colspan="2">IOT</td>
                <td>Theory</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(9)%></td>
            </tr>
            <tr>
                <td>CS102</td>
                <td colspan="2">SEAM</td>
                <td>Theory</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(10)%></td>
            </tr>
            <tr>
                <td>CS103</td>
                <td colspan="2">CCV</td>
                <td>Theory</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(11)%></td>
            </tr>
            <tr>
                <td>CS104</td>
                <td colspan="2">DBE</td>
                <td>Theory</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(12)%></td>
            </tr>
            <tr>
                <td>CS105</td>
                <td colspan="2">JAVA</td>
                <td>Theory</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(13)%></td>
            </tr>
            <tr>
                <td>CS106</td>
                <td colspan="2">SDE</td>
                <td>Practical</td>
                <td>100</td>
                <td>30</td>
                <td><%=rs.getString(14)%></td>
            </tr>
            <!-- Add similar rows for other subjects -->
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" class="footer">Total Marks</td>
                <td>560</td>
                <td>180</td>
                <td>
                    <% 
                    int sum = rs.getInt(8) + rs.getInt(9) + rs.getInt(10) + rs.getInt(11) + rs.getInt(12) + rs.getInt(13) + rs.getInt(14);
                    out.println(sum);
                    %>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="footer">Percentage</td>
                <td colspan="3">
                    <% 
                    out.println((sum * 100) / 700); 
                    %>
                </td>
            </tr>
        </tfoot>
    </table>
    <%} else {
        response.sendRedirect("errorDgiOneView.html");
    }
    } catch (Exception e) {
        e.printStackTrace();
    }%>
</body>
</html>
