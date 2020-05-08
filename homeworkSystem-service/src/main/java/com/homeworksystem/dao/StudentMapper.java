package com.homeworksystem.dao;

import com.homeworksystem.bean.Student;
import java.util.List;

/**
 * 持久层
 * 功能：对数据库进行增删改查，为service层提供方法操作数据库
 * 具体实现在conf/mapper/StudentMapper.xml
 *
 */
public interface StudentMapper {
	/**
	 * 通过主键删除学生
	 * @param studentId
	 * @return
	 */
    int deleteByPrimaryKey(String studentId);

    /**
     * 插入
     * @param record
     * @return
     */
    int insert(Student record);

    /**
     * 通过主键查找
     * @param studentId
     * @return
     */
    Student selectByPrimaryKey(String studentId);

    /**
     * 查找全部
     * @return
     */
    List<Student> selectAll();

    /**
     * 通过主键更新
     * @param record
     * @return
     */
    int updateByPrimaryKey(Student record);
}