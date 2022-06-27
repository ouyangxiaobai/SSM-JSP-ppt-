package cn.entity;

public class Order {
    private Integer id;

    private String ouid;

    private String obid;

    private String otype;

    private String octime;

    private String oprice;

    private String onote;

    private String ostate;

    private String oftime;

    public Order(Integer id, String ouid, String obid, String otype, String octime, String oprice, String onote, String ostate, String oftime) {
        this.id = id;
        this.ouid = ouid;
        this.obid = obid;
        this.otype = otype;
        this.octime = octime;
        this.oprice = oprice;
        this.onote = onote;
        this.ostate = ostate;
        this.oftime = oftime;
    }

    public Order() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOuid() {
        return ouid;
    }

    public void setOuid(String ouid) {
        this.ouid = ouid == null ? null : ouid.trim();
    }

    public String getObid() {
        return obid;
    }

    public void setObid(String obid) {
        this.obid = obid;
    }

    public String getOtype() {
        return otype;
    }

    public void setOtype(String otype) {
        this.otype = otype == null ? null : otype.trim();
    }

    public String getOctime() {
        return octime;
    }

    public void setOctime(String octime) {
        this.octime = octime == null ? null : octime.trim();
    }

    public String getOprice() {
        return oprice;
    }

    public void setOprice(String oprice) {
        this.oprice = oprice == null ? null : oprice.trim();
    }

    public String getOnote() {
        return onote;
    }

    public void setOnote(String onote) {
        this.onote = onote == null ? null : onote.trim();
    }

    public String getOstate() {
        return ostate;
    }

    public void setOstate(String ostate) {
        this.ostate = ostate;
    }

    public String getOftime() {
        return oftime;
    }

    public void setOftime(String oftime) {
        this.oftime = oftime;
    }
}