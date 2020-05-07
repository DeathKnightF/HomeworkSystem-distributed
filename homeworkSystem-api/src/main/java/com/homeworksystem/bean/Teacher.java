package com.homeworksystem.bean;

import java.io.Serializable;
/**
 * 教师类
 *@param teacherId 工号
 *@param passWord MySQL password是关键字，所以数据库中密码用pass_word表示，对应驼峰命名是passWord 
 *@param userName 姓名
 *@param gender 性别
 */
public class Teacher implements Serializable{
    
    /**
	 * 序列号
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 教师工号
	 */
	private String teacherId;

    /**
     * MySQL password是关键字，所以数据库中密码用pass_word表示，对应驼峰命名是passWord 
     */
    private String passWord;

   /**
    * 姓名
    */
    private String userName;

    /**
     * 性别
     */
    private String gender;

    public Teacher() {
    	
    }
    
    public Teacher(String teacherId, String passWord, String userName, String gender) {
		super();
		this.teacherId = teacherId;
		this.passWord = passWord;
		this.userName = userName;
		this.gender = gender;
	}



	public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId == null ? null : teacherId.trim();
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord == null ? null : passWord.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

	@Override
	public String toString() {
		return "Teacher [teacherId=" + teacherId + ", passWord=" + passWord + ", userName=" + userName + ", gender="
				+ gender + "]";
	}
    
}