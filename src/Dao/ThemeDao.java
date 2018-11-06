package Dao;

import entity.Theme;

public interface ThemeDao {
    /**\
     *
     * @param theme
     * @return int
     *  插入数据
     */
    public int inserttheme(Theme theme);

    /**
     *
     * @param id
     * @return int
     * 删除数据
     */
    public int deletetheme(int id);

    /**
     *
     * @param theme
     * @return int
     * 修改数据
     */
    public int updatetheme(Theme theme);

    /**
     *
     * @param id
     * @return Theme
     * 查询数据 通过 id
     */
    public Theme findthemeById(int id);

    /**
     *
     * @param name
     * @return Theme
     * 查询数据通过 name
     */
    public Theme findthemeByName(String name);



}
