

layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("eventsUnprocessed");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var laydate = layui.laydate;
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
        elem: "#LAY-eventsUnprocessed-list"
        , url: '/api/events/getEventRoles'
        , method: "post"
        , cols: [[
            {type: "checkbox", fixed: "left"}
            , {type: "numbers", width: 70, align: "center", fixed: "left", title:"序列", sort: true}
            , {type: "status", width: 70, align: "center", title: "状态", fixed: "left", templet: "#statusTpl"}
            , {width: 180, align: 'center', title: '事件名称', sort: true, templet: "#eventnameTpl"}
            , {width: 100, align: 'center', title: '发起者', sort: true, templet: "#usernameTpl"}
            , {width: 200, align: 'center', title: '发起时间', sort: true, templet: "#createTimeTpl"}
            , {width: 100, align: 'center', title: '上级', sort: true, templet: "#partnerTpl"}
            , {width: 160, align: 'center', title: '所属战略伙伴', sort: true, templet: "#enterpriseTpl"}
            , {width: 150, align: 'center', title: '备注', sort: true, templet: "#remarkTpl"}
            , {title: "操作", width: 100, align: "center", fixed: "right", toolbar: "#LAY-eventsUnprocessed-list-tool-tages"}
        ]]
        , cellMinWidth: 100
        // ,height: 'full-200'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个待处理事件"
        }
    });




    table.on("tool(LAY-eventsUnprocessed-list)", function(obj) {

        if(obj.event === "unprocessed-edit") {

            layer.prompt({
                formType: 1
                ,title: '敏感操作，请验证口令'
            }, function(value, index){
                layer.close(index);
                if (hex_md5(value) != layui.data('layuiAdmin').password)  {
                    layer.msg("口令不正确");
                } else  {
                    layer.confirm('你需要如何处理？', {
                        btn: ['同意','驳回','退出'] //按钮
                    }, function() {

                        if (obj.data.eventType.title == "战略联盟申请") {

                            layer.closeAll();
                            console.log(JSON.stringify(obj.data));
                            admin.popup({
                                title: "设置战略联盟分红"
                                , area: ["50%", "90%"]
                                , id: "设置战略联盟分红"
                                , success: function(layero, index) {
                                    // console.log(data.id);
                                    // console.log(JSON.stringify(obj.data));
                                    layui.view(this.id).render("events/enterpriseInput", obj.data).done(function() {
                                        form.render(null, 'enterprise-input-form');
                                    });
                                }
                            });
                            return;
                        }

                        layer.prompt({
                            formType: 2
                            ,title: '同意：备注'
                        }, function(value, index){
                            if(!value) {
                                return false;
                            }
                            obj.data.remark = value;
                            if (obj.data.tid == 400) {
                                obj.data.status = 2;
                            } else  {
                                obj.data.status = 1;
                            }

                            admin.req({
                                url: '/api/events/dispose'
                                ,type: "post"
                                ,headers: {
                                    token: layui.data('layuiAdmin').token
                                }
                                ,data: obj.data
                                ,success: function(res) {
                                    table.reload('LAY-eventsUnprocessed-list');
                                    layer.closeAll();
                                }
                            });

                        });
                    }, function(){
                        layer.prompt({
                            formType: 2
                            ,title: '驳回：备注'
                        }, function(value, index){
                            if(!value) {
                                return false;
                            }
                            obj.data.remark = value;

                            if (obj.data.tid == 400) {
                                obj.data.status = 100;
                            } else  {
                                obj.data.status = 2;
                            }
                            admin.req({
                                url: '/api/events/dispose'
                                ,type: "post"
                                ,headers: {
                                    token: layui.data('layuiAdmin').token
                                }
                                ,data: obj.data
                                ,success: function(res) {
                                    table.reload('LAY-eventsUnprocessed-list');
                                    layer.closeAll();

                                }
                            });

                        });
                    });

                }

            });


            //
            //
            // admin.popup({
            //     title: '查看'
            //     , area: ['90%', '90%']
            //     , id: 'LAY-eventsUnprocessed-list-search'
            //     , success: function (layero, index) {
            //
            //
            //     }
            // });

        } else if (obj.event === "remarkTpl") {
            // layer.open({
            //     type: 1
            //     ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
            //     ,id: 'layerDemo'+type //防止重复弹出
            //     ,content: '<div style="padding: 20px 100px;">'+ text +'</div>'
            //     ,btn: '关闭全部'
            //     ,btnAlign: 'c' //按钮居中
            //     ,shade: 0 //不显示遮罩
            //     ,yes: function(){
            //         layer.closeAll();
            //     }
            // });
            console.log(JSON.stringify(obj.data));
            admin.popup({
                title: '备注'
                , area: ['30%', '40%']
                , id: 'LAY-eventsUnprocessed-list-remarkTpl'
                , content: obj.data.remark
                , success: function (layero, index) {


                }
            });
        }

    });

    ///角色申请
    form.on('submit(form-roles)', function(data){
        var field = data.field;
        console.log("form-roles");
        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/getEventRoles'
            ,type: "post"
        });
    });
    //报名
    form.on('submit(form-signUp)', function(data){
        var field = data.field;
        console.log("form-signUp");
        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/getSignUp'
            ,type: "post"
        });
    });
    //打卡
    form.on("submit(form-punchCard)", function(data) {
        console.log("form-punchCard");
        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/punchCard'
            ,type: "post"
        });
    });
    //报销
    form.on("submit(form-writeOff)", function(data) {
        console.log("form-writeOff");
        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/writeOff'
            ,type: "post"
        });
    });
    //请假
    form.on("submit(form-askForLeave)", function(data) {
        console.log("form-askForLeave");

        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/askForLeave'
            ,type: "post"
        });
    });
    //离职
    form.on("submit(form-resign)", function(data) {
        console.log("form-resign");
        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/resign'
            ,type: "post"
        });
    });
    //提现申请
    form.on("submit(form-cashIn)", function(data) {
        console.log("form-cashIn");
        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/cashIn'
            ,type: "post"
        });
    });
    //预支申请
    form.on("submit(form-advance)", function(data) {
        console.log("form-advance");
        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            url: '/api/events/advance'
            ,type: "post"
        });
    });



    form.render(null, 'LAY-eventsUnprocessed-form-list');

    //监听搜索
    form.on('submit(LAY-app-order-search)', function(data){
        var field = data.field;

        //执行重载
        table.reload('LAY-eventsUnprocessed-list', {
            where: {type: 8}
        });
    });
    //年月范围
    layui.laydate.render({
        elem: '#LAY-eventsUnprocessed-time'
        // ,type: 'month'
        // ,range: true
        ,type: 'month'
        ,range: '~'
        ,format: 'yyyy-MM'
    });







    // function eventsUnprocessedPOP({success: success}) {
    //     layer.prompt({
    //         formType: 1
    //         , title: "敏感操作，请验证口令"
    //     }, function(value, index) {
    //         layer.close(index);
    //         if(hex_md5(value) != layui.data("layuiAdmin").password) {
    //             layer.msg("口令不正确");
    //         } else {
    //
    //             success();
    //         }
    //     });
    // }




    // /**
    //  * 刷新table
    //  * @param table_id
    //  */
    // function reload(table_id) {
    //     layui.table.reload(table_id); //重载表格
    //     // table.reload(); //重载表格
    // }


    // var eventsUnprocessedList = function() {
    //
    // };
    //
    //
    // var objs = {
    //     eventsUnprocessedList: eventsUnprocessedList
    // };
    exports("eventsUnprocessed", {});
});