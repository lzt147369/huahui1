package com.xiaoshu.admin.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaoshu.admin.entity.WReply;
import com.xiaoshu.admin.mapper.WReplyMapper;
import com.xiaoshu.admin.service.WReplyService;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-12
 */
@Service
public class WReplyServiceImpl extends ServiceImpl<WReplyMapper, WReply>
		implements
			WReplyService {

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void saveProduct(WReply wReply) {
		baseMapper.insert(wReply);

	}

	@Override
	public WReply chaxun(String id) {
		Map<String, Object> map = new HashMap();
		map.put("id", id);
		return baseMapper.selectProductById(map);
	}

}
