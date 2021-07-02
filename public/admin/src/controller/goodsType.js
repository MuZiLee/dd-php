layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("goodsType");
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
        elem: "#LAY-goodsType-list"
        , url: "/api/shop/category"
        , method: "post"
        , toolbar: "#Lay-goodsType-list-toolbar"
        , cols: [[
            {type: "numbers", align: "center", title:"序号", fixed: "left"}
            , {width: 100, align: 'center', title: 'ID', templet: "#idTpl"}
            , {width: 100, align: 'center', title: '类别', sort: true, templet: "#itemTpl"}
            , {width: 100, align: 'center', title: '图标', templet: "#imgTpl"}
            , {align: 'center', title: '名称', sort: true, templet: "#titleTpl"}
            , {title: "操作", width: 100, align: "center", fixed: "right", toolbar: "#LAY-goodsType-list-tool-tages"}
        ]]
        , cellMinWidth: 100
        ,height: 'full-150'
        , page: true
        , defaultToolbar: []
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个商品类别"
        }
    });

    table.on("tool(LAY-goodsType-list)", function(obj) {
        var data = obj.data;

        if(obj.event === "del") {
            admin.req({
                url: '/api/shop/del'
                ,type: "post"
                ,data: data
                ,success: function(res) {
                    if(res.code > 0) {
                        return layer.msg("删除失败");
                    }
                    obj.del();
                    layer.closeAll();
                    layer.msg("删除成功");
                }
            });
        } else {

        }
    });

    table.on("toolbar(LAY-goodsType-list)", function(obj) {

        admin.popup({
            title: '添加类别'
            , area: ['50%', '90%']
            , id: 'LAY-goodsType-list-add'
            , success: function (layero, index) {

                view(this.id).render('shop/add').done(function () {
                    console.log("view done");
                });
            }
            ,end: function(index, layero){
                table.reload('LAY-goodsType-list');
                return false;
            }
        });
    });



    // form.render(null, 'LAY-XXXXXX-form-list');
    // form.on('submit(LAY-XXXXXX-form-list-event-XXX)', function(data){
    //     var field = data.field;
    //
    //     layer.msg("LAY-XXXXXX-form-list-event-XXX");
    // });
    // form.on("submit(LAY-XXXXXX-form-list-event-XXX)", function(data) {
    //
    // });
    // form.on("submit(LAY-XXXXXX-form-list-event-XXX)", function(data) {
    //
    // });
    //
    // function XXXXXXPOP({success: success}) {
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
    //
    // /**
    //  * 发送一个请求
    //  * @param url
    //  * @param data
    //  * @param success
    //  * @constructor
    //  */
    // function XXXXXXreqest({url, data, success}) {
    //     admin.req({
    //         url: url
    //         , type: "post"
    //         , data: data
    //         , success: success
    //     });
    // }
    //
    //
    exports("goodsType", {});
});