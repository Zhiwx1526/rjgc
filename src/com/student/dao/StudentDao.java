package com.student.dao;


import java.util.List;

import com.student.po.Student;

public interface StudentDao {

    public boolean login(int uid ,String pwd);

    public boolean addLogin(int uid, String pwd);

    public List<Student> getAllStudents();

    public List<Student> queryStudentByPage(int currentPage,int pageSize);

    public Student deleteStudent(int sno);

    public Student queryStudentBySno(int sno);

    public int updateStudentBySno(int sno,Student stu);

    public int getTotalCount();

    public int addStudent(Student student);

    Student findStudentBySno(int sno);
    boolean updatePassword(int uid, String oldPwd, String newPwd);
}


