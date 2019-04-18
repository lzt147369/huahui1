package com.xiaoshu.admin.mapper;

import java.util.Map;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.WReply;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-12
 */
public interface WReplyMapper extends BaseMapper<WReply> {

	WReply selectProductById(Map<String, Object> map);

}
