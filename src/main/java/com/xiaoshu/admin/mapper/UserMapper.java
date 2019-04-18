package com.xiaoshu.admin.mapper;

import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.Role;
import com.xiaoshu.admin.entity.User;

public interface UserMapper extends BaseMapper<User> {

	User selectUserByMap(Map<String, Object> map);

	void saveUserRoles(@Param("userId") String id,
            @Param("roleIds") Set<Role> roles);

	void dropUserRolesByUserId(@Param("userId") String id);

	void xiugai(String id);
}