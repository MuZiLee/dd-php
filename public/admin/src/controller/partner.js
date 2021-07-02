        /**
 * 合伙人管理
 */
layui.define(["table", "admin", "table", "form", "view", "element"], function(exports) {
    console.log("partner");

    var table = layui.table;
    var admin = layui.admin;
    var form = layui.form;
    var view = layui.view;
    var element = layui.element;


    var type = 1;


    // ,
    var tables = [
        "#LAY-partner-pg-list",
        "#LAY-partner-ag-list",
        "#LAY-partner-dag-list",
        "#LAY-partner-eg-list"
    ];
    var nones = [
        "0 个初级合伙人",
        "0 个高级合伙人",
        "0 个准高合伙人",
        "0 个战略联盟合伙人"
    ];
    var cols = [
        {type: "numbers", width: 50, align: "center", title: "序号", fixed: "left"}
        , {width: 50, align: "center", title: "ID", width: 80, templet: "#idTpl"}
        , {width: 100, field: "avatar", align: "center", title: "头像", templet: "#imgTpl"}
        , {width: 100, align: "center", title: "用户名", templet: "#usernameTpl"}
        , {width: 170, align: "center", title: "手机号", templet: "#phoneTpl"}
        , {width: 120, align: "center", title: "绑定数量", sort: true, templet: "#groeTpl"}
        , {width: 120, align: "center", title: "上级", sort: true, templet: "#partnerNameTpl"}
        , {width: 150, align: "center", title: "所属战略联盟", sort: true, templet: "#enterpriseTpl"}
        // , {width: 120, align: "center", title: "初级分红", sort: true, templet: "#pgDividendTpl"}
        // , {width: 120, align: "center", title: "高级分红", sort: true, templet: "#agDividendTpl"}
        // , {width: 120, align: "center", title: "战略分红", sort: true, templet: "#egDividendTpl"}
        // , {width: 120, align: "center", title: "蛋蛋分红", sort: true, templet: "#dgDividendTpl"}
        // , {width: 120, align: "center", title: "总分分红", sort: true, templet: "#totalDividendTpl"}
        // , {width: 120, align: "center", title: "历史分红", sort: true, templet: "#logDividendTpl"}
        , {field: "create_time", width: 200, align: "center", title: "注册时间", templet: "#createTimeTpl"}
    ];

    layui.each(tables, function(index, item) {

        table.render({
            elem: item
            , url: "/api/partner/getList" //url
            , method: "post"
            , where: {type: index + 1}
            , page: true
            , height: "full-200"
            , limit: 15
            , limits: [10, 15, 20, 30, 40, 50, 100]
            , cols: [cols]
            , text: {
                none: nones[index]
            }
        });
    });


    element.on("tab(partner-tabs-hash)", function(data) {
        console.log(this); //当前Tab标题所在的原始DOM元素
        console.log(data.index); //得到当前Tab的所在下标
        console.log(data.elem); //得到当前的Tab大容器

        var id = tables[data.index];

        if(id === tables[tables.length-1]) {
            // cols.push({title: '操作', width: 180, align: 'center', fixed: 'right', toolbar: "#LAY-partner-list-tool"});
        } else {
            if(cols.length > 17) {
                cols.pop();
            }
        }
        table.reload(
            id.substr(1)
            , {cols: [cols]}
        );
    });

    table.on("tool(LAY-partner-pg-list)", function(obj) {
        var enterprise = obj.data.partner.enterprise;
        if(obj.event === "logDividendEvent") { //初级合伙人历史分红
            // layer.msg("历史分红");
            admin.popup({
                title: "历史分红"
                , area: ["50%", "90%"]
                , id: "LAY-partner-pg-list-logDividendEvent"
                , success: function(layero, index) {
                    // console.log(data.id);
                    // console.log(JSON.stringify(obj.data));
                    var view = layui.view;
                    view(this.id).render("partner/logdividend", obj.data).done(function() {

                    });
                }
            });
        }
    });
    table.on("tool(LAY-partner-ag-list)", function(obj) {
        var enterprise = obj.data.partner.enterprise;
        if(obj.event === "logDividendEvent") {
            admin.popup({
                title: "历史分红"
                , area: ["50%", "90%"]
                , id: "LAY-partner-pg-list-logDividendEvent"
                , success: function(layero, index) {
                    // console.log(data.id);
                    // console.log(JSON.stringify(obj.data));
                    var view = layui.view;
                    view(this.id).render("partner/logdividend", obj.data).done(function() {

                    });
                }
            });
        }
    });
    table.on("tool(LAY-partner-dag-list)", function(obj) {
        var enterprise = obj.data.partner.enterprise;
        if(obj.event === "logDividendEvent") {
            admin.popup({
                title: "历史分红"
                , area: ["50%", "90%"]
                , id: "LAY-partner-pg-list-logDividendEvent"
                , success: function(layero, index) {
                    // console.log(data.id);
                    // console.log(JSON.stringify(obj.data));
                    var view = layui.view;
                    view(this.id).render("partner/logdividend", obj.data).done(function() {

                    });
                }
            });
        }
    });
    table.on("tool(LAY-partner-eg-list)", function(obj) {
        var enterprise = obj.data.partner.enterprise;
        if(obj.event === "logDividendEvent") {
            admin.popup({
                title: "历史分红"
                , area: ["50%", "90%"]
                , id: "LAY-partner-pg-list-logDividendEvent"
                , success: function(layero, index) {
                    // console.log(data.id);
                    // console.log(JSON.stringify(obj.data));
                    var view = layui.view;
                    view(this.id).render("partner/logdividend", obj.data).done(function() {

                    });
                }
            });
        }
    });


    form.render(null, "LAY-partner-formlist");
    //初级合伙人
    form.on("submit(pg)", function(data) {
        var field = data.field;

        console.log(JSON.stringify(data));
        type = 1;
        //执行table重载
        table.reload("LAY-partner-list", {
            where: {type: type}
        });
    });
    //高级合伙人
    form.on("submit(ag)", function(data) {
        var field = data.field;

        console.log(JSON.stringify(data));
        type = 2;
        //执行table重载
        table.reload("LAY-partner-list", {
            where: {type: type}
        });
    });
    //准高级合伙人
    form.on("submit(dag)", function(data) {
        var field = data.field;

        console.log(JSON.stringify(data));
        type = 3;
        //执行table重载
        table.reload("LAY-partner-list", {
            where: {type: type}
        });
    });
    //战略联盟
    form.on("submit(eg)", function(data) {
        var field = data.field;

        console.log(JSON.stringify(data));
        type = 4;
        //执行table重载
        table.reload("LAY-partner-list", {
            where: {type: type}
        });
    });


    var events = {
        event1: function() {
            return "event1";
        }
        , event2: function() {
            return "event2";
        }
        , partnerList: function() {


        }
    };

    var objs = {
        init: function() {
            return [1, 2, 3, 4, 5, 6, 7];
        },
        events: events
    };
    exports("partner", objs);
});