layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function (exports) {
    console.log("strategic.js");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;


    table.render({
        elem: "#stategic-list"
        , url: "/api/events/getStrategiclist"
        , method: "post"
        , toolbar: "#stategic-list-toolbar"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", align: "center", title: '序号', fixed: "left"}
            , {width: 80, align: 'center', title: '状态', fixed: "left", templet: function (d) {
                    // console.log(d);
                    var data = d.logs.pop();
                    if (data != null) {
                        if (data.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已通过</span>'
                        } else {
                            return '<span class="layui-badge layui-bg-black">已驳回</span>'
                        }
                    } else {
                        return '<span class="layui-badge layui-bg-orange">待审核</span>'
                    }
                }
            }
            , {width: 150, align: 'center', title: '公司名称', templet: "#companynaemTpl"}
            , {width: 150, align: 'center', title: '申请人', templet: function (d) {
                return d.user.username?d.user.username:d.user.phone;
            }}
            , {width: 100, align: 'center', title: '性别', templet: function (d) {
                    if (d.user.sex == 1) {
                        return "男";
                    } else {
                        return "女";
                    }
                }}
            , {width: 150, align: 'center', title: '联系电话', templet: function (d) {
                    return d.user.phone;
                }}

            , {width: 150, align: 'center', title: '紧急联系人', templet: function (d) {
                    // return d.sos_name;
                    console.log(d);
                    return d.strategicAlliance.sos_name;
                }}
            , {width: 150, align: 'center', title: '紧急联系人电话', templet: function (d) {
                    if (d.strategicAlliance.sos_phone) {
                        return d.strategicAlliance.sos_phone;
                    } else  {
                        return ""
                    }
                }}
            , {width: 100, align: "center", title: "初级分红", templet: "#pgDividendTpl"}
            , {width: 100, align: "center", title: "高级分红", templet: "#agDividendTpl"}
            , {width: 100, align: "center", title: "战略分红", templet: "#egDividendTpl"}
            , {width: 100, align: "center", title: "蛋蛋分红", templet: "#dgDividendTpl"}
            , {width: 100, align: "center", title: "手续费", templet: "#dd_service_chargeTpl"}
            , {width: 100, align: "center", title: "总分红", templet: function (d) {
                return "";
            }}
            , {width: 100, align: "center", title: "历史分红", templet: function (d) {
                return "";
            }}

            , {width: 100, align: 'center', title: '省', templet: "#provinceTpl"}
            , {width: 100, align: 'center', title: '市', templet: "#cityTpl"}
            , {width: 100, align: 'center', title: '区/县/镇', templet: "#countyTpl"}
            , {width: 250, align: 'center', title: '地址', templet: "#addressTpl"}

            , {width: 170, align: 'center', title: '申请时间', templet: "#create_timeTpl"}

            , {
                width: 900, title: "当前角色", templet: function (d) {
                    var roles = "";
                    $.each(d.user.roles, function (key, value) {
                        roles = roles + " " + "<span class=\"layui-badge\">" + value.title + "</span>";
                    });
                    return roles;
                }
            }
            // , {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#stategic-list-tool"}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: ' 0 个战略联盟合伙人申请',
        }
    });

    table.on("tool(stategic-list)", function (obj) {

        console.log(obj.data);
        var strategicAlliance = obj.data.strategicAlliance;
        if (obj.event === "pgDividendTpl") {
            layui.layer.prompt({
                formType: 0
                , title: "初级合伙人分红"
                , value: strategicAlliance.jp_dividend
            }, function (value, index) {
                if (!value) {
                    return false;
                }
                strategicAlliance.jp_dividend = value;
                setStrategic({
                    data: strategicAlliance,
                    elem: "stategic-list"
                });
            });

        }
        if (obj.event === "agDividendTpl") {

            layui.layer.prompt({
                formType: 0
                , title: "高级合伙人分红"
                , value: strategicAlliance.sp_dividend
            }, function (value, index) {
                if (!value) {
                    return false;
                }
                strategicAlliance.sp_dividend = value;
                setStrategic({
                    data: strategicAlliance,
                    elem: "stategic-list"
                });
            });

        }
        if (obj.event === "egDividendTpl") {

            layui.layer.prompt({
                formType: 0
                , title: "战略联盟分红"
                , value: strategicAlliance.sa_dividend
            }, function (value, index) {
                if (!value) {
                    return false;
                }
                strategicAlliance.sa_dividend = value;
                setStrategic({
                    data: strategicAlliance,
                    elem: "stategic-list"
                });
            });
        }
        if (obj.event === "dgDividendTpl") {

            layui.layer.prompt({
                formType: 0
                , title: "蛋蛋分红"
                , value: strategicAlliance.dd_dividend
            }, function (value, index) {
                if (!value) {
                    return false;
                }
                strategicAlliance.dd_dividend = value;
                setStrategic({
                    data: strategicAlliance,
                    elem: "stategic-list"
                });
            });
        }
        if (obj.event === "dd_service_chargeTpl") {

            layui.layer.prompt({
                formType: 0
                , title: "手续费"
                , value: strategicAlliance.dd_service_charge
            }, function (value, index) {
                if (!value) {
                    return false;
                }
                strategicAlliance.dd_service_charge = value;
                setStrategic({
                    data: strategicAlliance,
                    elem: "stategic-list"
                });
            });
        }

        if (obj.event === "apply") {
            layer.prompt({
                formType: 1
                , title: "删除操作，请验证口令"
            }, function (value, index) {
                layer.close(index);
                if (hex_md5(value) != layui.data("layuiAdmin").password) {
                    layer.msg("口令不正确");
                } else {
                    layer.confirm("你需要如何处理？", {
                        btn: ["同意", "驳回", "退出"] //按钮
                    }, function () {
                        layer.prompt({
                            formType: 2
                            , title: "同意：备注"
                        }, function (value, index) {
                            if (!value) {
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
                                , success: function (res) {
                                    if (res.code == 0) {
                                        table.reload("stategic-list");
                                    }
                                    layer.closeAll();
                                    layer.msg(res.msg);
                                }
                            });

                        });
                    }, function () {
                        layer.prompt({
                            formType: 2
                            , title: "驳回：备注"
                        }, function (value, index) {
                            if (!value) {
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
                                , data: obj
                                , success: function (res) {
                                    if (res.code == 0) {
                                        table.reload("stategic-list");
                                    }
                                    layer.closeAll();

                                }
                            });

                        });
                    });

                }

            });
        }

        if (obj.event === "del") {
            layer.prompt({
                formType: 1
                , title: "删除操作，请验证口令"
            }, function (value, index) {
                layer.close(index);
                if (hex_md5(value) != layui.data("layuiAdmin").password) {
                    layer.msg("口令不正确");
                } else {
                    layer.confirm("此操作会一起删除历史审核记录,数据无法恢复,确认删除？删除不影响用户数据", function (index) {

                        admin.req({
                            url: "/api/events/dele",
                            data: obj.data,
                            type: "post",
                            success: function (res) {
                                console.log(res);
                                if (res.code == 0) {
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
    table.on("toolbar(stategic-list)", function (obj) {

        if (obj.event == "entry-add") {
            admin.popup({
                title: '创建战略联盟合伙人'
                ,area: ['500px', '480px']
                ,id: 'LAY-popup-addStrategic'
                ,success: function(layero, index){
                    view(this.id).render('FinanceDepartment/addStrategic', obj.data).done(function(){

                    });
                }

            });
            return;
        }

        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择事件");
            return;
        }
        var data = checkStatus.data[0];

        if (obj.event == "entry-audit") {
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
                            event.eid = data.id;
                            event.rid = user.owned.pop(); //用户最后一个角色
                            event.remark = value;
                            event.status = 1;

                            console.log(event);

                            admin.req({
                                url: "/api/events/eventAudit"
                                , type: "post"
                                , headers: {
                                    token: layui.data("layuiAdmin").token
                                }
                                , data: event
                                , success: function(res) {
                                    if (res.code == 0) {
                                        table.reload("stategic-list");
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
                                url: "/api/events/eventAudit"
                                , type: "post"
                                , headers: {
                                    token: layui.data("layuiAdmin").token
                                }
                                , data: event
                                , success: function (res) {
                                    if (res.code == 0) {
                                        table.reload("stategic-list");
                                    }
                                    layer.closeAll();

                                }
                            });



                        });
                    });

                }

            });
        }




    })

    function setStrategic({data = {}, elem = ""}) {

        delete(data.create_time);
        delete(data.soso_phone);
        delete(data.sos_name);
        delete(data.name);
        delete(data.province);
        delete(data.city);
        delete(data.county);
        delete(data.address);
        delete(data.update_time);
        delete(data.token);

        layui.admin.req({
            url: "/api/partner/setStrategicInfo"
            , data: data
            , type: "post"
            , headers: {token: layui.data('layuiAdmin').token}
            , success: function (res) {
                layui.layer.closeAll();
                if (res.code == 0) {
                    table.reload(elem);
                }
            }
        });
    }

    /**
     * 发送请求
     * @param status 状态
     * @param data 数据
     * @param url
     * @param elem 需要刷新的table
     */
    function request({status = 1, data = {}, url = "", elem = ""}) {
        layui.layer.prompt({
            formType: 2
            , title: status == 1 ? '同意：备注' : '驳回: 备注'
        }, function (value, index) {
            if (!value) {
                return false;
            }
            data.remark = value;
            data.status = status;
            console.log("---请求---");
            console.log(data);
            layui.admin.req({
                url: url
                , data: data
                , type: "post"
                , headers: {token: layui.data('layuiAdmin').token}
                , success: function (res) {
                    layui.layer.closeAll();
                    if (res.code == 0) {
                        table.reload(elem);
                    }
                }
            });
        });
    }

    exports("strategic", {});
});