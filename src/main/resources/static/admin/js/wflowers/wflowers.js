layui.use(['layer','form','table'], function() {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        t;                  //表格数据变量

    t = {
        elem: '#userTable',
        url:'/admin/system/wflowers/list',
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
                        +'<img layer-pid="图片id，可以不写" src="'+d.tupianname+'" alt="'+d.name+'">'
                        +'</div>';
                }
            },
            {field:'name', title: '花卉名称', width:'8%'},
            {field:'hue',  title: '花卉颜色',    width:'8%'},
            {field:'period',     title: '花卉成长周期',    width:'10%' },
            {field:'water',       title: '浇水间隔',    width:'10%'},
            {field:'sun',       title: '阳光辐射',    width:'10%'},
            {field:'trim',       title: '修剪周期',    width:'10%'},
            {field:'classify',       title: '品种类别',    width:'8%'},
            {field:'audit',    title: '审核',width:'8%',templet:'#audit'},
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
            layer.confirm("你确定要通过审核吗？" ,{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/system/wflowers/lock",{"id":data.id},function (res){
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


        if(obj.event === 'edit'){
            var editIndex = layer.open({
                title : "编辑用户",
                type : 2,
                content : "/admin/system/wflowers/edit?id="+data.id,
                success : function(layero, index){
                    setTimeout(function(){
                        layer.tips('点击此处返回会员列表', '.layui-layer-setwin .layui-layer-close', {
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
            layer.confirm("你确定要删除该信息吗？",{btn:['是的,我确定','我再想想']},
                function(){
                    $.post("/admin/system/wflowers/delete",{"id":data.id},function (res){
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
    });

    //功能按钮
    var active={
        addUser : function(){
            var addIndex = layer.open({
                title : "添加信息",
                type : 2,
                content : "/admin/system/wflowers/add",
                success : function(layero, addIndex){
                    setTimeout(function(){
                        layer.tips('点击此处返回信息列表', '.layui-layer-setwin .layui-layer-close', {
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
                            url:"/admin/system/wflowers/deleteSome",
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

});