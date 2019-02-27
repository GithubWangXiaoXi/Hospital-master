package com.ming.hospital.pojo;

import java.util.Date;
import java.util.List;

public class Prescription {

    private Long pid;
    private Appointment appointment;
    private String description;
    private String medicineMno;
    private String medicineMname;

    public String getMedicineMname() {
        return medicineMname;
    }

    public void setMedicineMname(String medicineMname) {
        this.medicineMname = medicineMname;
    }

    private Date createtime;

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public String getMedicineMno() {
        return medicineMno;
    }

    public void setMedicineMno(String medicineMno) {
        this.medicineMno = medicineMno;
    }

    @Override
    public String toString() {
        return "Prescription{" +
                "pid=" + pid +
                ", appointment=" + appointment +
                ", description='" + description + '\'' +
                ", medicineMno='" + medicineMno + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
