package Service;

import Dao.AnecdoteDao;
import DaoImp.AnecdoteDaoImp;
import DaoImp.AnecdoteTagDaoImp;
import Utils.DateUtils;
import entity.Anecdote;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;

public class AnecdoteService {



    public Anecdote addArticle(HttpServletRequest request){
        //新建文章
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        Anecdote anecdote = null;
        try {
            String title = request.getParameter("title");
            String author = request.getParameter("author") ;
            String sort = request.getParameter("sort");
            String originTime  = request.getParameter("time");
            String uid = request.getParameter("uid");
            int star = 0;
            int comment = 0;
            int visit = 0;
            String content  =  request.getParameter("content");
            anecdote = new Anecdote(0,title,author,sort,originTime,star,comment,visit,content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(anecdote==null)
            return null;
        boolean su = new AnecdoteDaoImp().addAnecdote(anecdote);
        if(su == false) return null;

        //增加标签
        String str = request.getParameter("tags").trim();
        String [] tags = str.split(" ");
        AnecdoteTagDaoImp anecdoteTagDaoImp = new AnecdoteTagDaoImp();
        for(String tag:tags){
            anecdoteTagDaoImp.addTag(anecdote.getId(),tag);
        }
        return anecdote;
    }
}
