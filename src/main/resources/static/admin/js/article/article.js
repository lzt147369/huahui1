layui.use(['layer','form','table','upload'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        upload = layui.upload,
        layer = layui.layer,
        t;                  //表格数据变量
        
    t = {
        elem: '#userTable',
        url:'/admin/system/article/list',
        method:'post',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits:[3,10, 20, 30]
        },
        width: $(parent.window).width()-223,
        cols: [[
            {type:'checkbox'},
            {field:'img',  title: '花卉图片',unresize: true, sort: false,
            	templet:function (d) {
            		return '<div class="layer-photos-demo"  style="cursor:pointer;">'
            		+'<img layer-pid="图片id，可以不写" src="'+d.name+'" alt="'+d.name+'">'
            		+'</div>';
            	}
            },
            {field:'title', title: '花卉标题', width:'8%'},
            {field:'writer', title: '花卉类型',    width:'8%'},
            {field:'content', title: '花卉内容',    width:'12%' },
            {field:'status',    title: '发布状态',width:'5%',templet:'#userStatus'},
            {field:'time',  title: '创建时间',width:'10%', templet:'<span>{{ layui.laytpl.toDateString(d.time) }}</span>'}, //单元格内容水平居中
            {field:'url', title: '图片地址',    width:'10%' },
            {field:'personalId',     title: '回复内容', width:'18%',toolbar: '#chakan'},
            {fixed: 'right', align: 'center', toolbar: '#userBar'}
        ]],
        done:function(res,curr,count){
        	
        	layer.photos({
        		photos:'.layer-photos-demo',
        		anim:1
        		
        	})
        	
        }
    };
    table.render(t);

    

    //监听工具条
    table.on('tool(userList)', function(obj){
        var data = obj.data;
        if(obj.event === 'lock'){
            var locked = data.locked;
            layer.confirm("你确定要" + (locked ? "重新启用" : "锁定") + "该信息么？" ,{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/system/user/lock",{"id":data.id},function (res){
                        if(res.success){
                            layer.msg("操作成功",{time: 1000},function(){
                                table.reload('userTable', t);
                            });
                        }else{
                            layer.msg(res.message);
                        }
                    });
                }
            );
        }
        
        
        if(obj.event === "chakan"){
       	 $.ajax({
                type:"POST",
                url:"/admin/system/article/chakan",
                data : {
               	id : data.id
				},
				async : false,
				datatype : "json",
				
                success:function(res){
               	address1 = res.extend.address;
					//$(this).text(address1)
					console.log(address1)
               	 layer.msg(address1, {
               	        time: 10000, //20s后自动关闭
               	        btn: ['关闭']
               	      });
                }
            });
       }


        if(obj.event === 'edit'){
            var editIndex = layer.open({
                title : "编辑花卉",
                type : 2,
                content : "/admin/system/article/edit?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回花卉列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layer.full(editIndex);
            });
            layer.full(editIndex);
        }

        if(obj.event === "del"){
            layer.confirm("你确定要删除该信息么？",{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/system/article/delete",{"id":data.id},function (res){
                        if(res.success){
                            layer.msg("删除成功",{time: 1000},function(){
                                table.reload('userTable', t);
                            });
                        }else{
                            layer.msg(res.message);
                        }

                    });
                }
            );
        }
        
        if(obj.event === 'huifu'){
            var editIndex = layer.open({
                title : "编辑花卉",
                type : 2,
                content : "/admin/system/article/huifu?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回花卉列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layer.full(editIndex);
            });
            layer.full(editIndex);
        }
        
        if(obj.event === 'ruku'){
            var editIndex = layer.open({
                title : "编辑信息",
                type : 2,
                content : "/admin/system/message/ruku?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layer.full(editIndex);
            });
            layer.full(editIndex);
        }
    });

    //功能按钮
    var active={
        addUser : function(){
            var addIndex = layer.open({
                title : "添加花卉",
                type : 2,
                content : "/admin/system/article/add",
                success : function(layero, addIndex){
                    setTimeout(function(){
                        layer.tips('点击此处返回花卉列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                }
            });
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function(){
                layer.full(addIndex);
            });
            layer.full(addIndex);
        },
        derive : function(){
        	window.location.href="/excel/ExcelDownloadss";
        	
        	/*alert()
        	 $.ajax({
        		  type:　"GET", 
                  url:　"/excel/ExcelDownloads",
                  success:　function(data){ 
                  }
        	 });*/
        },      
        deleteSome : function(){                        //批量删除
            var checkStatus = table.checkStatus('userTable'),
                data = checkStatus.data;
            if(data.length > 0){
                for(var i=0;i<data.length;i++){
                    var d = data[i];
                    if(d.adminUser){
                        layer.msg("不能删除超级管理员");
                        return false;
                    }
                }
                layer.confirm("你确定要删除这些信息么？",{btn:['是的,我确定','我再想想']},
                    function(){
                        var deleteindex = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
                        $.ajax({
                            type:"POST",
                            url:"/admin/system/article/deleteSome",
                            dataType:"json",
                            contentType:"application/json",
                            data:JSON.stringify(data),
                            success:function(res){
                                layer.close(deleteindex);
                                if(res.success){
                                    layer.msg("删除成功",{time: 1000},function(){
                                        table.reload('userTable', t);
                                    });
                                }else{
                                    layer.msg(res.message);
                                }
                            }
                        });
                    }
                )
            }else{
                layer.msg("请选择需要删除的信息",{time:1000});
            }
        }
    };
    

    $('.layui-inline .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //搜索
    form.on("submit(searchForm)",function(data){
        t.where = data.field;
        
        table.reload('userTable', t);
        return false;
    });
    
    /*var uploadInst = upload.render({
	    elem: '#test8'
	    ,url: '/excel/daoru',
	    accept: 'file' //普通文件
	    ,done: function(res){
	      //如果上传失败
	      if(res.success){
	        layer.msg("上传成功",{time: 1000},function(){
                table.reload('userTable', t);
            });
	      }
	      //上传成功
	    }
	    
	  });*/
    
    upload.render({
        elem: '#test8'
        ,url: '/excel/daorus'
        	,accept: 'file' //普通文件
        ,done: function(res){
        	 if(res.success){
     	        layer.msg("上传成功",{time: 1000},function(){
                     table.reload('userTable', t);
                 });
        	 }
        }
      });



   

});