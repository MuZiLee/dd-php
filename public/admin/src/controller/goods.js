layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("goods");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;
    var layer = layui.layer;

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
        elem: "#LAY-goods-list"
        , url: "/api/shop/goodsList"
        , method: "post"
        , toolbar: "#"
        , cols: [[
            {type: "checkbox", fixed: "left"}
            , {title: '状态', width: 80, align: 'center', fixed: "left", templet: "#statusTpl"}
            , {type: "numbers", title: "序号", align: "center"}
            , {title: '商品名称', width: 180, align: 'center', templet: "#titleTpl"}
            , {title: '价格', width: 100, align: 'center', templet: "#priceTpl"}
            , {title: '介绍', width: 100, align: 'center', templet: "#detailsTpl"}
            , {title: '总数量', width: 100, align: 'center', templet: "#countTpl"}
            , {title: '销售数量', width: 100, align: 'center', templet: "#marketTpl"}
            , {title: '图片', width: 100, align: 'center', templet: "#buttonTpl"}
            , {title: '商家', width: 100, align: 'center', sort: true, templet: "#partnerNameTpl"}
            , {title: '创建时间', width: 150, align: 'center', sort: true, templet: "#createTimeTpl"}
            , {title: '操作', width: 100, align: 'center', fixed: "right", sort: true, toolbar: "#LAY-goods-list-tool-tages"}
        ]]
        // , cellMinWidth: 100
        , defaultToolbar: []
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个商品"
        }
    });

    table.on("tool(LAY-goods-list)", function(obj) {
        var data = obj.data;
        console.log(data);
        console.log(obj.event);
        if(obj.event === "push") {
            // admin.req({
            //     url: "/api/shop/push"
            //     ,type: "post"
            //     ,data: data
            //     ,success: function(res) {
            //         layer.msg(res.msg);
            //         if(res.code > 0) {
            //             return;
            //         }
            //
            //         table.reload('LAY-goods-list');
            //     }
            // });

            admin.popup({
                title: '设置购优惠'
                , area: ['50%', '90%']
                , id: 'LAY-goods-push-form'
                , success: function (layero, index) {
                    console.log(data.id);
                    console.log(JSON.stringify(obj.data));
                    //var view = layui.view;
                    view(this.id).render('shop/discounts', obj.data).done(function () {

                    });
                }
            });

        } else if(obj.event === "soldout") {
            //下架

            layer.prompt({
                formType: 1
                ,title: '敏感操作，请验证口令'
            }, function(value, index){
                layer.close(index);
                if (hex_md5(value) != layui.data('layuiAdmin').password)  {
                    layer.msg("口令不正确");
                } else  {
                    layer.confirm('你需要如何处理？', {
                        btn: ['下架','退出'] //按钮
                    }, function() {
                        admin.req({
                            url: "/api/shop/soldout"
                            ,type: "post"
                            ,data: data
                            ,success: function(res) {
                                layer.msg(res.msg);
                                if(res.code > 0) {
                                    return;
                                }
                                table.reload('LAY-goods-list');
                            }
                        });

                    });
                }

            });



        } else if (obj.event === "detailsTpl") {

            layer.confirm(data.details, {
                btn: ['返回'] //按钮
            }, function() {
                layer.closeAll();
            });

        } else if (obj.event === "imagesTpl") {
            console.log(data);
            var images = Array();
            for(i = 0; i < data.images.length; i++) {
                images.push({"src": data.images[i].url});
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
    });
    //
    // table.on("toolbar(LAY-goods-list)", function(obj) {
    //     if(obj.event === "goods") {
    //
    //     } else {
    //
    //     }
    // });
    // form.render(null, 'LAY-goods-form-list');
    // form.on('submit(LAY-goods-form-list-event-XXX)', function(data){
    //     var field = data.field;
    //
    //     layer.msg("LAY-goods-form-list-event-XXX");
    // });
    // form.on("submit(LAY-goods-form-list-event-XXX)", function(data) {
    //
    // });
    // form.on("submit(LAY-goods-form-list-event-XXX)", function(data) {
    //
    // });




    exports("goods", {});
});