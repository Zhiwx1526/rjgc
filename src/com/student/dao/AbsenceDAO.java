package com.student.dao;

import com.student.po.Absence;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AbsenceDAO {
    private Connection getConnection() throws SQLException {
        // 根据你的数据库配置修改以下连接信息
        String url = "jdbc:mysql://localhost:3306/student";
        String user = "root";
        String password = "123456789";
        return DriverManager.getConnection(url, user, password);
    }

    public List<Absence> getAllAbsences() {
        List<Absence> absences = new ArrayList<>();
        String sql = "SELECT * FROM Absences";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Absence absence = new Absence();
                absence.setStudent_name(rs.getString("student_name"));
                absence.setStudent_id(rs.getString("student_id"));
                absence.setClass_date(rs.getString("class_date"));
                absence.setCourse_date(rs.getString("course_name"));
                absence.setHours_absent(rs.getInt("hours_absent"));
                absences.add(absence);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return absences;
    }
}