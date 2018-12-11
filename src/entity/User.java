package entity;

public class User {
    private int id;
    private String name;
    private String pwd;
    private String permission;
    private String nick;
    public User(){
        super();
    }

    public User(int id,String username,String userpwd,String userPermisson,String usernick){
        this.id = id;
        this.name = username;
        this.pwd = userpwd;
        this.permission = userPermisson;
        this.nick = usernick;
    }


    public void setId(int id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public void setPermission(String permission) { this.permission = permission; }
    public void setNick(String nick) { this.nick = nick; }
    public String getName() {
        return name;
    }
    public String getPwd() {
        return pwd;
    }
    public int getId() {
        return id;
    }
    public String getPermission() {
        return permission;
    }
    public String getNick() { return nick; }
    @Override
    public String toString() {
        return "User [id= " + id + ", username= " + name + ", pwd= " + pwd + ", permission= " + permission + "]";
    }
}
