package com.cn.hnust.pojo;

public class Sysinfo {
    private Integer id;

    private String systominfo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSystominfo() {
        return systominfo;
    }

    public void setSystominfo(String systominfo) {
        this.systominfo = systominfo == null ? null : systominfo.trim();
    }
}