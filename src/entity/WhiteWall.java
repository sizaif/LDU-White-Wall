package entity;

import javax.websocket.Decoder;
import javax.websocket.Encoder;

public class WhiteWall {
    private int id;
    private String textWhite;
  //  private Encoder.BinaryStream image;
    /*
     *  先弄文字 ( textWhite )
     */
    public WhiteWall() {};
    public WhiteWall(int id, String contant)
    {
        this.id = id;
        this.textWhite = contant;
        //this.image = image;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void settextWhite(String contant) {
        this.textWhite = contant;
    }
    public int getId() {
        return id;
    }
    public String gettextWhite() {
        return textWhite;
    }
}
