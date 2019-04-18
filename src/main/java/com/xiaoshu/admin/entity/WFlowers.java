package com.xiaoshu.admin.entity;

import java.io.Serializable;

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
@TableName("w_flowers")
public class WFlowers extends BaseEntity<WFlowers> {

	private static final long serialVersionUID = 1L;

	/**
	 * 花卉名称
	 */
	private String name;

	/**
	 * 花卉颜色
	 */
	private String hue;

	/**
	 * 花卉成长周期
	 */
	private String period;

	/**
	 * 浇水间隔
	 */
	private String water;

	/**
	 * 阳光辐射
	 */
	private String sun;

	/**
	 * 修剪周期
	 */
	private String trim;

	/**
	 * 分类
	 */
	private String classify;/**
	 * url
	 */
	private String url;

	private String tupianname;

	/**
	 * 审核
	 */
	private Integer audit;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHue() {
		return hue;
	}

	public void setHue(String hue) {
		this.hue = hue;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getWater() {
		return water;
	}

	public void setWater(String water) {
		this.water = water;
	}

	public String getSun() {
		return sun;
	}

	public void setSun(String sun) {
		this.sun = sun;
	}

	public String getTrim() {
		return trim;
	}

	public void setTrim(String trim) {
		this.trim = trim;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public Integer getAudit() {
		return audit;
	}

	public void setAudit(Integer audit) {
		this.audit = audit;
	}

	public static final String ID = "id";

	public static final String NAME = "name";

	public static final String HUE = "hue";

	public static final String PERIOD = "period";

	public static final String WATER = "water";

	public static final String SUN = "sun";

	public static final String TRIM = "trim";

	public static final String CLASSIFY = "classify";

	public static final String AUDIT = "audit";

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "WFlowers{" + ", id=" + id + ", name=" + name + ", hue=" + hue
				+ ", period=" + period + ", water=" + water + ", sun=" + sun
				+ ", trim=" + trim + ", classify=" + classify + ", audit="
				+ audit + "}";
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getTupianname()
	{
		return tupianname;
	}

	public void setTupianname(String tupianname)
	{
		this.tupianname = tupianname;
	}
}
