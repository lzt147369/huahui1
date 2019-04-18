package com.xiaoshu.admin.mapper;

import java.util.Map;
import com.xiaoshu.admin.entity.WArticle;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-11
 */
public interface WArticleMapper extends BaseMapper<WArticle> {
    WArticle selectProductById(Map<String, Object> map);
}
