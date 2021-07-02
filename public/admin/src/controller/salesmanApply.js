
layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("salesmanApply");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;




    table.render({
        elem: "#LAY-salesmanApply-list"
        , url: "/api/events/getSalesmanApplylist"
        , method: "post"
        , toolbar: "#Lay-salesmanApply-list-toolbar"
        , cols: [[
            {type: "numbers", width: 80, align: "center", title: '序号', fixed: "left"}
            , {width: 80, align: 'center', title: '状态', fixed: "left", templet: function (d) {
                console.log(d);

                var data = d.logs.pop();
                if (data != null) {
                    if (data.status == 1) {
                        return '<span class="layui-badge layui-bg-blue">已通过</span>'
                    } else  {
                        return '<span class="layui-badge layui-bg-black">已驳回</span>'
                    }
                } else {
                    return '<span class="layui-badge layui-bg-orange">待审核</span>'
                }

            }}
            , {width: 100, align: 'center', title: '事件ID', templet: "#idTpl"}
            , {width: 100, align: 'center', title: '用户ID', templet: "#uidTpl"}
            , {width: 100, align: 'center', title: '事件类型ID', templet: "#etidTpl"}
            , {width: 100, align: 'center', title: '头像', templet: "#imgTpl"}
            , {width: 100, align: 'center', title: '申请人', templet: "#usernameTpl"}
            , {width: 120, align: 'center', title: '申请电话', templet: "#phoneTpl"}
            , {width: 120, align: 'center', title: '申请类型', templet: "#roleTpl"}
            , {width: 450, title: "当前角色", align: "center", sort: true, templet: function (d) {
                    var roles = "";
                    $.each(d.user.roles, function(key, value) {
                        roles = roles + " " + "<span class=\"layui-badge\">" + value.title + "</span>";
                    });
                    return roles;
                }
            }
            , {width: 150, align: 'center', title: '申请时间', templet: "#create_timeTpl"}
            , {title: "操作", width: 160, align: "center", fixed: "right", toolbar: "#LAY-salesmanApply-list-tool-tages"}
        ]]
        , defaultToolbar: []
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: ' 0 个初级合伙人申请',
        }
    });

    table.on("tool(LAY-salesmanApply-list)", function(obj) {

        console.log(JSON.stringify(obj.data));
        if(obj.event === "apply") {
            layer.prompt({
                formType: 1
                , title: "敏感操作，请验证口令"
            }, function(value, index) {
                layer.close(index);
                if(hex_md5(value) != layui.data("layuiAdmin").password) {
                    layer.msg("口令不正确");
                } else {
                    layer.confirm("你需要如何处理？", {
                        btn: ["同意", "驳回", "退出"] //按钮
                    }, function() {
                        layer.prompt({
                            formType: 2
                            , title: "同意：备注"
                        }, function(value, index) {
                            if(!value) {
                                return false;
                            }


                            var user = layui.data("layuiAdmin").userInfo;
                            // console.log(JSON.stringify(user.owned.pop()));
                            // console.log(event);
                            var event = {};
                            event.eid = obj.data.id;
                            event.rid = user.owned.pop(); //用户最后一个角色
                            event.remark = value;
                            event.status = 1;


                            admin.req({
                                url: "/api/events/eventAudit"
                                , type: "post"
                                , headers: {
                                    token: layui.data("layuiAdmin").token
                                }
                                , data: event
                                , success: function(res) {
                                    table.reload("LAY-salesmanApply-list");
                                    layer.closeAll();
                                    layer.msg(res.msg);
                                }
                            });

                        });
                    }, function() {
                        layer.prompt({
                            formType: 2
                            , title: "驳回：备注"
                        }, function(value, index) {
                            if(!value) {
                                return false;
                            }
                            var user = layui.data("layuiAdmin").userInfo;
                            // console.log(JSON.stringify(user.owned.pop()));
                            // console.log(event);
                            var event = {};
                            event.eid = obj.data.id;
                            event.rid = user.owned.pop(); //用户最后一个角色
                            event.remark = value;
                            event.status = 2;
                            console.log(obj);
                            admin.req({
                                url: "/api/events/eventAudit"
                                , type: "post"
                                , headers: {
                                    token: layui.data("layuiAdmin").token
                                }
                                , data: event
                                , success: function(res) {
                                    table.reload("LAY-salesmanApply-list");
                                    layer.closeAll();

                                }
                            });

                        });
                    });

                }

            });
        } else if (obj.event === "del") {
            layer.prompt({
                formType: 1
                , title: "删除操作，请验证口令"
            }, function(value, index) {
                layer.close(index);
                if(hex_md5(value) != layui.data("layuiAdmin").password) {
                    layer.msg("口令不正确");
                } else {
                    layer.confirm("此操作会一起删除历史审核记录,数据无法恢复,确认删除？删除不影响用户数据", function(index) {

                        admin.req({
                            url: "/api/events/dele",
                            data: obj.data,
                            type: "post",
                            success: function(res) {
                                console.log(res);
                                if(res.code == 0) {
                                    obj.del();
                                }
                                layer.msg(res.msg);
                                layer.close(index);
                            }
                        });


                    });
                }

            });
        }
    });




    exports("salesmanApply", {});
});