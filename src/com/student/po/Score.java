package com.student.po;

public class Score {
    private int sno;
    private String sname;
    private double ChineseScore;
    private double MathScore;
    private double EnglishScore;
    private double TotalScore;

    public Score(int sno, String sname, double ChineseScore, double MathScore, double EnglishScore, double TotalScore) {
        this.sno = sno;
        this.sname = sname;
        this.ChineseScore = ChineseScore;
        this.MathScore = MathScore;
        this.EnglishScore = EnglishScore;
        this.TotalScore = TotalScore;
    }

    public Score() {

    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }
    public double getChineseScore() {
        return ChineseScore;
    }

    public void setChineseScore(double ChineseScore) {
        this.ChineseScore = ChineseScore;
    }

    public double getMathScore() {
        return MathScore;
    }

    public void setMathScore(double MathScore) {
        this.MathScore = MathScore;
    }
    public double getEnglishScore() {
        return EnglishScore;
    }

    public void setEnglishScore(double EnglishScore) {
        this.EnglishScore = EnglishScore;
    }
    public double getTotalScore() {
        return TotalScore;
    }

    public void setTotalScore(double TotalScore) {
        this.TotalScore = TotalScore;
    }


}
