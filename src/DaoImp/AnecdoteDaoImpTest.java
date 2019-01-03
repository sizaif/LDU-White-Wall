package DaoImp;

import entity.Anecdote;
import org.junit.Test;

import java.util.Iterator;
import java.util.List;

import static org.junit.Assert.*;

public class AnecdoteDaoImpTest {

    @Test
    public void getPageArticle() {
        List<Anecdote> list = new AnecdoteDaoImp().getPageArticle(0,10);
        Iterator<Anecdote> it = list.iterator();
        while (it.hasNext()){
            Anecdote an = it.next();
            System.out.println(an.getTitle());
        }
    }

    @Test
    public void getAllSort() {
        List<String> list = new AnecdoteDaoImp().getAllSort();
        Iterator<String>it = list.iterator();
        while(it.hasNext()){
            System.out.println(it.next().toString());
        }
    }

    @Test
    public void getArticleByID() {
        Anecdote an = new AnecdoteDaoImp().getArticleByID(10);
        System.out.println (an.getId());
    }
}