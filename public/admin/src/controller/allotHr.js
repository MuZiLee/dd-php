

layui.define(['table', 'admin', 'view', 'table', 'form', 'jquery'], function (exports) {
    var $ = layui.jquery;
    var table = layui.table;
    var admin = layui.admin;
    var form = layui.form;
    var view = layui.view;
    var data = layui.setter.getData().data;
    var type = layui.setter.getData().type;

    console.log("allotHr");

    console.log("分配工厂HR");
    console.log(data);


    $(function() {
        if(!data.id) return;


        console.log(data);
        console.log(data.fid);

        table.render({
            elem: '#LAY-factory-allot-list'
            ,id: 'LAY-factory-allot-list'
            ,url: '/api/factory/getFactoryHRList'
            ,method: "post"
            ,cellMinWidth: 80
            ,where: {"id":data.id}
            ,cols: [[
                {type: 'numbers', title:'序号', align: 'center'}
                , {align: 'center', width: 100, title: 'ID', templet: "#idTpl"}
                , {align: 'center', title: '名字', templet: "#usernameTpl"}
                , {field: 'score', align: 'center', title: '创建时间', templet: "#create_timeTpl"}
                ,{title: '操作', align: 'center', fixed: 'right', toolbar: "#LAY-factory-allot-toolbar-tages"}
            ]]
            , page: true
            , limit: 15
            , limits: [10, 15, 20, 30, 40, 50, 100]
            , text: {
                none: '当前工厂 0 HR'
            }
        });
        form.render('select');



        // 获取可分配的驻场
        // dta.id = fid

        getTeacher(data.id);

        // 添加驻场老师
        form.on('submit(allotTeacherAdd)', function (obj) {

            if (!uid) {
                layer.msg("未选用户");
                return;
            }
            console.log(obj);
            console.log(data);

            var valud = {
                "fid": data.fid,
                "uid": uid
            };
            console.log(valud);

            admin.req({
                url: '/api/factory/allotFactoryHR'
                ,type: 'post'
                ,data: valud
                ,success: function(res) {
                    // 重新渲染table
                    if (res.code == 0) {
                        // getTeacher(data.id);
                        layui.table.reload('LAY-factory-allot-list');
                        layui.table.reload('LAY-factoryAudit-list');
                        layer.closeAll();
                    }

                }
            });

        });

        // 删除驻场老师
        table.on('tool(LAY-factory-allot-list)', function(obj) {

            if (obj.event == 'factory-allot-del') {

                console.log(obj.data);

                admin.req({
                    url: '/api/factory/delFactoryHR'
                    ,type: 'post'
                    ,data: {
                        fid: obj.data.fid,
                        uid: obj.data.uid
                    }
                    ,success: function(res) {
                        // 重新渲染table

                        if (res.code == 0) {
                            getTeacher(obj.data.fid);
                            layui.table.reload('LAY-factory-allot-list');
                            layui.table.reload('LAY-factoryAudit-list');
                        }
                    }
                });
            }
        });

    });

    //监听选中用户
    var uid = "";
    form.on('select(uid)', function (data) {
        console.log(data.value); //得到被选中的值
        console.log(data.othis); //得到被选中的值
        uid = data.value;
    });

    // 得到用户列表
    function getTeacher(fid) {
        admin.req({
            url: "/api/factory/getAvailableFactoryHR"
            ,type: 'post'
            ,data: {"fid":fid}
            ,success: function(res) {
                var users = res.data;
                var select_obj = $("#uid");
                console.log("得到用户列表");

                layui.each(users, function (index, item) {

                    console.log(item);
                    var option = document.createElement("option");
                    option.value = item.id;
                    option.innerHTML = item.username?item.username:item.phone;
                    option.name = "uid";
                    if (index == 0) {
                        option.selected = true;
                        uid = item.id;
                    }
                    select_obj.append(option);
                });
                form.render("select");
            }
        });
    }


    exports('allotHr', {});
});