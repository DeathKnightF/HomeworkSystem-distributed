package com.homeworksystem.bean;

import java.io.Serializable;
/**
 * 选课信息
 * @param studentId 学号
 * @param courseId 课程号
 *
 */
public class CurriculaVariable implements Serializable{
	
	

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private String studentId;


    private Integer courseId;


    public CurriculaVariable() {
    	
    }
    
    
    public CurriculaVariable(String studentId, String courseId) {
		super();
		this.studentId = studentId;
		this.courseId = Integer.parseInt(courseId);
	}


	public String getStudentId() {
        return studentId;
    }


    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public Integer getCourseId() {
        return courseId;
    }


    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}