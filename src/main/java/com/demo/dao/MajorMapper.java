package com.demo.dao;

import com.demo.entity.Major;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface MajorMapper {
    @Delete({
        "delete from major",
        "where major_id = #{majorId,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String majorId);

    @Insert({
        "insert into major (major_id, major_name, ",
        "college_name)",
        "values (#{majorId,jdbcType=VARCHAR}, #{majorName,jdbcType=VARCHAR}, ",
        "#{collegeName,jdbcType=VARCHAR})"
    })
    int insert(Major record);

    int insertSelective(Major record);

    @Select({
        "select",
        "major_id, major_name, college_name",
        "from major",
        "where major_id = #{majorId,jdbcType=VARCHAR}"
    })
    @ResultMap("BaseResultMap")
    Major selectByPrimaryKey(String majorId);

    int updateByPrimaryKeySelective(Major record);

    @Update({
        "update major",
        "set major_name = #{majorName,jdbcType=VARCHAR},",
          "college_name = #{collegeName,jdbcType=VARCHAR}",
        "where major_id = #{majorId,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(Major record);

    @Select({
            "select",
            "*",
            "from major",
            "where major_name = #{0}"
    })
    @ResultMap("BaseResultMap")
    List<Major> findCollegeByCollegeName(String collegeName);

    @Select({
            "SELECT",
            "m.college_name,t.*",
            "FROM (major m INNER JOIN teacher t ON t.major_id = m.major_id)",
            "WHERE m.college_name = #{0}",
            "and t.teacher_surplus > 0"
    })
    @ResultMap("BaseResultMap")
    List<Major> findSwapStudentByCollegeName(String collegeName);

    @Select({
            "select",
            "*",
            "from major"
    })
    @ResultMap("BaseResultMap")
    List<Major> findAllMajor();

}