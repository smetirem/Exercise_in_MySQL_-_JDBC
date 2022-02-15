package com.company;

import java.sql.*;

public class Services {

    private static Connection con;

    public String ConnectToDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // disable SSL and also suppress the SSL errors
            con = DriverManager.getConnection("jdbc:mysql://localhost/moumoulidou?autoReconnect=true&useSSL=false", "root", "");
        return null;
        } catch (ClassNotFoundException ex) {
            return ex.getMessage();
        } catch (SQLException ex) {
            return ex.getMessage();
        }
    }

    public static ResultSet fetchStudent(String firstName, String lastName) throws SQLException {

        PreparedStatement pst = con.prepareStatement(
                "SELECT name, last_name, user_id, title, status, grade" +
                        " FROM enrollment JOIN courses ON enrollment.course_fk = courses.course_id RIGHT JOIN users ON users.user_id = enrollment.user_fk WHERE users.role = 'Student' and users.last_name = ? and users.name = ?");
        pst.setString(1, firstName);
        pst.setString(2, lastName);

        return pst.executeQuery();
    }
}
