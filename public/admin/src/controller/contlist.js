/**

 @Name：layuiAdmin 内容系统
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */


layui.define(['table', 'form', 'layer'], function (exports) {
    var $ = layui.$
        , admin = layui.admin
        , view = layui.view
        , table = layui.table
        , form = layui.form
        , layer = layui.layer;
    console.log("contlist");
    //商品列表
    table.render({
        elem: '#LAY-app-content-list'
        , url: '/api/shop/productslist'
        , cols: [[

            {type: 'menubar', field: 'id', width: 80, fixed: "left", title: 'ID'}
            , {field: 'type', width: 100, title: '商品类别', templet: function (d) {
                return d.stype.name;
            }}
            , {field: 'name', width: 150, title: '商品名称'}
            , {field: 'text', width: 600, title: '商品介绍'}
            , {field: 'images', width: 90, align: 'center', title: '商品图片', templet: function (d) {
                return '<button class="layui-btn layui-btn-xs" lay-event="imagesTpl">查看</button>';
            }}
            , {field: 'user', width: 100, title: '商家', templet: function (d) {
                console.log(d);
                return d.user.username ? d.user.username : "";
            }}
            , {field: 'text', width: 120, align: 'center', title: 'Banner', sort: true, templet: function (d) {
                if (d.type) {
                    return "是";
                } else  {
                    return "否";
                }
            }}
            , {field: 'create_time', width: 180, title: '上传时间'}
            , {field: 'status', width: 150, title: '商品状态', fixed: 'right', templet: '#buttonTpl', align: 'center'}
            // , {title: '操作', align: 'center', width: 110, fixed: 'right', toolbar: '#table-content-list'}
        ]]
        , height: 'full-150'
        , page: true
        , limit: 10
        , limits: [10, 15, 20, 25, 30]
        , text: {
            none: "0个商品"
        }
    });

    // 监听工具 商品列表
    table.on('tool(LAY-app-content-list)', function (obj) {

        var data = obj.data;
        console.log(data);
        if (obj.event === 'del') {
            layer.confirm('确定删除此条评论？', function (index) {
                obj.del();
                layer.close(index);
            });
        }
        if (obj.event === 'imagesTpl') {
            console.log(data);
            var images = Array();
            for(i = 0; i < data.images.length; i++) {
                images.push({"src": data.images[i]});
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

        if (obj.event === 'push') {
            admin.req({
                url: '/api/shop/push'
                , type: "post"
                , headers: {
                    token: layui.data('layuiAdmin').token
                }
                , data: data
                , success: function (res) {
                    if (res.code == 0) {
                        table.reload('LAY-app-content-list');
                    }
                    layer.closeAll();
                }
            });
        }
        if (obj.event === 'set') {

            admin.popup({
                title: '设置商品'
                , area: ['600px', '600px']
                , id: 'LAY-popup-content-comm'
                , success: function (layero, index) {
                    view(this.id).render('BusinessDepartment/Shop/position', data).done(function () {
                        // form.render(null, 'layuiadmin-form-comment');

                        form.render('radio');
                        form.render('checkbox');
                        admin.req({
                            url: '/api/shop/categorylist'
                            ,type: 'post'
                            ,data: {page:1, limit:1000}
                            ,success: function(res) {

                                if (res.code == 0) {
                                    layui.each(res.data, function (index, item) {
                                        // console.log(item);
                                        var option = new Option(item.name, item.id);
                                        if (data.tid == item.id) {
                                            option.setAttribute("selected", true);
                                        }
                                        $('#tid').append(option);
                                    });
                                    form.render(null, 'shop-list-set-list');

                                    form.render('select', 'shop-list-set-list');
                                }
                            }
                        });


                    });
                }
            });
        }
    });
    //监听指定开关
    form.on('switch(topTpl)', function(data){
        console.log(data.elem); //得到select原始DOM对象
        console.log(data.value); //得到被选中的值
        console.log(data.othis); //得到美化后的DOM对象

        // admin.req({
        //     url: '/api/shop/setProductsPosition'
        //     , type: "post"
        //     , headers: {
        //         token: layui.data('layuiAdmin').token
        //     }
        //     , data: data
        //     , success: function (res) {
        //         if (res.code == 0) {
        //             table.reload('LAY-app-content-list');
        //             layer.tips('温馨提示：设置已生产，在App查看效果', data.othis);
        //         }
        //         layer.closeAll();
        //     }
        // });
    });


    // 订单列表
    table.render({
        elem: "#LAY-app-order-list"
        , url: '/api/shop/orderlist'
        , cols: [[
            {type: 'menubar', field: 'id', fixed: "left", title: 'ID'}
            , {field: 'label', width: 100, title: '商品类别', templet: function (d) {
                return d.order.stype.name;
            }}
            , {field: 'title', width: 180, title: '商品名称', templet: function (d) {
                return d.order.name;
            }}
            // , {field: 'images', width: 90, align: 'center', title: '商品图片', templet: function (d) {
            //         return '<button class="layui-btn layui-btn-xs" lay-event="imagesTpl">查看</button>';
            //     }}
            , {field: 'author', width: 100, title: '商家', templet: function (d) {
                return d.euser.username;
            }}
            , {field: 'author', width: 120, title: '商家电话', templet: function (d) {
                return d.euser.phone;
            }}
            , {field: 'author', width: 100,title: '买家', templet: function (d) {
                return d.user.username;
            }}
            , {field: 'author', width: 120, title: '买家电话', templet: function (d) {
                    return d.user.phone;
            }}
            , {field: 'create_time', width: 170, title: '下单时间'}
            , {
                field: 'status', width: 100, title: '订单状态', fixed: "right", align: 'center', templet: function (d) {
                    if (d.status == 0) {
                        return  '<span class="layui-badge layui-bg-green">未发货</span>'
                    } else if (d.status == 1) {
                        return '<span class="layui-badge layui-bg-orange">已发货</span>';
                    } else if (d.status == 2) {
                        return '<span class="layui-badge layui-bg-cyan">已签收</span>';
                    } else if (d.status == 3) {
                        return '<span class="layui-badge layui-bg-blue">已完成</span>'
                    } else {
                        return '<span class="layui-badge layui-bg-gray">已关闭</span>';
                    }
                }
            }

        ]]
        , height: 'full-150'
        , page: true
        , limit: 10
        , limits: [10, 15, 20, 25, 30]
        , text: {
            none: "0个订单"
        }
    });
    table.on('tool(LAY-app-order-list)', function (obj) {
        if (obj.event === 'imagesTpl') {
            console.log(data);
            var images = Array();
            for(i = 0; i < data.images.length; i++) {
                images.push({"src": data.images[i]});
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

    // 商品类别
    table.render({
        elem: '#LAY-app-content-tags'
        , url: '/api/shop/categorylist'
        , cols: [[
            {type: 'numbers', title: "序号", fixed: 'left'}
            , {field: 'id', width: 100, title: 'ID', sort: true}
            , {field: 'image', title: '图片', width: 90, templet: "#imgTpl"}
            , {field: 'name', title: '分类名', minWidth: 100}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#layuiadmin-app-cont-tagsbar'}
        ]]
        , height: 'full-200'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个"
        }
    });

    //监听工具条
    table.on('tool(LAY-app-content-tags)', function (obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.confirm('确定删除此分类？', function (index) {

                admin.req({
                    url: "/api/shop/delProductsType"
                    , type: "post"
                    , data: data
                    , headers: {
                        token: layui.data('layuiAdmin').token
                    }
                    , success(res) {
                        if (res.code == 0) {
                            obj.del();
                            layer.close(index);
                        }
                    }
                });


            });
        } else if (obj.event === 'edit') {
            admin.popup({
                title: '编辑分类'
                , area: ['450px', '450px']
                , id: 'LAY-popup-content-tags'
                , success: function (layero, index) {
                    view(this.id).render('BusinessDepartment/Shop/tagsform', data).done(function () {
                        form.render(null, 'layuiadmin-form-tags');
                    });
                }
            });
        }
    });




    exports('contlist', {})
});