package com.student.po;

public class Absence {
    private String student_name;
    private String student_id;
    private String class_date;
    private String course_date;
    private int hours_absent;

    public Absence(String student_name, String student_id, String class_date, String course_date, int hours_absent) {
        this.student_name = student_name;
        this.student_id = student_id;
        this.class_date = class_date;
        this.course_date = course_date;
        this.hours_absent = hours_absent;
    }

    public Absence() {

    }

    public String getStudent_name() {return student_name;}
    public void setStudent_name(String student_name) {this.student_name = student_name;}
    public String getStudent_id() {return student_id;}
    public void setStudent_id(String student_id) {this.student_id = student_id;}
    public String getClass_date() {return class_date;}
    public void setClass_date(String class_date) {this.class_date = class_date;}
    public String getCourse_date() {return course_date;}
    public void setCourse_date(String course_date) {this.course_date = course_date;}
    public int getHours_absent() {return hours_absent;}
    public void setHours_absent(int hours_absent) {this.hours_absent = hours_absent;}
}
