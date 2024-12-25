package com.student.dao;

import com.student.po.Score;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScoreDao {
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/student";
        String user = "root";
        String password = "123456789";
        return DriverManager.getConnection(url, user, password);
    }

    public List<Score> getAllScores() {
        List<Score> scores = new ArrayList<>();
        String query = "SELECT * FROM StudentScores ORDER BY TotalScore DESC"; // 按总分降序排列

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Score score = new Score(
                        rs.getInt("sno"),
                        rs.getString("sname"),
                        rs.getDouble("ChineseScore"),
                        rs.getDouble("MathScore"),
                        rs.getDouble("EnglishScore"),
                        rs.getDouble("ChineseScore") + rs.getDouble("MathScore") + rs.getDouble("EnglishScore") // 计算总分
                );
                scores.add(score);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return scores;
    }
}