package com.xiaoshu.admin.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.util.ResourceUtils;
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
import com.xiaoshu.admin.entity.WFlowers;
import com.xiaoshu.admin.service.WFlowersService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author shen-ke
 * @since 2019-04-12
 */
@Controller
@RequestMapping("admin/system/wflowers")
public class WFlowersController {

	@Autowired
	WFlowersService wFlowersService;

	/**
	 * 跳转到日志页面
	 * 
	 * @return
	 */
	@RequestMapping("wflowers")
	public String line() {
		return "admin/wflowers/wflowers";
	}

	@RequiresPermissions("sys:wflowers:list")
	@PostMapping("list")
	@ResponseBody
	public PageData<WFlowers> list(
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "10") Integer limit,
			ServletRequest request) {
		Map map = WebUtils.getParametersStartingWith(request, "s_");
		PageData<WFlowers> asacaichanPageData = new PageData<>();
		QueryWrapper<WFlowers> asacaichanWrapper = new QueryWrapper<>();
		if (!map.isEmpty()) {

			String keys = (String) map.get("key");
			if (StringUtils.isNotBlank(keys)) {
				asacaichanWrapper
						.and(wrapper -> wrapper.like("name", keys).or()
								.like("classify", keys));
			}
		}
		IPage<WFlowers> asacaichanPage = wFlowersService
				.page(new Page<>(page, limit), asacaichanWrapper);

		asacaichanPageData.setCount(asacaichanPage.getTotal());
		asacaichanPageData.setData(asacaichanPage.getRecords());
		return asacaichanPageData;
	}

	@RequiresPermissions("sys:wflowers:lock")
	@PostMapping("lock")
	@ResponseBody
	@SysLog("锁定或开启系统用户")
	public ResponseEntity lock(
			@RequestParam(value = "id", required = false) String id) {
		if (StringUtils.isBlank(id)) {
			return ResponseEntity.failure("参数错误");
		}
		WFlowers wFlowers = wFlowersService.getById(id);
		if (wFlowers == null) {
			return ResponseEntity.failure("用户不存在");
		}
		wFlowersService.lockUser(wFlowers);
		return ResponseEntity.success("操作成功");
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<WFlowers> wflowers = wFlowersService.selectAll();
		modelMap.put("wflowersList", wflowers);
		return "admin/wflowers/add";
	}

	@RequiresPermissions("sys:wflowers:add")
	@PostMapping("add")
	@ResponseBody
	@SysLog("新增新闻文章")
	public ResponseEntity add(@RequestBody WFlowers wFlowers) {
		if (StringUtils.isBlank(wFlowers.getName())) {
			return ResponseEntity.failure("花卉名称不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getHue())) {
			return ResponseEntity.failure("花卉颜色不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getPeriod())) {
			return ResponseEntity.failure("花卉成长周期不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getWater())) {
			return ResponseEntity.failure("浇水间隔不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getSun())) {
			return ResponseEntity.failure("阳光辐射不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getTrim())) {
			return ResponseEntity.failure("修剪周期不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getClassify())) {
			return ResponseEntity.failure("品种类别不能为空");
		}

		wFlowersService.saveProduct(wFlowers);;
		return ResponseEntity.success("操作成功");
	}

	@RequiresPermissions("sys:wflowers:delete")
	@PostMapping("deleteSome")
	@ResponseBody
	@SysLog("删除新闻文章(多个)")
	public ResponseEntity deleteSome(@RequestBody List<WFlowers> wFlowers) {
		if (wFlowers == null || wFlowers.size() == 0) {
			return ResponseEntity.failure("请选择需要删除的产品");
		}
		for (WFlowers p : wFlowers) {
			wFlowersService.removeById(p);
		}
		return ResponseEntity.success("操作成功");
	}

	@RequiresPermissions("sys:wflowers:delete")
	@PostMapping("delete")
	@ResponseBody
	@SysLog("删除新闻文章(单个)")
	public ResponseEntity delete(
			@RequestParam(value = "id", required = false) String id) {
		if (StringUtils.isBlank(id)) {
			return ResponseEntity.failure("参数错误");
		}
		wFlowersService.removeById(id);
		return ResponseEntity.success("操作成功");
	}

	/* 编辑文章 */
	@GetMapping("edit")
	public String edit(String id, ModelMap modelMap,
			HttpServletResponse response) throws Exception {
		WFlowers wFlowers = wFlowersService.selectProductById(id);
		modelMap.put("localuser", wFlowers);
		return "admin/wflowers/edit";
	}

	@RequiresPermissions("sys:wflowers:edit")
	@PostMapping("edit")
	@ResponseBody
	@SysLog("编辑新闻文章数据")
	public ResponseEntity edit(@RequestBody WFlowers wFlowers) {

		if (StringUtils.isBlank(wFlowers.getName())) {
			return ResponseEntity.failure("花卉名称不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getHue())) {
			return ResponseEntity.failure("花卉颜色不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getPeriod())) {
			return ResponseEntity.failure("花卉成长周期不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getWater())) {
			return ResponseEntity.failure("浇水间隔不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getSun())) {
			return ResponseEntity.failure("阳光辐射不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getTrim())) {
			return ResponseEntity.failure("修剪周期不能为空");
		}
		if (StringUtils.isBlank(wFlowers.getClassify())) {
			return ResponseEntity.failure("品种类别不能为空");
		}
		wFlowersService.updateById(wFlowers);
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
		String realPath = sb.append("D:/huahui/xinxi").toString();

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

			//上传到项目跟目下
			//获取跟目录
			File path1 = new File(ResourceUtils.getURL("classpath:").getPath());
			File upload = new File(path1.getAbsolutePath(),"static/shouye/images/");
			String path2 = upload.getAbsolutePath()+"\\"+uuidName;
			System.out.println("路径"+path2);
			file1.transferTo(new File(path2));

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}



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

}
