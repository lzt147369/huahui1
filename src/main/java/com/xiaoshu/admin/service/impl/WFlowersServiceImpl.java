package com.xiaoshu.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.WFlowers;
import com.xiaoshu.admin.mapper.WFlowersMapper;
import com.xiaoshu.admin.service.WFlowersService;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-12
 */
@Service
public class WFlowersServiceImpl extends ServiceImpl<WFlowersMapper, WFlowers>
		implements
			WFlowersService {

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void lockUser(WFlowers wFlowers) {
		wFlowers.setAudit(1);
		wFlowers.updateById();
	}

	@Override
	public List<WFlowers> selectAll() {
		QueryWrapper wrapper = new QueryWrapper();
		return baseMapper.selectList(wrapper);
	}

	@Override
	public void saveProduct(WFlowers wFlowers) {
		baseMapper.insert(wFlowers);
	}

	@Override
	public WFlowers selectProductById(String id) {
		Map<String, Object> map = new HashMap();
		map.put("id", id);
		return baseMapper.selectProductById(map);
	}

}
