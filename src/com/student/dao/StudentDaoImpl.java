package com.student.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.student.po.Student;
import com.student.DBN.DBTools;

public class StudentDaoImpl implements StudentDao {

    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;

    @Override
    public boolean login(int uid, String pwd) {

        try {
            Class.forName(DBTools.DRIVER_CLASS);

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();

            int count = 0;
            String sqlStr = "select * from login where uid =" + uid + " and pwd = '" + pwd + "'";

            rs = st.executeQuery(sqlStr);
            while(rs.next()) {
                count++;
            }
            if(count>0)
                return true;
            else
                return false;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public List<Student> getAllStudents() {
        try {
            Class.forName(DBTools.DRIVER_CLASS);// 加载驱动

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            // 3:执行sql语句，完成对数据库中表的数据的增删该查。必须创建一个语句对象（执行sql语句的）
            st = conn.createStatement();

            String sqlStr = "select * from student";

            rs = st.executeQuery(sqlStr);

            List<Student> allStudents = new ArrayList<Student>();

            while (rs.next()) {
                int sno1 = rs.getInt(1);
                String sname1 = rs.getString(2);
                String sex1 = rs.getString(3);
                int age1 = rs.getInt(4);
                String phone1 = rs.getString(5);
                Student s = new Student(sno1, sname1, sex1, age1, phone1);
                allStudents.add(s);
            }

            return allStudents;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    public List<Student> queryStudentByPage(int current, int pageSize) {
        try {
            Class.forName(DBTools.DRIVER_CLASS);// 加载驱动

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();

            int startPosition = current * pageSize;

            String sqlStr = "select * from student limit " + startPosition + "," + pageSize;
            rs = st.executeQuery(sqlStr);
            List<Student> allStudents = new ArrayList<Student>();
            while (rs.next()) {
                int sno1 = rs.getInt(1);
                String sname1 = rs.getString(2);
                String sex1 = rs.getString(3);
                int age1 = rs.getInt(4);
                String phone1 = rs.getString(5);
                Student s = new Student(sno1, sname1, sex1, age1, phone1);
                allStudents.add(s);
            }
            return allStudents;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public int getTotalCount() {

        try {
            Class.forName(DBTools.DRIVER_CLASS);// 加载驱动

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();
            String sql = "select count(*) from student";
            rs = st.executeQuery(sql);
            while (rs.next()){
                int totalCount = rs.getInt(1);
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int addStudent(Student student) {

        try {
            Class.forName(DBTools.DRIVER_CLASS);

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();
            String sqlStr = "insert into student values("+student.getSno()+",'" + student.getSname()+ "','" + student.getSex() +"',"+student.getAge()+",'"+student.getPhone()+"')";
            System.out.println(sqlStr);
            int result = st.executeUpdate(sqlStr);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    @Override
    public boolean addLogin(int uid, String pwd) {
        try {
            Class.forName(DBTools.DRIVER_CLASS);// 加载驱动

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();
            String sqlStr = "insert into login values(" + uid + ",'" + pwd + "')";

            int result = st.executeUpdate(sqlStr);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public Student deleteStudent(int sno) {
        try {
            Class.forName(DBTools.DRIVER_CLASS);
            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();
            String sqlStr = "delete from student where sno = " + sno;
            System.out.println(sqlStr);
            int result = st.executeUpdate(sqlStr);

        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Student queryStudentBySno(int sno) {
        try {
            Class.forName(DBTools.DRIVER_CLASS);// 加载驱动

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);

            st = conn.createStatement();

            String sqlStr = "select * from student where sno = "+ sno;
            rs = st.executeQuery(sqlStr);

            if (rs.next()) {
                int sno1 = rs.getInt(1);
                String sname1 = rs.getString(2);
                String sex1 = rs.getString(3);
                int age1 = rs.getInt(4);
                String phone1 = rs.getString(5);
                Student s = new Student(sno1, sname1, sex1, age1, phone1);
                return s;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public int updateStudentBySno(int sno, Student stu){
        try {
            Class.forName(DBTools.DRIVER_CLASS);// 加载驱动
            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();
            String sql = "update student set sname= '"+stu.getSname()+"', sex='"+stu.getSex()+"', age="+stu.getAge()+", phone='"+stu.getPhone()+"' where sno="+sno;
            System.out.println(sql);
            int result = st.executeUpdate(sql);

        } catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    @Override
    public Student findStudentBySno(int sno) {
        Student student = new Student();
        try {
            Class.forName(DBTools.DRIVER_CLASS);
            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            st = conn.createStatement();
            String sql = "SELECT * FROM student WHERE sno = "+sno;
            ResultSet resultSet = st.executeQuery(sql);
            if(resultSet.next()){
                student.setSno(resultSet.getInt("sno"));
                student.setSname(resultSet.getString("sname"));
                student.setSex(resultSet.getString("sex"));
                student.setAge(resultSet.getInt("age"));
                student.setPhone(resultSet.getString("phone"));
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return student;
    }

    @Override
    public boolean updatePassword(int uid, String oldPwd, String newPwd) {
        try {
            Class.forName(DBTools.DRIVER_CLASS);// 加载驱动

            conn = DriverManager.getConnection(DBTools.CONN_STR, DBTools.USRENAME, DBTools.PWD);
            // 创建一个语句对象
            st = conn.createStatement();

            String sqlStr = "UPDATE login SET pwd = '" + newPwd + "' WHERE uid = " + uid + " AND pwd = '" + oldPwd + "'";
            int rowsUpdated = st.executeUpdate(sqlStr);

            return rowsUpdated > 0;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

}


