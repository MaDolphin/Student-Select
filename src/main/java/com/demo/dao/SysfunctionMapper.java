package com.demo.dao;

import com.demo.entity.Sysfunction;
import org.apache.ibatis.annotations.Insert;

public interface SysfunctionMapper {
    @Insert({
        "insert into sysfunction (type, status)",
        "values (#{type,jdbcType=VARCHAR}, #{status,jdbcType=INTEGER})"
    })
    int insert(Sysfunction record);

    int insertSelective(Sysfunction record);
}