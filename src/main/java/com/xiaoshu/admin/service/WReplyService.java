package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.WReply;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-12
 */
public interface WReplyService extends IService<WReply> {

	void saveProduct(WReply wReply);

	WReply chaxun(String id);

}
