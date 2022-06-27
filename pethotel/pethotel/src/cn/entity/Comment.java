package cn.entity;

public class Comment {
    private Integer id;

    private String cuid;

    private String cuname;

    private String cbid;

    private String cbname;

    private String cbphoto;

    private String ctime;

    private String ccontent;

    public Comment(Integer id, String cuid, String cuname, String cbid, String cbname, String cbphoto, String ctime, String ccontent) {
        this.id = id;
        this.cuid = cuid;
        this.cuname = cuname;
        this.cbid = cbid;
        this.cbname = cbname;
        this.cbphoto = cbphoto;
        this.ctime = ctime;
        this.ccontent = ccontent;
    }

    public Comment() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCuid() {
        return cuid;
    }

    public void setCuid(String cuid) {
        this.cuid = cuid == null ? null : cuid.trim();
    }

    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname == null ? null : cuname.trim();
    }

    public String getCbid() {
        return cbid;
    }

    public void setCbid(String cbid) {
        this.cbid = cbid == null ? null : cbid.trim();
    }

    public String getCbname() {
        return cbname;
    }

    public void setCbname(String cbname) {
        this.cbname = cbname == null ? null : cbname.trim();
    }

    public String getCbphoto() {
        return cbphoto;
    }

    public void setCbphoto(String cbphoto) {
        this.cbphoto = cbphoto == null ? null : cbphoto.trim();
    }

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime == null ? null : ctime.trim();
    }

    public String getCcontent() {
        return ccontent;
    }

    public void setCcontent(String ccontent) {
        this.ccontent = ccontent == null ? null : ccontent.trim();
    }
}