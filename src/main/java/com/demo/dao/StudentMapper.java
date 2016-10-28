package com.demo.dao;

import com.demo.entity.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface StudentMapper {
    @Delete({
        "delete from student",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String studentId);

    @Insert({
        "insert into student (student_id, person_id, ",
        "student_name, student_pwd, ",
        "student_sex, student_birthday, ",
        "major_id, student_tel, ",
        "teacher_id, student_comment)",
        "values (#{studentId,jdbcType=VARCHAR}, #{personId,jdbcType=VARCHAR}, ",
        "#{studentName,jdbcType=VARCHAR}, #{studentPwd,jdbcType=VARCHAR}, ",
        "#{studentSex,jdbcType=VARCHAR}, #{studentBirthday,jdbcType=VARCHAR}, ",
        "#{majorId,jdbcType=VARCHAR}, #{studentTel,jdbcType=VARCHAR}, ",
        "#{teacherId,jdbcType=VARCHAR}, #{studentComment,jdbcType=LONGVARCHAR})"
    })
    int insert(Student record);

    int insertSelective(Student record);

    @Select({
        "select",
        "student_id, person_id, student_name, student_pwd, student_sex, student_birthday, ",
        "major_id, student_tel, teacher_id, student_comment",
        "from student",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    @ResultMap("ResultMapWithBLOBs")
    Student selectByPrimaryKey(String studentId);

    int updateByPrimaryKeySelective(Student record);

    @Update({
        "update student",
        "set person_id = #{personId,jdbcType=VARCHAR},",
          "student_name = #{studentName,jdbcType=VARCHAR},",
          "student_pwd = #{studentPwd,jdbcType=VARCHAR},",
          "student_sex = #{studentSex,jdbcType=VARCHAR},",
          "student_birthday = #{studentBirthday,jdbcType=VARCHAR},",
          "major_id = #{majorId,jdbcType=VARCHAR},",
          "student_tel = #{studentTel,jdbcType=VARCHAR},",
          "teacher_id = #{teacherId,jdbcType=VARCHAR},",
          "student_comment = #{studentComment,jdbcType=LONGVARCHAR}",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKeyWithBLOBs(Student record);

    @Update({
        "update student",
        "set person_id = #{personId,jdbcType=VARCHAR},",
          "student_name = #{studentName,jdbcType=VARCHAR},",
          "student_pwd = #{studentPwd,jdbcType=VARCHAR},",
          "student_sex = #{studentSex,jdbcType=VARCHAR},",
          "student_birthday = #{studentBirthday,jdbcType=VARCHAR},",
          "major_id = #{majorId,jdbcType=VARCHAR},",
          "student_tel = #{studentTel,jdbcType=VARCHAR},",
          "teacher_id = #{teacherId,jdbcType=VARCHAR}",
        "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(Student record);

    @Select({
            "select",
            "*",
            "from student",
            "where student_id = #{0}",
            "and student_pwd = #{1}"
    })
    @ResultMap("BaseResultMap")
    Student isExist(String userName,String password);

    @Update({
            "update student",
            "set person_id = #{personId,jdbcType=VARCHAR},",
            "student_name = #{studentName,jdbcType=VARCHAR},",
            "student_pwd = #{studentPwd,jdbcType=VARCHAR},",
            "student_sex = #{studentSex,jdbcType=VARCHAR},",
            "student_birthday = #{studentBirthday,jdbcType=VARCHAR},",
            "major_id = #{majorId,jdbcType=VARCHAR},",
            "student_tel = #{studentTel,jdbcType=VARCHAR},",
            "teacher_id = #{teacherId,jdbcType=VARCHAR}",
            "where student_id = #{studentId,jdbcType=VARCHAR}"
    })
    int editPassword(Student student);

    @Select({
            "select",
            "*",
            "from student",
            "where student_id = #{0}"
    })
    @ResultMap("BaseResultMap")
    Student findStudentByStudentId(String studentId);

}