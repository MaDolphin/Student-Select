package com.demo.dao;

import com.demo.entity.Sysfunction;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SysfunctionMapper {
    @Insert({
        "insert into sysfunction (type, status)",
        "values (#{type,jdbcType=VARCHAR}, #{status,jdbcType=INTEGER})"
    })
    int insert(Sysfunction record);

    int insertSelective(Sysfunction record);

    @Select({
            "SELECT",
            "*",
            "from sysfunction",
            "where type = #{0}"
    })

    Sysfunction checkAuthority(String type);

    @Update({
            "update sysfunction",
            "set status = #{status,jdbcType=INTEGER}",
            "where type = #{type,jdbcType=VARCHAR}"
    })
    void updateSysFunction(Sysfunction sysfunction);
}