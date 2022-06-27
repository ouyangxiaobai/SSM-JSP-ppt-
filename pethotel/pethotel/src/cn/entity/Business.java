package cn.entity;

public class Business {
    private Integer id;

    private String btype;

    private String btroom;

    private String bname;

    private String bsize;

    private String bprice;

    private String bphoto;

    private String bdetails;

    public Business(Integer id, String btype, String btroom, String bname, String bsize, String bprice, String bphoto, String bdetails) {
        this.id = id;
        this.btype = btype;
        this.btroom = btroom;
        this.bname = bname;
        this.bsize = bsize;
        this.bprice = bprice;
        this.bphoto = bphoto;
        this.bdetails = bdetails;
    }

    public Business() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBtype() {
        return btype;
    }

    public void setBtype(String btype) {
        this.btype = btype == null ? null : btype.trim();
    }

    public String getBtroom() {
        return btroom;
    }

    public void setBtroom(String btroom) {
        this.btroom = btroom == null ? null : btroom.trim();
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public String getBsize() {
        return bsize;
    }

    public void setBsize(String bsize) {
        this.bsize = bsize == null ? null : bsize.trim();
    }

    public String getBprice() {
        return bprice;
    }

    public void setBprice(String bprice) {
        this.bprice = bprice == null ? null : bprice.trim();
    }

    public String getBphoto() {
        return bphoto;
    }

    public void setBphoto(String bphoto) {
        this.bphoto = bphoto == null ? null : bphoto.trim();
    }

    public String getBdetails() {
        return bdetails;
    }

    public void setBdetails(String bdetails) {
        this.bdetails = bdetails == null ? null : bdetails.trim();
    }
}