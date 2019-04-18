package com.xiaoshu.admin.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableName;
import com.xiaoshu.common.base.BaseEntity;

/**
 * <p>
 * 
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-12
 */
@TableName("w_reply")
public class WReply extends BaseEntity<WReply> {

	private static final long serialVersionUID = 1L;

	/**
	 * 文章ID
	 */
	private String wenid;

	/**
	 * 用户ID
	 */
	private String userid;

	/**
	 * 回复内容
	 */
	private String huifu;

	/**
	 * 时间
	 */
	private LocalDateTime shijian;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWenid() {
		return wenid;
	}

	public void setWenid(String wenid) {
		this.wenid = wenid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getHuifu() {
		return huifu;
	}

	public void setHuifu(String huifu) {
		this.huifu = huifu;
	}

	public LocalDateTime getShijian() {
		return shijian;
	}

	public void setShijian(LocalDateTime shijian) {
		this.shijian = shijian;
	}

	public static final String ID = "id";

	public static final String WENID = "wenid";

	public static final String USERID = "userid";

	public static final String HUIFU = "huifu";

	public static final String SHIJIAN = "shijian";

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "WReply{" + ", id=" + id + ", wenid=" + wenid + ", userid="
				+ userid + ", huifu=" + huifu + ", shijian=" + shijian + "}";
	}
}
