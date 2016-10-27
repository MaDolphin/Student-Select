package com.demo.dao;

import com.demo.entity.Major;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
}