package cn.entity;

public class News {
    private Integer id;

    private String ntitle;

    private String ndetails;

    private String ntime;

    public News(Integer id, String ntitle, String ndetails, String ntime) {
        this.id = id;
        this.ntitle = ntitle;
        this.ndetails = ndetails;
        this.ntime = ntime;
    }

    public News() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle == null ? null : ntitle.trim();
    }

    public String getNdetails() {
        return ndetails;
    }

    public void setNdetails(String ndetails) {
        this.ndetails = ndetails == null ? null : ndetails.trim();
    }

    public String getNtime() {
        return ntime;
    }

    public void setNtime(String ntime) {
        this.ntime = ntime == null ? null : ntime.trim();
    }
}