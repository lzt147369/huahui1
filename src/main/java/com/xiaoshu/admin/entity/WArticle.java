package com.xiaoshu.admin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.xiaoshu.common.base.BaseEntity;

import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-11
 */
@TableName("w_article")
public class WArticle extends BaseEntity<WArticle> {

    private static final long serialVersionUID = 1L;


    /**
     * 标题
     */
    private String title;

    /**
     * 作者
     */
    private String writer;

    /**
     * 内容
     */
    private String content;

    /**
     * 发布时间
     */
    private LocalDateTime time;

    /**
     * 发布状态:1.发布;2.草稿
     */
    private Integer status;

    /**
     * 图片地址
     */
    private String url;

    private String name;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static final String ID = "id";

    public static final String TITLE = "title";

    public static final String WRITER = "writer";

    public static final String CONTENT = "content";

    public static final String TIME = "time";

    public static final String STATUS = "status";

    public static final String URL = "url";

    public static final String NAME = "name";

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "WArticle{" +
        ", id=" + id +
        ", title=" + title +
        ", writer=" + writer +
        ", content=" + content +
        ", time=" + time +
        ", status=" + status +
        ", url=" + url +
        ", name=" + name +
        "}";
    }
}
