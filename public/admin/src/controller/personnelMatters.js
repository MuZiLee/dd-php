layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("personnelMatters ");
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
        elem: "#LAY-personnelMatters-list"
        , url: "/api/factory/getApplylist"
        , method: "post"
        , toolbar: "#Lay-personnelMatters-list-toolbar"
        , cols: [[
            {type: "numbers", width: 60, title: "序号", align: "center", fixed: "left", sort: true}
            , {width: 80,align: "center", title:"用户", templet:"#imgTpl"}
            , {width: 150,align: "center", title:"事件名称", templet:"#titleTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 150,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 150,align: "center", title:"当前审核人", templet: function (d) {
                    var data = d.logs.pop();
                    console.log("当前审核人:"+JSON.stringify(data));
                    if (data) {
                        return data.user.username;
                    } else  {
                        return  "";
                    }
                }}
            , {width: 150,align: "center", title:"审核角色", templet: function (d) {
                var data = d.logs.pop();

                console.log("审核角色:"+JSON.stringify(data));
                if (data) {
                    return data.role.title;
                } else  {
                    return  "";
                }
            }}
            , {width: 100,align: "center", title:"审核状态", templet: function (d) {
                var data = d.logs.pop();
                if (data) {
                    if (data.status == 1) {
                        return '已通过'
                    } else  {
                        return '已驳回'
                    }
                } else  {
                    return  "";
                }
            }}
            , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            , {title: "操作", width: 150, align: "center", fixed: "right", templet: function (d) {
                var data = d.logs.pop();
                if (data && data.role.id == 8) {
                    /// 驻场老师已经审核完
                    return  "已入职";
                } else if(data && data.role.id == 4) {
                    return  '<a class="layui-btn layui-btn-danger layui-bg-green layui-btn-xs" lay-event="personnelMatters-agree"><i class="layui-icon layui-icon-carousel"></i>审核</a>';
                } else if (data && data.role.id == 12 && data.status == 1) {
                    return  '<a class="layui-btn layui-btn-danger layui-bg-red layui-btn-xs" lay-event="personnelMatters-back"><i class="layui-icon layui-icon-close"></i>驳回</a>';
                } else if (data && data.role.id == 12 && data.status == 2) {
                    return  '已驳回';
                }
                if (!data) {
                    return  '等待合伙人审核';
                }


            }}
        ]]
        , defaultToolbar: []
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个职位申请"
        }
    });

    table.on("tool(LAY-personnelMatters-list)", function(obj) {

        console.log(obj.data);

        if (obj.event === "logsTpl") {
            admin.popup({
                title: '处理记录'
                , area: ['50%', '90%']
                , id: 'LAY-personnelMatters-logsTpl'
                , success: function (layero, index) {

                    view(this.id).render('Personnel/workorder/list', obj.data.logs).done(function () {


                    });
                }
            });

            return;
        }

        obj.data.status = 1;
        /**
         * 同意
         */
        if(obj.event === "personnelMatters-agree") {
            obj.data.status = 1;
        }
        /**
         * 驳回
         */
        if (obj.event === "personnelMatters-back") {
            obj.data.status = 2;
        }

        layer.prompt({
            formType: 2
            , title: obj.data.status == 1 ? '同意：备注' : '驳回: 备注'
        }, function (value, index) {
            if (!value) {
                return false;
            }
            var user = layui.data("layuiAdmin").userInfo;
            // console.log(JSON.stringify(user.owned.pop()));
            // console.log(event);
            var event = {};
            event.eid = obj.data.id;
            event.rid = 12; //人事角色为12
            event.remark = value;
            event.status = obj.data.status;

            admin.req({
                url: '/api/events/eventAudit'
                , type: "post"
                , headers: {
                    token: layui.data('layuiAdmin').token
                }
                , data: event
                , success: function (res) {
                    if (res.code == 0) {
                        table.reload('LAY-personnelMatters-list');
                    }
                    layer.closeAll();
                }
            });

        });

    });


    form.render(null, 'LAY-personnelMatters-form-list');
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


    exports("personnelMatters", {});
});