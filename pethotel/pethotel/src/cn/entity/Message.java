package cn.entity;

public class Message {
    private Integer id;

    private String muid;

    private String muquestion;

    private String mutime;

    private String maid;

    private String maanswer;

    private String matime;

    private String mstate;

    public Message(Integer id, String muid, String muquestion, String mutime, String maid, String maanswer, String matime, String mstate) {
        this.id = id;
        this.muid = muid;
        this.muquestion = muquestion;
        this.mutime = mutime;
        this.maid = maid;
        this.maanswer = maanswer;
        this.matime = matime;
        this.mstate = mstate;
    }

    public Message() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMuid() {
        return muid;
    }

    public void setMuid(String muid) {
        this.muid = muid == null ? null : muid.trim();
    }

    public String getMuquestion() {
        return muquestion;
    }

    public void setMuquestion(String muquestion) {
        this.muquestion = muquestion == null ? null : muquestion.trim();
    }

    public String getMutime() {
        return mutime;
    }

    public void setMutime(String mutime) {
        this.mutime = mutime == null ? null : mutime.trim();
    }

    public String getMaid() {
        return maid;
    }

    public void setMaid(String maid) {
        this.maid = maid == null ? null : maid.trim();
    }

    public String getMaanswer() {
        return maanswer;
    }

    public void setMaanswer(String maanswer) {
        this.maanswer = maanswer == null ? null : maanswer.trim();
    }

    public String getMatime() {
        return matime;
    }

    public void setMatime(String matime) {
        this.matime = matime == null ? null : matime.trim();
    }

    public String getMstate() {
        return mstate;
    }

    public void setMstate(String mstate) {
        this.mstate = mstate;
    }
}