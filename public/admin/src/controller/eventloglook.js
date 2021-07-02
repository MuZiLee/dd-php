

layui.define(['table', 'admin', 'view', 'table', 'form', 'jquery'], function (exports) {
    var $ = layui.jquery;
    var table = layui.table;
    var admin = layui.admin;
    var form = layui.form;
    var view = layui.view;
    var data = layui.setter.getData().data;

    console.log("eventloglook");
    console.log(data);
    // console.log(data.id);


    $(function() {
        if (!data.id) return;



    });

    // table.render({
    //     elem: '#LAY-eventloglook-list'
    //     ,id: 'LAY-eventloglook-list'
    //     ,url: '/api/events/getEventLogsList'
    //     ,method: "post"
    //     ,cellMinWidth: 80
    //     ,where: {"eid":data.id}
    //     ,cols: [[
    //
    //     ]]
    //     , page: true
    //     , limit: 15
    //     , limits: [10, 15, 20, 30, 40, 50, 100]
    //     , text: {
    //         none: '当前工厂 0 ' + (type == 'teacher' ? '个驻场老师' : 'HR')
    //     }
    // });


    exports('eventloglook', {});
});