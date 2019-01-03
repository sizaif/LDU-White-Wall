package DaoImpTest;

import DaoImp.UploadImgDaoImp;
import entity.Uploadimg;
import org.junit.Test;

import static org.junit.Assert.*;

public class UploadImgDaoImpTest {

    @Test
    public void insertUploadimg() {
        int su = new UploadImgDaoImp().insertUploadimg(new Uploadimg(1,"2332"));
    }

    @Test
    public void deleteUploadimg() {
        int su = new UploadImgDaoImp().deleteUploadimg(1);
    }

    @Test
    public void findImgById() {
        Uploadimg up = new UploadImgDaoImp().findImgById(2);
        System.out.println(up.getImgurl());
    }
}