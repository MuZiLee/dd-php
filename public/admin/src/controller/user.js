/**

 @Name：layuiAdmin 用户管理 管理员管理 角色管理
 */
layui.define(["table", "form"], function(exports) {
    var $ = layui.$
        , admin = layui.admin
        , view = layui.view
        , table = layui.table
        , form = layui.form;

    // ---------------------------------------- 用户管理
    table.render({
        elem: "#LAY-user-list"
        , url: "/api/account/getWhitelist"
        , height: "auto"
        , cols: [[
            {type: "checkbox", fixed: "left", sort: true}
            , {type: "numbers", align: "center", fixed: "left"}
            , {width: 90, align: "center", title: "ID", templet: "#idTpl"}
            , {width: 90, align: "center", title: "头像", templet: "#imgTpl"}
            , {width: 90, align: "center", title: "名字", templet: "#usernameTpl"}
            , {width: 135, align: "center", title: "联系方式", templet: "#phoneTpl"}
            , {width: 135, align: "center", title: "邀请码", templet: function (d) {
                return d.code ? d.code : "未绑定";
            }}
            , {width: 150, align: "center", title: "上级", sort: true, templet: function (d) {
                if (d.partner) {
                    return d.partner.user.name ? d.partner.user.name : d.partner.user.phone;
                } else {
                    return "未绑定";
                }
            }}
            , {width: 150, align: "center", title: "所属战略联盟", sort: true, templet: function (d) {
                console.log(d.partner);
                if (d.partner && d.partner.user && d.partner.user.strategic) {
                    return d.partner.user.strategic.name;
                } else {
                    return "未绑定";
                }
            }}
            , {width: 450, title: "角色", align: "center", sort: true, templet: function (d) {
                    var roles = "";
                    $.each(d.roles, function(key, value) {
                        roles = roles + " " + "<span class=\"layui-badge\">" + value.title + "</span>";
                    });
                    return roles;
                }
            }
            , {width: 180, align: "center", title: "注册时间", sort: true, templet: "#create_timeTpl"}
            , {fixed: "right", title: "操作", sort: true, toolbar: "#table-user-tages", width: 150}
        ]]
        , height: "full-150"
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "用户 0 个"
        }
    });

    //监听工具条
    table.on("tool(LAY-user-list)", function(obj) {
        var data = obj.data;
        if(obj.event === "black") {
            // confirm
            layer.confirm("确定拉黑此用户？", function(index) {

                admin.req({
                    url: "/api/account/makeBlacklist",
                    data: {"uid": data.id},
                    type: "post",
                    success: function(res) {
                        console.log(res);
                        layer.msg(res.msg);
                        obj.del();
                        layer.close(index);
                    }
                });
            });

        } else if(obj.event === "look") {
            // popup
            admin.popup({
                title: "用户信息"
                , area: ["90%", "90%"]
                , id: "查看用户信息"
                , success: function(layero, index) {
                    // console.log(data);

                    view(this.id).render("user/info").done(function () {

                        admin.req({
                            url: "/api/account/get",
                            data: {
                                "uid": data.id,
                            },
                            type: "post",
                            success: function(res) {
                                // console.log(res.data);

                                form.val("LAY-filter-user-info-form", {
                                    "isAdmin": res.data.isAdmin == 1 ? true : false,
                                    "avatar": "http://192.168.1.2/"+res.data.avatar,
                                    "username": res.data.username ? res.data.username : res.data.phone,
                                    "phone": res.data.phone,
                                    "age": res.data.age,
                                    "sex": res.data.sex == 1? "男" : "女",
                                    "birthday": res.data.birthday,
                                    "parent": res.data.partner ? (res.data.partner.user.username ? res.data.partner.user.username : res.data.partner.user.phone) : "未绑定",
                                    "code": res.data.code == null || res.data.code == 0 ? "未绑定" : res.data.code,
                                });

                                form.render();
                            }
                        });

                    });


                }
            });

        }
    });


    // ---------------------------------------- 黑名单
    //黑名单
    table.render({
        elem: "#LAY-black-list"
        , url: "/api/account/getBlacklist"
        , cols: [[
            {type: "checkbox", fixed: "left", sort: true}
            , {type: "numbers", align: "center", fixed: "left"}
            , {width: 90, align: "center", title: "ID", templet: "#idTpl"}
            , {width: 90, align: "center", title: "头像", templet: "#imgTpl"}
            , {width: 90, align: "center", title: "名字", templet: "#usernameTpl"}
            , {width: 135, align: "center", title: "邀请码", templet: "#codeTpl"}
            , {width: 135, align: "center", title: "联系方式", templet: "#phoneTpl"}
            , {width: 90, align: "center", title: "上级", sort: true, templet: "#partnerTpl"}
            , {width: 150, align: "center", title: "所属战略联盟", sort: true, templet: "#strategicTpl"}
            , {width: 450, title: "角色", align: "center", sort: true, templet: function (d) {
                    var roles = "";
                    $.each(d.roles, function(key, value) {
                        roles = roles + " " + "<span class=\"layui-badge\">" + value.title + "</span>";
                    });
                    return roles;
                }
            }
            , {width: 180, align: "center", title: "注册时间", sort: true, templet: "#create_timeTpl"}
            , {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#table-user-tages"}
        ]]
        , text: {
            none: "黑名单 0 个"
        }
        , height: "full-150"
        , page: true
        , limit: 11
        , limits: [10, 15, 20, 30, 40, 50, 100]

    });

    //监听工具条
    table.on("tool(LAY-black-list)", function(obj) {
        var data = obj.data;
        if(obj.event === "unblack") {

            layer.confirm("确定解禁此用户？", function(index) {

                admin.req({
                    url: "/api/account/makeWhitelist",
                    data: {"uid": data.id},
                    type: "post",
                    success: function(res) {
                        console.log(res);
                        layer.msg(res.msg);
                        obj.del();
                        layer.close(index);
                    }
                });
            });

        } else if(obj.event === "look") {

            admin.popup({
                title: "用户信息"
                , area: ["90%", "90%"]
                , id: "查看用户信息"
                , success: function(layero, index) {
                    // layer.msg(JSON.stringify(obj.data));
                    view(this.id).render("user/info", data);
                }
            }).then(function () {
                console.log("刷新");
                table.render();
            });
        }
    });


    // ---------------------------------------- 角色列表
    //角色管理
    table.render({
        elem: "#LAY-roles-list"
        , url: "/api/account/getRoleslist"
        , cols: [[
            {type: 'numbers', align: 'center', width: 60, title: "序号", fixed: 'left'}
            , {field: "title", align: 'center', title: "名称", minWidth: 100}
        ]]
        , height: "full-150"
        , text: {
            none: "角色管理 0 个"
        }
    });

    //监听工具条
    table.on("tool(LAY-roles-list)", function(obj) {
        var data = obj.data;
        if(obj.event === "del") {
            layer.confirm("确定删除此角色？", function(index) {
                obj.del();
                layer.close(index);
            });
        } else if(obj.event === "edit") {
            admin.popup({
                title: "添加新角色"
                , area: ["500px", "480px"]
                , id: "LAY-popup-user-add"
                , success: function(layero, index) {
                    view(this.id).render("user/administrators/roleform", data).done(function() {
                        form.render(null, "layuiadmin-form-role");

                        //监听提交
                        form.on("submit(LAY-user-role-submit)", function(data) {
                            var field = data.field; //获取提交的字段

                            //提交 Ajax 成功后，关闭当前弹层并重载表格
                            //$.ajax({});
                            layui.table.reload("LAY-user-back-role"); //重载表格
                            layer.close(index); //执行关闭
                        });
                    });
                }
            });
        }
    });

    exports("user", {})
});