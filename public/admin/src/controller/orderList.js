layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("orderList");
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
        elem: "#LAY-order-list"
        , url: "/api/shop/orderList"
        , method: "post"
        , toolbar: "#"
        , cols: [[
            {type: "checkbox", fixed: "left"}
            , {title: '状态', width: 80, align: 'center', fixed: "left", templet: "#statusTpl"}
            , {type: "numbers", title: "序号", align: "center"}
            , {title: '商品名称', width: 180, align: 'center', templet: "#titleTpl"}
            , {title: '价格', width: 100, align: 'center', templet: "#priceTpl"}
            , {title: '介绍', width: 100, align: 'center', templet: "#detailsTpl"}
            , {title: '购买数量', width: 100, align: 'center', templet: "#countTpl"}
            , {title: '图片', width: 100, align: 'center', templet: "#buttonTpl"}
            , {title: '商家', width: 100, align: 'center', sort: true, templet: "#partnerNameTpl"}
            , {title: '购买时间', width: 150, align: 'center', sort: true, templet: "#createTimeTpl"}
            // , {title: '操作', width: 100, align: 'center', fixed: "right", sort: true, toolbar: "#LAY-order-list-tool-tages"}
        ]]
        // , cellMinWidth: 100
        , defaultToolbar: []
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个订单"
        }
    });

    table.on("tool(LAY-order-list)", function(obj) {
        var data = obj.data;
        console.log(data);
        console.log(obj.event);

        if (obj.event === "detailsTpl") {

            layer.confirm(data.goods.details, {
                btn: ['返回'] //按钮
            }, function() {
                layer.closeAll();
            });

        } else if (obj.event === "imagesTpl") {
            console.log(data.goods);
            var images = Array();
            layui.each(data.goods.images, function(index,item) {
                images.push({"src": data.goods.images[index].url});
            });


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





    exports("orderList", {});
});