package entity;

public class Theme {
    private String Theme_name;
    private  int Theme_id;
    public Theme(Theme theme){
        super();
    }
    public Theme(int id ,String theme_name){
        this.Theme_id = id;
        this.Theme_name=theme_name;
    }

    public void setTheme_id(int theme_id) {
        Theme_id = theme_id;
    }

    public void setTheme_name(String theme_name) {
        Theme_name = theme_name;
    }

    public int getTheme_id() {
        return Theme_id;
    }

    public String getTheme_name() {
        return Theme_name;
    }

    @Override
    public String toString() {
        return "[theme_id: "+this.Theme_id+"; theme_name: "+this.Theme_name+" ]";
    }
}
