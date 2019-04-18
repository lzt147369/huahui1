package com.xiaoshu.admin.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.WFlowers;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-12
 */
public interface WFlowersService extends IService<WFlowers> {

	void lockUser(WFlowers wFlowers);

	List<WFlowers> selectAll();

	void saveProduct(WFlowers wFlowers);

	WFlowers selectProductById(String id);

}
