package entity;



import Utils.DateUtils;

import java.text.ParseException;
import java.util.Date;

public class Anecdote implements Comparable {

    private int id; // 编号
    private String title ;//题目
    private String author; // 作者
    private String sort; // 类别
    private String time; // 时间
    private int star; //点赞
    private int comment; // 评论数
    private int visit; //访问量
    private String content; // 内容
    public Anecdote() {

    }
    public Anecdote(int id, String title, String author, String sort, String time, int star, int comment, int visit, String content) {
        super();
        this.id = id;
        this.title = title;
        this.author = author;
        this.sort = sort;
        this.time = time;
        this.star = star;
        this.comment = comment;
        this.visit = visit;
        this.content = content;
    }


    public void setId(int id) {
        this.id = id;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setVisit(int visit) {
        this.visit = visit;
    }


    public int getId() {
        return id;
    }

    public int getComment() {
        return comment;
    }

    public int getStar() {
        return star;
    }

    public int getVisit() {
        return visit;
    }

    public String getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public String getSort() {
        return sort;
    }

    public String getTime() {
        return time;
    }

    public String getTitle() {
        return title;
    }

    /**
     * Compares this object with the specified object for order.  Returns a
     * negative integer, zero, or a positive integer as this object is less
     * than, equal to, or greater than the specified object.
     * <p>
     * <p>The implementor must ensure <tt>sgn(x.compareTo(y)) ==
     * -sgn(y.compareTo(x))</tt> for all <tt>x</tt> and <tt>y</tt>.  (This
     * implies that <tt>x.compareTo(y)</tt> must throw an exception iff
     * <tt>y.compareTo(x)</tt> throws an exception.)
     * <p>
     * <p>The implementor must also ensure that the relation is transitive:
     * <tt>(x.compareTo(y)&gt;0 &amp;&amp; y.compareTo(z)&gt;0)</tt> implies
     * <tt>x.compareTo(z)&gt;0</tt>.
     * <p>
     * <p>Finally, the implementor must ensure that <tt>x.compareTo(y)==0</tt>
     * implies that <tt>sgn(x.compareTo(z)) == sgn(y.compareTo(z))</tt>, for
     * all <tt>z</tt>.
     * <p>
     * <p>It is strongly recommended, but <i>not</i> strictly required that
     * <tt>(x.compareTo(y)==0) == (x.equals(y))</tt>.  Generally speaking, any
     * class that implements the <tt>Comparable</tt> interface and violates
     * this condition should clearly indicate this fact.  The recommended
     * language is "Note: this class has a natural ordering that is
     * inconsistent with equals."
     * <p>
     * <p>In the foregoing description, the notation
     * <tt>sgn(</tt><i>expression</i><tt>)</tt> designates the mathematical
     * <i>signum</i> function, which is defined to return one of <tt>-1</tt>,
     * <tt>0</tt>, or <tt>1</tt> according to whether the value of
     * <i>expression</i> is negative, zero or positive.
     *
     * @param o the object to be compared.
     * @return a negative integer, zero, or a positive integer as this object
     * is less than, equal to, or greater than the specified object.
     * @throws NullPointerException if the specified object is null
     * @throws ClassCastException   if the specified object's type prevents it
     *                              from being compared to this object.
     */
    @Override
    public int compareTo(Object o) {
        if (o instanceof Anecdote) {
            Anecdote anecdote = (Anecdote) o;

            Date this_date = null;
            Date other_date = null;
            try {
                this_date = DateUtils.getDate(this.time);
                other_date = DateUtils.getDate(anecdote.getTime());
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            return -this_date.compareTo(other_date);
        }
        return 0;
    }
}
