package entity;

public class User {
    private int id;
    private String name;
    private String pwd;
    private String permission;

    public User(){
        super();
    }

    public User(int id,String username,String userpwd,String userPermisson){
        this.id = id;
        this.name = username;
        this.pwd = userpwd;
        this.permission = userPermisson;
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

    @Override
    public String toString() {
        return "User [id= " + id + ", username= " + name + ", pwd= " + pwd + ", permission= " + permission + "]";
    }
}
