package com.student.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CaptchaServlet")
public class CaptchaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/jpeg");

        BufferedImage image = new BufferedImage(100, 30, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        Random random = new Random();

        g.setColor(new Color(240, 240, 240));
        g.fillRect(0, 0, 100, 30);

        String captcha = "";
        for (int i = 0; i < 4; i++) {
            int n = random.nextInt(10);
            captcha += n;
            g.setColor(new Color(50 + random.nextInt(100), 50 + random.nextInt(100), 50 + random.nextInt(100)));
            g.setFont(new Font("Arial", Font.BOLD, 20));
            g.drawString(String.valueOf(n), 15 + i * 20, 22);
        }

        HttpSession session = request.getSession();
        session.setAttribute("captcha", captcha);

        ImageIO.write(image, "JPEG", response.getOutputStream());
    }

}