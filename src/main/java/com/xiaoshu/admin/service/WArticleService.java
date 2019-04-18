package com.xiaoshu.admin.service;

import com.xiaoshu.admin.entity.WArticle;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-11
 */
public interface WArticleService extends IService<WArticle> {
    void saveProduct(WArticle wArticle);

    List<WArticle> selectAll();

    WArticle selectProductById(String id);

}
