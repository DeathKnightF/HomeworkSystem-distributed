package com.homeworksystem.dao;

import com.homeworksystem.bean.Teacher;
import java.util.List;

/**
 * 持久层
 * 功能：对数据库进行增删改查，为service层提供方法操作数据库
 * 具体实现在conf/mapper/TeacherMapper.xml
 *
 */
public interface TeacherMapper {
    /**
     * 通过主键删除
     * @param teacherId
     * @return
     */
    int deleteByPrimaryKey(String teacherId);

    /**
     * 插入
     * @param record
     * @return
     */
    int insert(Teacher record);

    /**
     * 通过主键查找
     * @param teacherId
     * @return
     */
    Teacher selectByPrimaryKey(String teacherId);

    /**
     * 查找全部
     * @return
     */
    List<Teacher> selectAll();

    /**
     * 通过主键更新
     * @param record
     * @return
     */
    int updateByPrimaryKey(Teacher record);
}