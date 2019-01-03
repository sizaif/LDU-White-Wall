package DaoImpTest;

import DaoImp.ThemesDaoImp;
import entity.Theme;
import org.junit.Test;

import static org.junit.Assert.*;

public class ThemesDaoImpTest {

    @Test
    public void inserttheme() {
        System.out.println(new ThemesDaoImp().inserttheme(new Theme(1,"123123")));
        /**
         *
         *  test ok
         */
    }

    @Test
    public void deletetheme() {
        System.out.println(new ThemesDaoImp().deletetheme(5));
        /**
         *
         *  test ok
         */
    }

    @Test
    public void updatetheme() {
        System.out.println(new ThemesDaoImp().inserttheme(new Theme(5,"123")));
        /**
         *
         *  test ok
         */
    }

    @Test
    public void findthemeById() {
        Theme theme = new ThemesDaoImp().findthemeById(6);
        System.out.println(theme.toString());
        /**
         * test ok
         */
    }

    @Test
    public void findthemeByName() {
        Theme theme = new ThemesDaoImp().findthemeByName("123");
        System.out.println(theme.toString());
        /**
         * test ok
         */
    }
}