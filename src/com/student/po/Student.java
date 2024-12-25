package com.student.po;


public class Student {

    private int sno;
    private String sname;
    private String sex;
    private int age;
    private String phone;

    public Student(int sno, String sname, String sex, int age, String phone) {
        this.sno = sno;
        this.sname = sname;
        this.sex = sex;
        this.age = age;
        this.phone = phone;
    }

    public Student() {

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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


}


