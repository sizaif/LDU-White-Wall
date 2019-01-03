package entity;

public class Uploadimg {

    private Integer id; // 主键ID
    private String imgurl; // 图片地址
    private String remark; // 标记
    private Integer state; // 状态

    public Uploadimg(){};
    public Uploadimg(Integer id,String imgurl){
        this.id = id;
        this.imgurl = imgurl;
    };
    public Uploadimg(Integer id)
    {
        this.id = id;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgurl() {
        return this.imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
