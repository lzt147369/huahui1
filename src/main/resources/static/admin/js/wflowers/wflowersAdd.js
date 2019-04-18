layui.use([ 'form', 'jquery', 'layer','layedit' ], function() {
	var form = layui.form,
		$ = layui.jquery,
		layer = layui.layer; //默认启用用户
 var layedit = layui.layedit;
 var index = layedit.build('demo'); //建立编辑器

    layui.use('upload', function () {
        var $ = layui.jquery,
            upload = layui.upload;

        var uploadInst = upload.render({
            elem: '#test2',
            url: '/admin/system/wflowers/tupian',
            field: 'icon',
            before: function (obj) {
                obj.preview(function (index, file, result) {

                    $('#demo1').attr('src', result);
                });
            },
            done: function (res) {
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                layer.msg(res.msg, {
                    icon: 6,
                    time: 1000
                });
            },
            done: function (fileName) {
                var jsonData = JSON.stringify(fileName);
                $('[Name=url]').val(fileName.data['url']);
                $('[Name=tupianname]').val(fileName.data['name']);
            },
            error: function () {
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });

    form.on("submit(addUser)", function(data) {
        var loadIndex = layer.load(2, {
            shade : [ 0.3, '#333' ]
        });


        if (data.field.status == "true") {
            data.field.status = "1";
        } else {
            data.field.status = "2";
        }

        data.field.content=layedit.getContent(index);
        $.ajax({
            type : "POST",
            url : "/admin/system/wflowers/add",
            dataType : "json",
            contentType : "application/json",
            data : JSON.stringify(data.field),
            success : function(res) {
                layer.close(loadIndex);
                if (res.success) {
                    parent.layer.msg("信息添加成功!", {
                        time : 1500
                    }, function() {
                        //刷新父页面
                        parent.location.reload();
                    });
                } else {
                    layer.msg(res.message);
                }
            }
        });
        return false;
    });








        form.on('switch(adminUser)', function (data) {
            $("#adminUser").val(data.elem.checked);
        });

        form.on('switch(locked)', function (data) {
            $("#locked").val(data.elem.checked);
        });


});