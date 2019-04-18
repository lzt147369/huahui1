package com.xiaoshu.admin.service;

import java.util.Set;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.Role;
import com.xiaoshu.admin.entity.User;

public interface UserService extends IService<User> {

	User findUserByLoginName(String name);

	User findUserById(String id);

	int userCount(String loginName);

	void saveUserRoles(String id, Set<Role> roleLists);

	void saveUser(User user);

	void updateUser(User user);

	void deleteUser(User user);

	void lockUser(User user);

	void xiugai(String id);
}
