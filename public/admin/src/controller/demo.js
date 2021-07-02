layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("XXXXXX");
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
        elem: "#LAY-XXXXXX-list"
        , url: url
        , method: "post"
        , where: data
        , toolbar: "#Lay-XXXXXX-list-toolbar"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", align: "center", fixed: "left", sort: true}
            , {field: 'logo', width: 100, align: 'center', title: 'LOGO', sort: true, templet: "#imgTpl"}
            , {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#LAY-XXXXXX-list-tool"}
        ]]
        // , cellMinWidth: 100
        , defaultToolbar: []
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: text
        }
    });

    table.on("tool(LAY-XXXXXX-list)", function(obj) {
        if(obj.event === "XXXXXX") {

        } else {

        }
    });

    table.on("toolbar(LAY-XXXXXX-list)", function(obj) {
        if(obj.event === "XXXXXX") {

        } else {

        }
    });
    form.render(null, 'LAY-XXXXXX-form-list');
    form.on('submit(LAY-XXXXXX-form-list-event-XXX)', function(data){
        var field = data.field;

        layer.msg("LAY-XXXXXX-form-list-event-XXX");
    });
    form.on("submit(LAY-XXXXXX-form-list-event-XXX)", function(data) {

    });
    form.on("submit(LAY-XXXXXX-form-list-event-XXX)", function(data) {

    });

    function XXXXXXPOP({success: success}) {
        layer.prompt({
            formType: 1
            , title: "敏感操作，请验证口令"
        }, function(value, index) {
            layer.close(index);
            if(hex_md5(value) != layui.data("layuiAdmin").password) {
                layer.msg("口令不正确");
            } else {

                success();
            }
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


    var init = function() {

    };

    var events = {
        adList: function() {
            return "event1";
        },
        event2: function() {
            return "event2";
        }
    };

    var objs = {
        init: function() {
            return [1, 2, 3, 4, 5, 6, 7];
        },
        events: adList
    };
    exports("XXXXXX", objs);
});