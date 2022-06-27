package cn.entity;

public class Type {
    private Integer id;

    private String troom;

    private String torder;

    private String tbusiness;

    public Type(Integer id, String troom, String torder, String tbusiness) {
        this.id = id;
        this.troom = troom;
        this.torder = torder;
        this.tbusiness = tbusiness;
    }

    public Type() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTroom() {
        return troom;
    }

    public void setTroom(String troom) {
        this.troom = troom == null ? null : troom.trim();
    }

    public String getTorder() {
        return torder;
    }

    public void setTorder(String torder) {
        this.torder = torder == null ? null : torder.trim();
    }

    public String getTbusiness() {
        return tbusiness;
    }

    public void setTbusiness(String tbusiness) {
        this.tbusiness = tbusiness == null ? null : tbusiness.trim();
    }
}