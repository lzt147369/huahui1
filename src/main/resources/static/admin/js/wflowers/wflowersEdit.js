var index = parent.layer.getFrameIndex(window.name); //当前窗口索引
layui.use(['form','jquery','layer','layedit'],function(){
    var form = layui.form,
        $    = layui.jquery,
        layer = layui.layer;
    
    var layedit = layui.layedit;
    var index = layedit.build('demo'); //建立编辑器

    form.on("submit(editUser)",function(data){
        if(data.field.id == null){
            layer.msg("信息ID不存在");
            return false;
        }
        //给角色赋值
        delete data.field["roles"];
        var selectRole = [];
        $('input[name="roles"]:checked').each(function(){
            selectRole.push({"id":$(this).val()});
        });
        data.field.roleLists = selectRole;

        //判断用户是否后台用户
        if(undefined !== data.field.adminUser && null != data.field.adminUser){
            data.field.adminUser = true;
        }else{
            data.field.adminUser = false;
        }

        //判断用户是否启用
        if(undefined !== data.field.locked && null != data.field.locked){
            data.field.locked = false;
        }else{
            data.field.locked = true;
        }

        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        
        if (data.field.status == "true") {
			data.field.status = "1";
		}else if(data.field.status == "1") {
			data.field.status = "1";
		}else{
			data.field.status = "2";
			
		}
        data.field.content=layedit.getContent(index);
        $.ajax({
            type:"POST",
            url:"/admin/system/wflowers/edit",
            dataType:"json",
            contentType:"application/json",
            data:JSON.stringify(data.field),
            success:function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("信息编辑成功！",{time:1500},function(){
                        parent.location.reload();
                    });
                }else{
                    layer.msg(res.message);
                }
            }
        });
        return false;
    });
    
    
    
    
    layui.use('upload', function() {
		var $ = layui.jquery,
			upload = layui.upload;

		var uploadInst = upload.render({
			elem : '#test1',
			url : '/admin/system/wflowers/tupian',
			field : 'icon',
			before : function(obj) {
				obj.preview(function(index, file, result) {
					
					$('#demo1').attr('src', result);
				});
			},
			done : function(res) {
				if (res.code > 0) {
					return layer.msg('上传失败');
				}
				layer.msg(res.msg, {
					icon : 6,
					time : 1000
				});
			},
			done : function(fileName) {
				var jsonData = JSON.stringify(fileName);
				$('[Name=url]').val(fileName.data['url']);
				$('[Name=name]').val(fileName.data['name']);
			},
			error : function() {
				var demoText = $('#demoText');
				demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function() {
					uploadInst.upload();
				});
			}
		});
	});
	var b_Type = $('[name="B_Type"]').val();


    form.on('switch(adminUser)', function(data){
        $("#adminUser").val(data.elem.checked);
    });

    form.on('switch(locked)', function(data){
        $("#locked").val(data.elem.checked);
    });

});