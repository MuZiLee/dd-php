layui.define(["jquery", "element", "layer", "laydate", "layedit", "view", "table", "form", "admin", "upload"], function(exports) {
    console.log("abonus");

    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;

    table.render({
        elem: "#abonus-list"
        , url: "/api/abonus/get"
        , toolbar: "#abonus-list-toolbar"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", width: 70, align: "center", fixed: "left", title:"序号", sort: true}
            , {width: 180, align: 'center', title: '状态', sort: true, templet: function (d) {

                    if (d.status != null) {
                        if (d.status == 0) {
                            return '<span class="layui-badge layui-bg-orange">待审核</span>'

                        } else if (d.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已通过</span>'
                        } else {
                            return '<span class="layui-badge layui-bg-black">已驳回</span>'
                        }
                    } else {

                    }
            }}
            , {width: 180, align: 'center', title: '合伙公司名称', sort: true, templet: function (d) {
                return d.strategic.name;
            }}
            , {width: 180, align: 'center', title: '蛋蛋分红', sort: true, templet: function (d) {
                return d.dandanBill;
            }}
            , {width: 180, align: 'center', title: '战略分红', sort: true, templet: function (d) {
                return d.strategicBill;
            }}
            , {width: 200, align: 'center', title: '高级合伙人分红', sort: true, templet: function (d) {
                return d.advancedBill;
            }}
            , {width: 200, align: 'center', title: '初级合伙人分红', sort: true, templet: function (d) {
                return d.primaryBill;
            }}
            , {width: 160, align: 'center', title: '驻场老师提成', sort: true, templet: function (d) {
                return d.teacherBill;
            }}
            , {width: 150, align: 'center', title: '业务员提成', sort: true, templet: function (d) {
                return d.strategicBill;
            }}
            , {width: 150, align: 'center', title: '合作方式', sort: true, templet: function (d) {
                return d.factory.cooperation_mode;
            }}
            , {width: 150, align: 'center', title: '备注', sort: true, templet: function (d) {
                return d.remark;
            }}
            // , {width: 150, align: 'center', title: '合伙公司手续费', sort: true, templet: function (d) {
            //     return "";
            // }}
            // , {width: 200, align: 'center', title: '高级合伙人手续费', sort: true, templet: function (d) {
            //     return "";
            // }}
            // , {width: 200, align: 'center', title: '初级合伙人手续费', sort: true, templet: function (d) {
            //     return "";
            // }}
            // , {width: 150, align: 'center', title: '是否代收分红', sort: true, templet: function (d) {
            //     return "";
            // }}
            // , {width: 150, align: 'center', title: '结算', sort: true, templet: function (d) {
            //     return "";
            // }}
            // , {width: 150, align: 'center', title: '是否继承', sort: true, templet: function (d) {
            //     return "";
            // }}
        ]]
        , height: "full-150"
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "分红 0 个"
        },

    });
//

    table.on("toolbar(abonus-list)", function (obj) {
        if (obj.event == "entry-audit") {
            var checkStatus = table.checkStatus(obj.config.id);

            if (checkStatus.data.length < 1) {
                layer.msg("未选择事件");
                return;
            }
            var data = checkStatus.data[0];

            console.log(data);

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
                    event.id = data.id;
                    event.rid = user.owned.pop(); //用户最后一个角色
                    event.remark = value;
                    event.status = 1;

                    console.log(event);

                    admin.req({
                        url: "/api/abonus/setAbonus"
                        , type: "post"
                        , headers: {
                            token: layui.data("layuiAdmin").token
                        }
                        , data: event
                        , success: function(res) {
                            if (res.code == 0) {
                                table.reload("abonus-list");
                            }
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
                    console.log("备注:"+value);
                    console.log(user.owned.pop());


                    var event = {};
                    event.eid = data.id;
                    event.rid = user.owned.pop(); //用户最后一个角色
                    event.remark = value;
                    event.status = 2;
                    console.log(event);

                    admin.req({
                        url: "/api/abonus/setAbonus"
                        , type: "post"
                        , headers: {
                            token: layui.data("layuiAdmin").token
                        }
                        , data: event
                        , success: function (res) {
                            if (res.code == 0) {
                                table.reload("abonus-list");
                            }
                            layer.closeAll();

                        }
                    });



                });
            });



        }
    });



    exports("abonus", {});
});