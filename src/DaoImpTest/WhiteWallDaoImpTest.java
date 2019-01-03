package DaoImpTest;

import DaoImp.WhiteWallDaoImp;
import entity.WhiteWall;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static org.junit.Assert.*;

public class WhiteWallDaoImpTest {

    @Test
    public void getPageWhiteWall() {
        List<WhiteWall> list  = new ArrayList<>();
        list = new WhiteWallDaoImp().getPageWhiteWall(1,6);
        Iterator<WhiteWall> iterator = list.iterator();
        while (iterator.hasNext())
        {
            System.out.println(iterator.next().gettextWhite());
        }

    }

    @Test
    public void listAll() {
        List<WhiteWall> list  = new ArrayList<>();
        list = new WhiteWallDaoImp().listAll();
        Iterator<WhiteWall> iterator = list.iterator();
        while (iterator.hasNext())
        {
            WhiteWall ww = iterator.next();
            System.out.println(ww.getId()+" "+ww.gettextWhite());
        }
    }
}