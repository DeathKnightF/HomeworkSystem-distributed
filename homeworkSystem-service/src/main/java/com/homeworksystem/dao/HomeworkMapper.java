package com.homeworksystem.dao;

import com.homeworksystem.bean.Homework;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * 持久层
 * 功能：对数据库进行增删改查，为service层提供方法操作数据库
 * 具体实现在conf/mapper/HomeworkMapper.xml
 *
 */
public interface HomeworkMapper {
	/**
	 * 根据主键删除对应作业
	 * @param studentId
	 * @param questionId
	 * @return
	 */
    int deleteByPrimaryKey(@Param("studentId") String studentId, @Param("questionId") Integer questionId);

    /**
     * 插入
     * @param record
     * @return
     */
    int insert(Homework record);

    /**
     * 通过主键查找作业
     * @param studentId
     * @param questionId
     * @return
     */
    Homework selectByPrimaryKey(@Param("studentId") String studentId, @Param("questionId") Integer questionId);

    /**
     * 查找全部作业
     * @return
     */
    List<Homework> selectAll();

    /**
     * 通过主键更新作业
     * @param record
     * @return
     */
    int updateByPrimaryKey(Homework record);
    
    /**
     * 通过问题号，查找这个问题下的全部作业
     * @param questionId
     * @return
     */
    List<Homework> selectByQuestionId(@Param("questionId")Integer questionId);
    
    /**
     * 查询学生这个问题的成绩
     * @param questionId
     * @param studentId
     * @return
     */
    Integer selectScore(@Param("questionId")Integer questionId,@Param("studentId")String studentId);
    /**
           * 更新分数
     * @param questionId
     * @param studentId
     * @param score
     */
    void updateScore(@Param("questionId")Integer questionId,@Param("studentId")String studentId,@Param("score")Integer score);
    /**
     * 查找已经提交作业的学生人数
     * @param questionId
     * @return
     */
    int selectNumByQuestionId(@Param("questionId")Integer questionId);
    /**
     * 查重更新
     * @param homeworks
     */
    void updateRepeatability(@Param("homeworks")List<Homework> homeworks);
    /**
     * 更新分数
     * @param homeworks
     */
	void updateScores(@Param("homeworks")List<Homework> homeworks);
}