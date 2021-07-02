layui.define(["jquery", "element", "layer", "laydate", "layedit", "view", "table", "form", "admin", "upload"], function(exports) {
    console.log("addNewRole");

    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;

    form.render(null, 'layuiadmin-form-role');
    form.render("checkbox");



    var users;
    /// 渲染未分配的用户
    admin.req({
        url: "/api/account/getWhitelist" // 获取白名单列表
        , success: function(res) {
            console.log(res.data);
            if (res.code == 0) {
                users = res.data;
                var select_obj = $("#uid");
                layui.each(res.data, function (index, obj) {
                    if (index == 0) {
                        updateCheckbox(obj.id);
                    }
                    //用户
                    var option = document.createElement("option");
                    option.value = obj.id;
                    option.innerHTML = obj.username ? obj.username : obj.phone;
                    option.name = "uid";
                    select_obj.append(option);
                });
                form.render("select");
            }
        }
    });

    // 查询用户角色列表
    form.on('select(uid)', function(data){
        var uid = data.value;
        updateCheckbox(uid);
    });

    function updateCheckbox(uid) {
        admin.req({
            url: '/api/account/getRoles'
            , type: "post"
            , headers: {
                token: layui.data('layuiAdmin').token
            }
            , data: {
                uid: uid
            }
            , success: function (res) {
                console.log(res.data);
                if (res.code == 0) {
                    $('input[type=checkbox]').each(function(inx, checkbox) {
                        if (checkbox.value != "on") {
                            checkbox.checked = false;
                        }
                    });

                    $('input[type=checkbox]').each(function(inx, checkbox) {
                        layui.each(res.data, function (index, item) {
                            if (checkbox.value == item.rid) {
                                console.log(checkbox.value + '->' + item.rid);
                                checkbox.checked = true;
                            }
                        });
                    });
                    form.render("checkbox");
                }
            }
        });
    }


    // 选项点击事件
    form.on('checkbox(ridaction)', function(data){
        console.log(data.elem.checked); //是否被选中，true或者false
        console.log(data.value); //复选框value值，也可以通过data.elem.value得到

        var uid = $("#uid").val();
        admin.req({
            url: '/api/account/setAdminroles'
            , type: "post"
            , headers: {
                token: layui.data('layuiAdmin').token
            }
            , data: {
                uid: uid,
                rid: data.value,
                checked: data.elem.checked == true ? 1 : 0
            }
            , success: function (res) {


            }
        });

    });

    // 退出
    form.on('submit(LAY-user-role-submit)', function(data){
        var uid = $("#uid").val();
        var rids = $('#rids').val();

        layui.table.reload("LAY-user-back-role");
        layer.closeAll();
    });




    exports("addNewRole", {});
});