package com.homeworksystem.bean;

import java.io.Serializable;
/**
 * 课程类
 *包括属性：
 *@param courseId课程号
 *@param teacherId教师工号
 *@param courseName课程名
 *@param teacherName教师名
 *@param num选课人数
 */
public class Course implements Serializable{

    /**
	 * 序列号
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 课程号
	 */
	private Integer courseId;

	/**
	 * 教师工号
	 */
    private String teacherId;

    /**
     * 课程名
     */
    private String courseName;

    /**
     * 教师名
     */
    private String teacherName;
    
    /**
     * 选课人数
     */
    private Integer num;
    
    
    public Course() {
    	
    }
    
    /**
     * 
     * @param courseId
     * @param teacherId
     * @param courseName
     * @param teacherName
     */
    public Course(Integer courseId, String teacherId, String courseName, String teacherName) {
		super();
		this.courseId = courseId;
		this.teacherId = teacherId;
		this.courseName = courseName;
		this.teacherName = teacherName;
	}


	public Integer getCourseId() {
        return courseId;
    }


    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }


    public String getTeacherId() {
        return teacherId;
    }

 
    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId == null ? null : teacherId.trim();
    }


    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    
    
	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", teacherId=" + teacherId + ", courseName=" + courseName
				+ ", teacherName=" + teacherName + "]";
	}
    
}