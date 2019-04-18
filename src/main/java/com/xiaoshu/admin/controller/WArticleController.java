package com.xiaoshu.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.WArticle;
import com.xiaoshu.admin.entity.WReply;
import com.xiaoshu.admin.service.UploadService;
import com.xiaoshu.admin.service.WArticleService;
import com.xiaoshu.admin.service.WReplyService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.Msg;
import com.xiaoshu.common.util.ResponseEntity;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author shen-ke
 * @since 2018-10-19
 */
@Controller
@RequestMapping("admin/system/article")
public class WArticleController {

	@Autowired
	WArticleService wArticleService;

	@Autowired
	UploadService uploadService;

	@Autowired
	WReplyService wReplyService;

	/**
	 * 跳转到日志页面
	 * 
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("article")
	public String line() {
		return "admin/article/article";
	}

	@RequiresPermissions("sys:article:list")
	@PostMapping("list")
	@ResponseBody
	public PageData<WArticle> list(
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "10") Integer limit,
			ServletRequest request) {
		Map map = WebUtils.getParametersStartingWith(request, "s_");
		String ss = (String) map.get("key");
		if ("发布".equals(ss)) {
			map.put("key", "1");
		}
		if ("草稿".equals(ss)) {
			map.put("key", "2");
		}

		PageData<WArticle> wArticlePageData = new PageData<>();
		QueryWrapper<WArticle> wArticleWrapper = new QueryWrapper<>();
		if (!map.isEmpty()) {
			String keys = (String) map.get("key");
			if (StringUtils.isNotBlank(keys)) {
				wArticleWrapper.and(wrapper -> wrapper.like("title", keys).or()
						.like("writer", keys));
			}
		}
		IPage<WArticle> wArticlePage = wArticleService
				.page(new Page<>(page, limit), wArticleWrapper);
		wArticlePageData.setCount(wArticlePage.getTotal());
		wArticlePageData.setData(wArticlePage.getRecords());
		return wArticlePageData;
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<WArticle> wArticleList = wArticleService.selectAll();
		modelMap.put("wArticleList", wArticleList);
		return "admin/article/add";
	}

	@RequiresPermissions("sys:article:add")
	@PostMapping("add")
	@ResponseBody
	@SysLog("新增新闻文章")
	public ResponseEntity add(@RequestBody WArticle wArticle) {
		if (StringUtils.isBlank(wArticle.getTitle())) {
			return ResponseEntity.failure("标题不能为空");
		}
		if (StringUtils.isBlank(wArticle.getWriter())) {
			return ResponseEntity.failure("类型不能为空");
		}
		if (StringUtils.isBlank(wArticle.getContent())) {
			return ResponseEntity.failure("内容不能为空");
		}
		// System.out.println("状态是+" + wArticle.getStatus());

		DateTimeFormatter df = DateTimeFormatter
				.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime time = LocalDateTime.now();
		String localTime = df.format(time);
		LocalDateTime ldt = LocalDateTime.parse(localTime, df);
		wArticle.setTime(ldt);

		wArticleService.saveProduct(wArticle);;
		return ResponseEntity.success("操作成功");
	}

	@SysLog("上传新闻图片")
	@PostMapping("tupian")
	@ResponseBody
	public ResponseEntity tupian(@RequestParam("icon") MultipartFile file,
			HttpServletRequest request) {
		// System.out.println("上传图片");

		// 获取支持文件上传的Request对象 MultipartHttpServletRequest
		MultipartHttpServletRequest mtpreq = (MultipartHttpServletRequest) request;
		// 通过 mtpreq 获取文件域中的文件
		MultipartFile file1 = mtpreq.getFile("icon");
		// 通过MultipartFile 对象获取文件的原文件名 
		String fileName = file1.getOriginalFilename();
		// 生成一个uuid 的文件名
		UUID randomUUID = UUID.randomUUID();
		// 获取文件的后缀名
		int i = fileName.lastIndexOf(".");
		String uuidName = randomUUID.toString() + fileName.substring(i);
		// 获取服务器的路径地址（被上传文件的保存地址）

		StringBuffer sb = new StringBuffer();
		String realPath = sb.append("D:/huahui/tiezi").toString();

		// String realPath =
		// request.getSession().getServletContext().getRealPath("file");
		// 将路径转化为文件夹 并 判断文件夹是否存在
		File dir = new File(realPath);
		if (!dir.exists()) {
			dir.mkdir();
		}
		// 获取一个文件的保存路径
		String path = realPath + "/" + uuidName;
		// 为文件这服务器中开辟一给新的空间,*没有数据
		File newFile = new File(path);
		try {
			file1.transferTo(new File(path));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		/*
		 * System.err.println("-----服务器的路径地址为：:" + realPath);
		 * System.err.println("-----图片名称为：:" + fileName);
		 * System.err.println("-----图片新名称为：:" + uuidName);
		 * System.err.println("-----图片新路径为：:" + path);
		 */

		Map map = new HashMap();
		try {
			map.put("url", path);
			map.put("name", uuidName);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.failure(e.getMessage());
		}
		return ResponseEntity.success("操作成功").setAny("data", map);
	}

	@RequiresPermissions("sys:article:delete")
	@PostMapping("deleteSome")
	@ResponseBody
	@SysLog("删除新闻文章(多个)")
	public ResponseEntity deleteSome(@RequestBody List<WArticle> wArticle) {
		if (wArticle == null || wArticle.size() == 0) {
			return ResponseEntity.failure("请选择需要删除的产品");
		}
		for (WArticle p : wArticle) {
			wArticleService.removeById(p);
		}
		return ResponseEntity.success("操作成功");
	}

	@RequiresPermissions("sys:article:delete")
	@PostMapping("delete")
	@ResponseBody
	@SysLog("删除新闻文章(单个)")
	public ResponseEntity delete(
			@RequestParam(value = "id", required = false) String id) {
		if (StringUtils.isBlank(id)) {
			return ResponseEntity.failure("参数错误");
		}
		wArticleService.removeById(id);
		return ResponseEntity.success("操作成功");
	}

	/* 编辑文章 */
	@GetMapping("edit")
	public String edit(String id, ModelMap modelMap,
			HttpServletResponse response) throws Exception {
		WArticle wArticle = wArticleService.selectProductById(id);
		modelMap.put("localuser", wArticle);
		return "admin/article/edit";
	}

	/* 回显图片 */
	@GetMapping("/getPicture")
	public void getCaptcha(String id, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		WArticle wArticle = wArticleService.selectProductById(id);
		File filePic = new File(wArticle.getUrl());
		if (filePic.exists()) {
			FileInputStream is = new FileInputStream(filePic);
			int i = is.available(); // 得到文件大小
			byte data[] = new byte[i];
			is.read(data); // 读数据
			is.close();
			response.setContentType("image/*"); // 设置返回的文件类型
			response.reset();//
			OutputStream os = response.getOutputStream();
			// 得到向客户端输出二进制数据的对象
			os.write(data); // 输出数据
			os.close();
		}
	}

	@RequiresPermissions("sys:article:edit")
	@PostMapping("edit")
	@ResponseBody
	@SysLog("编辑新闻文章数据")
	public ResponseEntity edit(@RequestBody WArticle wArticle) {

		DateTimeFormatter df = DateTimeFormatter
				.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime time = LocalDateTime.now();
		String localTime = df.format(time);
		LocalDateTime ldt = LocalDateTime.parse(localTime, df);
		wArticle.setTime(ldt);
		wArticleService.updateById(wArticle);
		return ResponseEntity.success("操作成功");
	}

	/* 编辑文章 */
	@GetMapping("huifu")
	public String huifu(String id, ModelMap modelMap,
			HttpServletResponse response) throws Exception {
		WArticle wArticle = wArticleService.selectProductById(id);
		modelMap.put("localuser", wArticle);
		return "admin/article/huifu";
	}

	@RequiresPermissions("sys:article:huifu")
	@PostMapping("huifu")
	@ResponseBody
	@SysLog("编辑新闻文章数据")
	public ResponseEntity huifu(@RequestBody WReply wReply,
			HttpServletRequest request) {

		if (StringUtils.isBlank(wReply.getWenid())) {
			return ResponseEntity.failure("文章ID不能为空");
		}
		if (StringUtils.isBlank(wReply.getHuifu())) {
			return ResponseEntity.failure("回复内容不能为空");
		}

		DateTimeFormatter df = DateTimeFormatter
				.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime time = LocalDateTime.now();
		String localTime = df.format(time);
		LocalDateTime ldt = LocalDateTime.parse(localTime, df);
		wReply.setShijian(ldt);
		wReplyService.saveProduct(wReply);
		return ResponseEntity.success("操作成功");

	}

	@RequiresPermissions("sys:article:chakan")
	@PostMapping("chakan")
	@ResponseBody
	public Msg chakan(String id) {
		WReply wReply = wReplyService.chaxun(id);
		String name = wReply.getUserid();
		String huifu = wReply.getHuifu();
		System.err.println("查询===" + huifu);
		return Msg.success().add("address", name + "：" + huifu);
	}

}
