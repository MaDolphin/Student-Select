package com.demo.serviceImpl;

import com.demo.dao.ManagerMapper;
import com.demo.service.ManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lenovo on 2016/10/25.
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
    @Resource
    private ManagerMapper managerDao;
}
