package com.xiaoshu.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xiaoshu.admin.entity.WArticle;
import com.xiaoshu.admin.mapper.WArticleMapper;
import com.xiaoshu.admin.service.WArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-11
 */
@Service
public class WArticleServiceImpl extends ServiceImpl<WArticleMapper, WArticle> implements WArticleService {

    @Override
    public List<WArticle> selectAll() {
        QueryWrapper wrapper = new QueryWrapper();
        return baseMapper.selectList(wrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveProduct(WArticle wArticle) {
        baseMapper.insert(wArticle);
    }

    @Override
    public WArticle selectProductById(String id) {
        Map<String, Object> map = new HashMap();
        map.put("id", id);
        return baseMapper.selectProductById(map);
    }
}
