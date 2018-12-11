package entity;

import javax.websocket.Decoder;
import javax.websocket.Encoder;

public class WhiteWall {
    private int id;
    private String contant;
  //  private Encoder.BinaryStream image;

    public WhiteWall() {};
    public WhiteWall(int id, String contant)
    {
        this.id = id;
        this.contant = contant;
        //this.image = image;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setContant(String contant) {
        this.contant = contant;
    }
    public int getId() {
        return id;
    }
    public String getContant() {
        return contant;
    }
}
