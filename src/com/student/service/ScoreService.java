package com.student.service;

import com.student.dao.ScoreDao;
import com.student.po.Score;

import java.util.List;

public class ScoreService {
    private ScoreDao scoreDao = new ScoreDao();

    public List<Score> getAllScores() {
        return scoreDao.getAllScores();
    }
}