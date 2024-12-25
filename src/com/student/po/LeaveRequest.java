package com.student.po;

public class LeaveRequest {
    private String student_name;
    private String student_id;
    private String leave_time;
    private String leave_reason;

    public LeaveRequest(String student_name, String student_id, String leave_time, String leave_reason) {
        this.student_name = student_name;
        this.student_id = student_id;
        this.leave_time = leave_time;
        this.leave_reason = leave_reason;
    }

    public LeaveRequest() {

    }


    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getLeave_time() {
        return leave_time;
    }

    public void setLeave_time(String leave_time) {
        this.leave_time = leave_time;
    }

    public String getLeave_reason() {return leave_reason;}

    public void setLeave_reason(String leave_reason) {this.leave_reason = leave_reason;}
}
