package entity;


public class WhiteWall {
    private int id; // 自己的编号
    private String textWhite;
    private String imageurl;// 存储图片地址 到 数据库中
    private int uid;// 外键 链接到 user 表 与用户对应起来

    public WhiteWall() {};
    public WhiteWall(int id, String contant)
    {
        this.id = id;
        this.textWhite = contant;
        //this.image = image;
    }
    public WhiteWall(int id,String contant,String image,int uid){
        this.id = id;
        this.textWhite = contant;
        this.imageurl = image;
        this.uid = uid;
    }


    public void setId(int id) {
        this.id = id;
    }



    public void setUid(int uid) {
        this.uid = uid;
    }

    public void setTextWhite(String textWhite) {
        this.textWhite = textWhite;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }
    public int getId() {
        return id;
    }

    public int getUid() {
        return uid;
    }
    public String gettextWhite() {
        return textWhite;
    }


    public String getImageurl() {
        return imageurl;
    }
}
