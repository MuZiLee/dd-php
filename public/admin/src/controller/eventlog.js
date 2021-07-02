layui.define(["jquery", "element", "layer", "laydate", "layedit", "view", "table", "form", "admin", "upload"], function(exports) {
    console.log("eventlog");

    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;

    table.render({
        elem: "#LAY-eventlog-list"
        , url: "/api/events/getEventList"
        , cols: [[
            {type: "checkbox", fixed: "left"}
            , {type: "numbers", width: 70, align: "center", fixed: "left", title:"序列", sort: true}
            , {width: 200, align: 'center', title: '事件名称', sort: true, templet: function (d) {
                    return d.etype.title;
            }}
            , {width: 150, align: 'center', title: '状态', sort: true, templet: function (d) {
                if (d.logs.length > 0) {
                    if (d.logs.pop().status == 1) {
                        return "通过";
                    } else  {
                        return "驳回";
                    }
                } else  {
                    return "";
                }

            }}
            , {width: 200, align: 'center', title: '发起者', sort: true, templet: function (d) {
                    return d.user.username ? d.user.username : d.user.phone;
            }}
            , {width: 200, align: 'center', title: '发起者的上级', sort: true, templet: function (d) {
                if (d.partner) {
                    return d.partner.username ? d.partner.username : d.partner.phone;
                } else  {
                    return "";
                }

                }}
            , {width: 250, align: 'center', title: '创建时间', sort: true, templet: function (d) {
                    return d.create_time;
            }}
            , {width: 250, align: 'center', title: '更新时间', sort: true, templet: function (d) {
                    return d.update_time;
            }},
            , {width: 250, align: 'center', title: '处理记录', sort: true, templet: function (d) {
                    return d.logs.length;
            }},
            , {width: 100, align: 'center',title: "操作", toolbar: "#table-eventlog-tages"}
        ]]
        // , height: "full-150"
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0 个事件"
        }
    });

    //监听工具条
    table.on("tool(LAY-eventlog-list)", function(obj) {
        var data = obj.data;
        if(obj.event === "look") {
            console.log(data);
            // popup
            admin.popup({
                title: "历史操作记录"
                , area: ["60%", "90%"]
                , id: "历史操作记录"
                , success: function(layero, index) {

                    // layer.msg(JSON.stringify(obj.data));
                    view(this.id).render("FinanceDepartment/eventloglook").done(function() {


                        console.log("data:"+data.id);
                        table.render({
                            elem: '#LAY-eventloglook-list'
                            ,id: 'LAY-eventloglook-list'
                            ,url: '/api/events/getEventLogsList'
                            ,method: "post"
                            // ,cellMinWidth: 80
                            ,where: {"eid":data.id}
                            ,cols: [[
                                {type: "numbers", width: 70, align: "center", fixed: "left", field: 'id', title:"序列", sort: true}
                                ,{width: 200, align: "center", field: 'id', title:"操作员", sort: true, templet: function(d){
                                    return d.user.username ? d.user.username : d.user.phone;
                                }}
                                ,{width: 100, align: "center", field: 'id', title:"状态", sort: true, templet: function (d) {
                                    if (d.status == 1) {
                                        return "通过";
                                    } else  {
                                        return  "驳回";
                                    }
                                }}
                                ,{width: 200, align: "center", field: 'remark', title:"备注", sort: true}
                                ,{width: 200, align: "center", field: 'create_time', title:"操作时间", sort: true}
                            ]]
                            , page: true
                            , limit: 15
                            , limits: [10, 15, 20, 30, 40, 50, 100]
                            , text: {
                                none: ' 0 事件记录'
                            }
                        });



                    });

                }
            });

        }
    });



    exports("eventlog", {});
});