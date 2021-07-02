layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("payoff");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;

    /**
     * // popup
     admin.popup({
                title: 'title'
                , area: ['90%', '90%']
                , id: '唯一ID'
                , success: function (layero, index) {
                    console.log(data.id);
                    console.log(JSON.stringify(obj.data));
                    //var view = layui.view;
                    view(this.id).render('demo/test', data数据).done(function () {

                    });
                }
            });
     */



    table.render({
        elem: "#LAY-payoff-list"
        , url: "/api/paySlip/getPaySliplist"
        , method: "post"
        , toolbar: "#Lay-payoff-list-toolbar"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", title: "序号", align: "center", fixed: "left"}
            , {title: "状态", width: 100, align: "center", fixed: "left", templet: function (d) {
                //$factory->signingInformation
                if (d.slip.status) {
                    return '<span class="layui-badge layui-bg-blue">已审核</span>';
                } else  {
                    return '<span class="layui-badge layui-bg-gray">待审核</span>';
                }
            }}
            , {field: 'type', width: 150, align: 'center', title: '类型'}
            , {width: 130, align: 'center', title: '员工是否确认', templet: function (d) {
                if (d.type == "代理招聘工资条") {
                    return '<span class="layui-badge layui-bg-red" lay-tips="代理招聘工资条，员工不处理，财务直接审核分红">注意</span>';
                } else {
                    if (d.status == 0) {
                        return '<span class="layui-badge layui-bg-gray">未确认</span>';
                    } else  {
                        return '<span class="layui-badge layui-bg-gray">已确认</span>';
                    }
                }

            }}
            , {width: 100, align: 'center', title: '员工', templet: function (d) {
                return d.staff.username;
            }}
            , {width: 100, align: 'center', title: '驻场老师', templet: function (d) {
                return d.teacher.username;
            }}
            , {width: 100, align: 'center', title: '业务员', templet: function (d) {
                return d.salesman.username;
            }}
            , {width: 100, align: 'center', title: '初级合伙人', templet: function (d) {
                return d.junior.username;
            }}
            , {width: 100, align: 'center', title: '高级合伙人', templet: function (d) {
                return d.seniorPartner.username;
            }}
            , {width: 100, align: 'center', title: '战略联盟', templet: function (d) {
                return d.strategic.name;
            }}
            , {width: 200, align: 'center', title: '工厂名称', templet: function (d) {
                return d.factory.factory_name;
            }}
            , {width: 150, align: 'center', title: '职位名称', templet: function (d) {
                return d.job.job_name;
            }}
            , {width: 100, align: 'center', title: '签单信息', templet: function (d) {
                return '<a type="button" class="layui-btn layui-btn layui-btn-xs" lay-submit lay-event="signingInfo">查看</a>';
            }}
            , {width: 100, align: 'center', title: '分红', templet: function (d) {
                    return '<a type="button" class="layui-btn layui-btn layui-btn-xs" lay-submit lay-event="dividend">查看</a>';
            }}
            , {width: 100, align: 'center', title: '工资', templet: function (d) {
                return '<a type="button" class="layui-btn layui-btn layui-btn-xs" lay-submit lay-event="wage">查看</a>';
            }}
            , {field: 'create_time', width: 180, align: 'center', title: '创建时间'}
            , {title: "操作", width: 100, align: "center", fixed: "right", toolbar: "#LAY-payoff-list-tool-tages"}
        ]]
        // , cellMinWidth: 100
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个工资条事件"
        }
    });

    table.on("tool(LAY-payoff-list)", function(obj) {

        if(obj.event === "signingInfo") {
            admin.popup({
                title: '签单信息'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('FinanceDepartment/payoff/signingInfo', obj.data).done(function () {});
                }
            });
        }

        if(obj.event === "dividend") {
            admin.popup({
                title: '分红比例'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('FinanceDepartment/payoff/dividend', obj.data).done(function () {});
                }
            });
        }
        if(obj.event === "wage") {
            admin.popup({
                title: '工资条信息'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('FinanceDepartment/payoff/wage', obj.data).done(function () {});
                }
            });
        }
        if (obj.event === "del") {
            console.log(obj.data);
            layer.confirm('你确认要删除这条工资条吗？', {
                btn: ['删除','返回'] //按钮
            }, function() {
                XXXXXXreqest({
                    url: "/api/paySlip/deleteSlip",
                    data: obj.data,
                    success: function (res) {
                        console.log(res.data);
                        if (res.code == 0) {
                            layer.closeAll();

                        }
                        reload('LAY-payoff-list');
                    }
                });
            });
        }
    });


    table.on("toolbar(LAY-payoff-list)", function(obj) {
        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择");
            return;
        }
        //审核
        if(obj.event === "audit") {
            if (checkStatus.data[0].slip.status) {
                layer.msg("已审核");
                return;
            }

            payoffAudit(checkStatus.data[0]);
        }
    });



    function payoffAudit(data) {
        layer.confirm('你需要如何处理？', {
            btn: ['同意','驳回','退出'] //按钮
        }, function() {
            //同意
            data['status'] = 1;
            XXXXXXreqest({
                url: "/api/paySlip/payWage",
                data: data,
                success: function (res) {
                    console.log(res.data);
                    if (res.code == 0) {
                        layer.closeAll();
                        reload('LAY-payoff-list');
                    }
                }
            });
        }, function () {
            //驳回
            data['status'] = 0;
            XXXXXXreqest({
                url: "/api/paySlip/payWage",
                data: data,
                success: function (res) {
                    console.log(res.data);
                    if (res.code == 0) {
                        layer.closeAll();
                        reload('LAY-payoff-list');
                    }
                }
            });
        });
    }

    /**
     * 发送一个请求
     * @param url
     * @param data
     * @param success
     * @constructor
     */
    function XXXXXXreqest({url, data, success}) {
        admin.req({
            url: url
            , type: "post"
            , data: data
            , success: success
        });
    }

    /**
     * 刷新table
     * @param table_id
     */
    function reload(table_id) {
        layui.table.reload(table_id); //重载表格
        // table.reload(); //重载表格
    }



    exports("payoff", {});
});