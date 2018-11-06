package DaoImp;

import entity.News;
import org.junit.Test;

import static org.junit.Assert.*;

public class NewsDaoImpTest {

    @Test
    public void insertnews() {
        News news = new News(0,"A","B","C");
        NewsDaoImp newsDaoImp = new NewsDaoImp();
        int su = newsDaoImp.insertnews(news);
        if( su > 0){
            System.out.println("插入成功");
        }
        else
            System.out.println("falied");
        /**
         * test ok
         */
    }

    @Test
    public void deletenews() {
        int ss = new NewsDaoImp().deletenews(11);
        System.out.println(ss);
    }

    @Test
    public void updateUser() {
        News news = new News(10,"B","BC","CC");
        NewsDaoImp newsDaoImp = new NewsDaoImp();
        int su = newsDaoImp.updateUser(news);
        if( su > 0){
            System.out.println("插入成功");
        }
        else
            System.out.println("falied");
        /**
         * test ok
         */
    }

    @Test
    public void findNewsById() {
        News news = new NewsDaoImp().findNewsById(11);
        System.out.println(news.toString());
        /**
         * test pl
         */
    }
}