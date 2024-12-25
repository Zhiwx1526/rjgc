package com.student.servlet;

import com.student.service.ScoreService;
import com.student.po.Score;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/score")
public class ScoreServlet extends HttpServlet {
    private ScoreService scoreService = new ScoreService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Score> scores = scoreService.getAllScores();
        request.setAttribute("scores", scores);
        request.getRequestDispatcher("/score.jsp").forward(request, response); // 确保路径正确
    }
}