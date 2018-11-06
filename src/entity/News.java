package entity;

public class News {
    private int id ;
    private String news_theme;
    private String news_content;
    private String news_title;

    public News(){
        super();
    }
    public News(int id,String theme,String content,String title){
        this.id =id;
        this.news_theme = theme;
        this.news_content = content;
        this.news_title = title;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }

    public void setNews_theme(String news_theme) {
        this.news_theme = news_theme;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }

    public int getId() {
        return id;
    }

    public String getNews_content() {
        return news_content;
    }

    public String getNews_theme() {
        return news_theme;
    }

    public String getNews_title() {
        return news_title;
    }

    @Override
    public String toString() {
        return "[id: "+id+";news_theme: "+ news_theme+";news_content"+news_content+";news_title"+news_title+"]";
    }
}
