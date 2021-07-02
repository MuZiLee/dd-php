layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("personnel");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;



    /**
     * 人事部的审核事件--入职事件列表
     */
    table.render({
        elem: "#extry-table-list"
        , url: "/api/factory/getApplylist"
        , method: "post"
        , toolbar: "#extry-table-header-list"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", title: "序号", align: "center", fixed: "left"}
            , {width: 100,align: "center", title:"当前状态", templet: function (d) {
                var data = d.logs.pop();
                if (data) {
                    if (data.status == 1) {
                        /// 驻场老师审核
                        if (data.role.id == 8 && data.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已入职</span>';
                        }
                        return '<span class="layui-badge layui-bg-gray">已通过</span>'
                    } else {
                        return '<span class="layui-badge layui-bg-gray">已驳回</span>'
                    }
                } else  {
                    return '<span class="layui-badge layui-bg-gray">待审核</span>'
                }
            }}
            , {width: 80,align: "center", title:"头像", templet:"#imgTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 100,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 100,align: "center", title:"当前审核人", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("当前审核人:"+JSON.stringify(data));
                    if (data) {
                        return data.user.username;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 100,align: "center", title:"审核角色", templet: function (d) {
                var data = d.logs.pop();
                // console.log("审核角色:"+JSON.stringify(data));
                if (data) {
                    return data.role.title;
                } else  {
                    return  "";
                }
            }}
            // , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            // , {title: "操作", width: 150, align: "center", fixed: "right", templet: function (d) {
            //     var data = d.logs.pop();
            //     if (data) {
            //         /// 驻场老师审核
            //         if (data.role.id == 8 && data.status == 1) {
            //             return '<span class="layui-badge layui-bg-gray">已入职</span>';
            //         }
            //         if (data.role.id == 8 && data.status == 2) {
            //             return "";
            //         }
            //
            //         /// 人事审核
            //         if (data.role.id == 12 && data.status == 1) {
            //             return '<span class="layui-badge layui-bg-gray">已过审</span>';
            //         }
            //         if (data.role.id == 12 && data.status == 2) {
            //             return "";
            //         }
            //
            //         /// 初级审核
            //         if (data.role.id == 4 && data.status == 1) {
            //             var span = '<a class="layui-btn layui-badge layui-bg-blue" lay-event="entry-table-agree">审核</a>';
            //             return  span + '<a class="layui-btn layui-badge layui-badge" lay-event="entry-table-back">驳回</a>';
            //         }
            //         if (data.role.id == 4 && data.status == 2) {
            //             return "";
            //         }
            //
            //     } else  {
            //         return ""
            //     }
            //
            // }}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个职位申请"
        }
    });
    /**
     * 人事部的审核事件 -- 入职 - 审核
     */
    table.on("toolbar(extry-table-list)", function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择事件");
            return;
        }
        var data = checkStatus.data[0];
        data.eid = data.id;
        data.rid = 12;

        layer.confirm('审核操作', {
            btn: ['同意','驳回','退出'] //按钮
        }, function (obj) {
            request({
                status: 1,
                data: data,
                url: '/api/events/eventAudit',
                elem: 'extry-table-list'
            });

        }, function () {
            request({
                status: 2,
                data: data,
                url: '/api/events/eventAudit',
                elem: 'extry-table-list'
            });
        });
    });
    table.on("tool(extry-table-list)", function (obj) {
        if (obj.event == "logsTpl") {
            admin.popup({
                title: '处理记录'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('auditLogs', {id: obj.data.id, etid: obj.data.etid}).done(function () {});
                }
            });
        }
    });
    /**
     * 人事部的审核事件 -- 请假事件列表
     */
    table.render({
        elem: "#leave-table-list"
        , url: "/api/factory/getLeavelist"
        , method: "post"
        , toolbar: "#leave-table-header-list"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", title: "序号", align: "center", fixed: "left"}
            , {width: 100,align: "center", title:"当前状态", templet: function (d) {
                var data = d.logs.pop();
                if (data) {
                    if (data.status == 1) {
                        if (data.role.id == 12 && data.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已审核</span>';
                        } else {
                            if (data.role.id == 8 && data.status == 1) {
                                return '<span class="layui-badge layui-bg-gray">待审核</span>'
                            } else {
                                return '<span class="layui-badge layui-bg-gray">已驳回</span>'
                            }
                        }
                    } else {
                        return '<span class="layui-badge layui-bg-gray">已驳回</span>'
                    }
                } else {
                    return '<span class="layui-badge layui-bg-gray">待审核</span>'
                }
            }}
            , {width: 80,align: "center", title:"头像", templet:"#imgTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 100,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 100,align: "center", title:"请假时间", templet: function (d) {
                return d.hour+"小时";
            }}
            , {width: 300,align: "center", title:"结束时间", templet: function (d) {
                return d.start_time + " - " + d.end_time;
            }}
            , {width: 100,align: "center", title:"当前审核人", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("当前审核人:"+JSON.stringify(data));
                    if (data) {
                        return data.ruser.username;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 100,align: "center", title:"审核角色", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("审核角色:"+JSON.stringify(data));
                    if (data) {
                        return data.role.title;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            , {width: 200, align: 'center', title: '最后审核时间', templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        return data.update_time;
                    } else {
                        return ""
                    }
            }}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个请假申请"
        }
    });
    table.on("tool(leave-table-list)", function (obj) {
        if (obj.event == "logsTpl") {
            admin.popup({
                title: '处理记录'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('auditLogs', {id: obj.data.id, etid: obj.data.etid}).done(function () {});
                }
            });
        }
    });
    /**
     * 人事部请假 - 审核
     */
    table.on("toolbar(leave-table-list)", function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择事件");
            return;
        }
        var data = checkStatus.data[0];
        data.eid = data.id;
        data.rid = 12;

        layer.confirm('审核操作', {
            btn: ['同意','驳回','退出'] //按钮
        }, function (obj) {
            request({
                status: 1,
                data: data,
                url: '/api/factory/personnelAudit',
                elem: 'leave-table-list'
            });

        }, function () {
            request({
                status: 2,
                data: data,
                url: '/api/factory/personnelAudit',
                elem: 'leave-table-list'
            });
        });
    });

    /**
     * 人事部的审核事件 -- 报销事件列表
     */
    table.render({
        elem: "#reimbursement-table-list"
        , url: "/api/factory/getReimbursementlist"
        , method: "post"
        , toolbar: "#reimbursement-table-header-list"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", title: "序号", align: "center", fixed: "left"}
            , {width: 100,align: "center", title:"当前状态", templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        if (data.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已审核</span>';
                        } else {
                            return '<span class="layui-badge layui-bg-gray">已驳回</span>'
                        }
                    } else  {
                        return '<span class="layui-badge layui-bg-gray">待审核</span>'
                    }
                }}
            , {width: 80,align: "center", title:"头像", templet:"#imgTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 100,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 100,align: "center", title:"报销金额", templet: function (d) {
                    return d.cost+"元";
                }}
            , {width: 100,align: "center", title:"报销凭证", templet: "#imagesTpl"}
            , {width: 100,align: "center", title:"当前审核人", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("当前审核人:"+JSON.stringify(data));
                    if (data) {
                        return data.ruser.username;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 100,align: "center", title:"审核角色", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("审核角色:"+JSON.stringify(data));
                    if (data) {
                        return data.role.title;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            , {width: 200, align: 'center', title: '最后审核时间', templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        return data.update_time;
                    } else {
                        return ""
                    }
                }}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个报销申请"
        }
    });
    /**
     * 人事部报销 - 审核
     */
    table.on("toolbar(reimbursement-table-list)", function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择事件");
            return;
        }
        var data = checkStatus.data[0];
        data.eid = data.id;
        data.rid = 12;

        layer.confirm('审核操作', {
            btn: ['同意','驳回','退出'] //按钮
        }, function (obj) {
            request({
                status: 1,
                data: data,
                url: '/api/factory/personnelAudit',
                elem: 'reimbursement-table-list'
            });
        }, function () {
            request({
                status: 2,
                data: data,
                url: '/api/factory/personnelAudit',
                elem: 'reimbursement-table-list'
            });
        });
    });
    /// 查看凭证
    table.on("tool(reimbursement-table-list)", function (obj) {

        if (obj.event == "imagesTpl") {
            var images = Array();
            for(i = 0; i < obj.data.images.length; i++) {
                images.push({"src": obj.data.images[i]});
            }
            layer.photos({
                photos: {
                    "title": "查看图片"
                    , "data": images
                }
                , shade: 0.01
                , closeBtn: 1
                , anim: 5
            });
        }
        if (obj.event == "logsTpl") {
            admin.popup({
                title: '处理记录'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('auditLogs', {id: obj.data.id, etid: obj.data.etid}).done(function () {});
                }
            });
        }
    });

    /**
     * 人事部的审核事件 -- 离职事件列表
     */
    table.render({
        elem: "#quit-table-list"
        , url: "/api/factory/getQuitlist"
        , method: "post"
        , toolbar: "#quit-table-header-list"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", title: "序号", align: "center", fixed: "left"}
            , {width: 100,align: "center", title:"当前状态", templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        if (data.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已审核</span>';
                        } else {
                            return '<span class="layui-badge layui-bg-gray">已驳回</span>'
                        }
                    } else  {
                        return '<span class="layui-badge layui-bg-gray">待审核</span>'
                    }
                }}
            , {width: 80,align: "center", title:"头像", templet:"#imgTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 100,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 170,align: "center", title:"入职时间", templet: function (d) {
                return d.injob_time;
            }}
            , {width: 170,align: "center", title:"离场时间", templet: function (d) {
                    return d.end_time;
            }}
            , {width: 100,align: "center", title:"当前审核人", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("当前审核人:"+JSON.stringify(data));
                    if (data) {
                        return data.ruser.username;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 100,align: "center", title:"审核角色", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("审核角色:"+JSON.stringify(data));
                    if (data) {
                        return data.role.title;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            , {width: 200, align: 'center', title: '最后审核时间', templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        return data.update_time;
                    } else {
                        return ""
                    }
                }}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个离职申请"
        }
    });
    /**
     * 人事部的审核事件 - 离职审核
     */
    table.on("toolbar(quit-table-list)", function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择事件");
            return;
        }
        var data = checkStatus.data[0];
        data.eid = data.id;
        data.rid = 12;

        console.log(data);

        layer.confirm('审核操作', {
            btn: ['同意','驳回','退出'] //按钮
        }, function (obj) {
            data["status"] = 1;
            request({
                status: 1,
                data: data,
                url: '/api/factory/personnelAudit',
                elem: 'quit-table-list'
            });
        }, function () {
            data["status"] = 2;
            request({
                status: 2,
                data: data,
                url: '/api/factory/personnelAudit',
                elem: 'quit-table-list'
            });
        });
    });
    table.on("tool(quit-table-list)", function (obj) {
        if (obj.event == "logsTpl") {
            admin.popup({
                title: '处理记录'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('auditLogs', {id: obj.data.id, etid: obj.data.etid}).done(function () {});
                }
            });
        }
    });

    /**
     * 财务部的审核事件 -- 报销事件列表
     */
    table.render({
        elem: "#fainance-reimbursement-table-list"
        , url: "/api/factory/getReimbursementlist"
        , method: "post"
        , toolbar: "#fainance-reimbursement-table-header-list"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", title: "序号", align: "center", fixed: "left"}
                , {width: 100,align: "center", title:"当前状态", templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        if (data.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已审核</span>';
                        } else {
                            return '<span class="layui-badge layui-bg-gray">已驳回</span>'
                        }
                    } else  {
                        return '<span class="layui-badge layui-bg-gray">待审核</span>'
                    }
                }}
            , {width: 80,align: "center", title:"头像", templet:"#imgTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 100,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 100,align: "center", title:"报销金额", templet: function (d) {
                    return d.cost+"元";
                }}
            , {width: 100,align: "center", title:"报销凭证", templet: "#imagesTpl"}
            , {width: 100,align: "center", title:"下载凭证", templet: "#downloadTpl"}
            , {width: 100,align: "center", title:"当前审核人", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("当前审核人:"+JSON.stringify(data));
                    if (data) {
                        return data.ruser.username;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 100,align: "center", title:"审核角色", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("审核角色:"+JSON.stringify(data));
                    if (data) {
                        return data.role.title;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            , {width: 200, align: 'center', title: '最后审核时间', templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        return data.update_time;
                    } else {
                        return ""
                    }
                }}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个报销申请"
        }
    });
    /**
     * 财务部报销 - 审核
     */
    table.on("toolbar(fainance-reimbursement-table-list)", function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择事件");
            return;
        }
        var data = checkStatus.data[0];
        data.eid = data.id;
        data.rid = 13;

        layer.confirm('审核操作', {
            btn: ['同意','驳回','退出'] //按钮
        }, function (obj) {
            request({
                status: 1,
                data: data,
                url: '/api/factory/businessAudit',
                elem: 'fainance-reimbursement-table-list'
            });
        }, function () {
            request({
                status: 2,
                data: data,
                url: '/api/factory/businessAudit',
                elem: 'fainance-reimbursement-table-list'
            });
        });
    });
    /// 查看凭证
    table.on("tool(fainance-reimbursement-table-list)", function (obj) {

        // console.log(JSON.stringify(obj.data));//
        // console.log(obj.data.images);//
        if (obj.event == "imagesTpl") {
            var images = Array();
            for(i = 0; i < obj.data.images.length; i++) {
                images.push({"src": obj.data.images[i]});
            }
            layer.photos({
                photos: {
                    "title": "查看图片"
                    , "data": images
                }
                , shade: 0.01
                , closeBtn: 1
                , anim: 5
            });
        }
        if (obj.event == "downloadTpl") {

            layui.each(obj.data.images, function (index, item) {
                var link = document.createElement('a');
                link.setAttribute("download", "");
                link.href = item;
                link.click();

                // let a = document.createElement('a') // 创建a标签
                // let e = document.createEvent('MouseEvents') // 创建鼠标事件对象
                // e.initEvent('click', false, false) // 初始化事件对象
                // a.href = item // 设置下载地址
                // a.download = '' // 设置下载文件名
                // a.dispatchEvent(e)
            });
        }
        if (obj.event == "logsTpl") {

            admin.popup({
                title: '处理记录'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('auditLogs', {id: obj.data.id, etid: obj.data.etid}).done(function () {});
                }
            });
        }
    });


    /**
     * 财务部的审核事件 -- 预支事件列表
     */
    table.render({
        elem: "#collect-in-advance-table-list"
        , url: "/api/factory/getAdvancelist"
        , method: "post"
        , toolbar: "#collect-in-advance-table-header-list"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", title: "序号", align: "center", fixed: "left"}
            , {width: 100,align: "center", title:"当前状态", templet: function (d) {
                    var data = d.logs.pop();
                    if (data) {
                        if (data.status == 1) {
                            return '<span class="layui-badge layui-bg-blue">已审核</span>';
                        } else {
                            return '<span class="layui-badge layui-bg-gray">已驳回</span>'
                        }
                    } else  {
                        return '<span class="layui-badge layui-bg-gray">待审核</span>'
                    }
                }}
            , {width: 80,align: "center", title:"头像", templet:"#imgTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 100,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 100,align: "center", title:"预支金额", templet: function (d) {
                return d.cost+"元";
            }}
            , {width: 100,align: "center", title:"总工时", templet: function (d) {
                return d.hour+"小时";
            }}
            , {width: 100,align: "center", title:"预算总工资", templet: function (d) {
                return d.total+"元";
            }}
            , {width: 100,align: "center", title:"预算总工资", templet: function (d) {
                return d.total+"元";
            }}
            , {width: 100,align: "center", title:"员工单价", templet: function (d) {
                return d.sigingInfo.employee_unit_price+"元";
            }}
            , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            , {width: 100,align: "center", title:"当前审核人", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("当前审核人:"+JSON.stringify(data));
                    if (data) {
                        return data.ruser.username;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 100,align: "center", title:"审核角色", templet: function (d) {
                    var data = d.logs.pop();
                    // console.log("审核角色:"+JSON.stringify(data));
                    if (data) {
                        return data.role.title;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 200, align: 'center', title: '最后审核时间', templet: function (d) {
                var data = d.logs.pop();
                if (data) {
                    return data.update_time;
                } else {
                    return ""
                }
            }}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个预支申请"
        }
    });
    table.on("tool(collect-in-advance-table-list)", function (obj) {
        if (obj.event == "logsTpl") {

            admin.popup({
                title: '处理记录'
                , area: ['80%', '80%']
                , id: new Date().getTime()
                , success: function (layero, index) {
                    view(this.id).render('auditLogs', {id: obj.data.id, etid: obj.data.etid}).done(function () {});
                }
            });
        }
    });
    table.on("toolbar(collect-in-advance-table-list)", function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);

        if (checkStatus.data.length < 1) {
            layer.msg("未选择事件");
            return;
        }
        var data = checkStatus.data[0];
        data.eid = data.id;
        data.rid = 13;

        console.log(data);

        layer.confirm('审核操作', {
            btn: ['同意','驳回','退出'] //按钮
        }, function (obj) {
            request({
                status: 1,
                data: data,
                url: '/api/factory/businessAudit',
                elem: 'collect-in-advance-table-list'
            });
        }, function () {
            request({
                status: 2,
                data: data,
                url: '/api/factory/businessAudit',
                elem: 'collect-in-advance-table-list'
            });
        });
    });








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









    // table.on("tool(extry-table-list)", function(obj) {
    //
    //     if (obj.event === "logsTpl") {

    //         return;
    //     }
    //
    //     /**
    //      * 删除
    //      */
    //     if(obj.event === "entry-table-del") {
    //         var id = obj.data.id;
    //
    //         return;
    //     }
    //
    //     /**
    //      * 同意
    //      */
    //     if(obj.event === "entry-table-agree") {
    //         obj.data.status = 1;
    //     }
    //     /**
    //      * 驳回
    //      */
    //     if (obj.event === "entry-table-back") {
    //         obj.data.status = 2;
    //     }
    //
    //     layer.prompt({
    //         formType: 2
    //         , title: obj.data.status == 1 ? '同意：备注' : '驳回: 备注'
    //     }, function (value, index) {
    //         if (!value) {
    //             return false;
    //         }
    //
    //         var event = {};
    //         event.rid = 12; //人事角色为12
    //         event.remark = value;
    //         event.status = obj.data.status;
    //         console.log(event);
    //         admin.req({
    //             url: '/api/events/eventAudit'
    //             , type: "post"
    //             , headers: {
    //                 token: layui.data('layuiAdmin').token
    //             }
    //             , data: event
    //             , success: function (res) {
    //                 if (res.code == 0) {
    //                     table.reload('entry-table-list');
    //                 }
    //                 layer.closeAll();
    //             }
    //         });
    //
    //     });
    //
    // });


    form.render(null, 'extry-form-list');
    /**
     * 报名
     */
    form.on('submit(form-signUp)', function(data){
        var field = data.field;

        layer.msg("form-signUp");
    });
    /**
     * 报销
     */
    form.on("submit(form-writeOff)", function(data) {
        layer.msg("form-writeOff");

    });
    /**
     * 请假
     */
    form.on("submit(form-askForLeave)", function(data) {
        layer.msg("form-askForLeave");
    });
    /**
     * 离职
     */
    form.on("submit(form-resign)", function(data) {
        layer.msg("form-resign");
    });


    exports("personnel", {});
});