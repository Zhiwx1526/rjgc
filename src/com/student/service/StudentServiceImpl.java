package com.student.service;


import java.util.List;
import com.student.dao.StudentDao;
import com.student.dao.StudentDaoImpl;
import com.student.po.Student;

public class StudentServiceImpl implements StudentService {

    StudentDao dao = new StudentDaoImpl();
    public StudentServiceImpl(StudentDao studentDao) {
        this.dao = studentDao;
    }
    @Override
    public boolean login(int uid, String pwd) {
        return dao.login(uid, pwd);
    }
    @Override
    public boolean addLogin(int uid, String pwd){
        return dao.addLogin(uid, pwd);
    }
    @Override
    public List<Student> getAllStudents() {
        return dao.getAllStudents();
    }
    @Override
    public List<Student> queryStudentsByPageNo(int current, int pageSize) {
        return dao.queryStudentByPage(current,pageSize);
    }
    @Override
    public Student deleteStudent(int sno){
        return dao.deleteStudent(sno);
    }
    public Student queryStudentBySno(int sno) {
        return dao.queryStudentBySno(sno);

    }

    public int updateStudentBySno(int sno, Student stu) {
        return dao.updateStudentBySno(sno,stu);
    }

    @Override
    public int getTotalCount() {
        return dao.getTotalCount();
    }

    @Override
    public int addStudent(Student student) {
        return dao.addStudent(student);
    }
    @Override
    public Student findStudentBySno(int sno) {
        return dao.findStudentBySno(sno);
    }
    public boolean updatePassword(int uid, String oldPwd, String newPwd){return dao.updatePassword(uid,oldPwd,newPwd);}
}

