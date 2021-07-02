

layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("eventsClosed");
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
        elem: "#LAY-eventsClosed-list"
        , url: '/api/events/getEventRolesClosed'
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
            // , {title: "操作", width: 100, align: "center", fixed: "right", toolbar: "#LAY-eventsClosed-list-tool-tages"}
        ]]
        , cellMinWidth: 100
        // ,height: 'full-200'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个驳回事件"
        }
    });



    table.on("tool(LAY-eventsClosed-list)", function(obj) {
        if(obj.event === "rocessed-edit") {
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
                , id: 'LAY-eventsClosed-list-remarkTpl'
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
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/getEventRolesClosed'
            ,type: "post"
        });
    });
    //报名
    form.on('submit(form-signUp)', function(data){
        var field = data.field;
        console.log("form-signUp");
        //执行重载
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/getSignUpClosed'
            ,type: "post"
        });
    });
    //打卡
    form.on("submit(form-punchCard)", function(data) {
        console.log("form-punchCard");
        //执行重载
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/punchCardClosed'
            ,type: "post"
        });
    });
    //报销
    form.on("submit(form-writeOff)", function(data) {
        console.log("form-writeOff");
        //执行重载
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/writeOffClosed'
            ,type: "post"
        });
    });
    //请假
    form.on("submit(form-askForLeave)", function(data) {
        console.log("form-askForLeave");

        //执行重载
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/askForLeaveClosed'
            ,type: "post"
        });
    });
    //离职
    form.on("submit(form-resign)", function(data) {
        console.log("form-resign");
        //执行重载
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/resignClosed'
            ,type: "post"
        });
    });
    //提现申请
    form.on("submit(form-cashIn)", function(data) {
        console.log("form-cashIn");
        //执行重载
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/cashInClosed'
            ,type: "post"
        });
    });
    //预支申请
    form.on("submit(form-advance)", function(data) {
        console.log("form-advance");
        //执行重载
        table.reload('LAY-eventsClosed-list', {
            url: '/api/events/advanceClosed'
            ,type: "post"
        });
    });

    form.render(null, 'LAY-eventsClosed-form-list');

    //监听搜索
    form.on('submit(LAY-app-order-search)', function(data){
        var field = data.field;

        //执行重载
        table.reload('LAY-eventsClosed-list', {
            where: {type: 8}
        });
    });
    //年月范围
    layui.laydate.render({
        elem: '#LAY-eventsClosed-time'
        // ,type: 'month'
        // ,range: true
        ,type: 'month'
        ,range: '~'
        ,format: 'yyyy-MM'
    });

    // function eventsClosedPOP({success: success}) {
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


    // var eventsClosedList = function() {
    //
    // };
    //
    //
    // var objs = {
    //     eventsClosedList: eventsClosedList
    // };
    exports("eventsClosed", {});
});