layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("ad");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;


    table.render({
        elem: "#LAY-startAd-list"
        , url: "/api/ad/getAdList"
        , method: "post"
        , where: {
            "type": 0
        }
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", align: "center", fixed: "left", sort: true}
            , {field: 'title', width: 100, align: 'center', title: '标题'}
            , {field: 'subtitle', width: 100, align: 'center', title: '子标题'}
            , {field: 'image', width: 100, align: 'center', title: '广告图', templet: "#imgTpl"}
            , {field: 'url', width: 200,align: 'center', title: '广告链接', templet: function (d) {
                    return '<a style="color: #0d8ddb" href="' + d.url + '" target="_blank">'+d.url+'</a>'
                }}
            , {field: 'create_time', width: 200, align: 'center', title: '创建时间'}
            , {title: "操作", width: 200, align: "center", fixed: "right", toolbar: "#LAY-startAd-list-tool-tages"}
        ]]
        ,height: 'full-200'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个启动广告"
        }
    });
    table.on('tool(LAY-startAd-list)', function(obj) {

        obj.data.type = "edit";
        obj.data.adType = "startAd";
        if(obj.event === "edit") {
            admin.popup({
                title: '编辑/查看启动广告'
                , area: ['90%', '90%']
                , id: 'LAY-startAd-form-add'
                , success: function (layero, index) {
                    view(this.id).render('ad/add', obj.data);
                }
            });
        } else if (obj.event === "del") {
            layer.prompt({
                formType: 1
                , title: "删除操作，请验证口令"
            }, function(value, index) {
                layer.close(index);
                if(hex_md5(value) != layui.data("layuiAdmin").password) {
                    layer.msg("口令不正确");
                } else {
                    admin.req({
                        url: '/api/ad/del'
                        ,type: "post"
                        ,data: {id:obj.data.id}
                        ,success: function(res) {
                            console.log(res);
                            layer.msg(res.msg);
                            obj.del();
                            layer.close(index);
                        }
                    });
                }
            });
        }
    });
    form.on('submit(LAY-startAd-form-submit-filter-add)', function(data){
        var field = data.field;
        field.adType = "startAd";
        admin.popup({
            title: '添加启动广告'
            , area: ['90%', '90%']
            , id: 'LAY-startAd-form-add'
            , success: function (layero, index) {
                view(this.id).render('ad/add', field);
            }
        });
    });















    table.render({
        elem: "#LAY-bannerAd-list"
        , url: "/api/ad/getAdList"
        , method: "post"
        , where: {
            "type": 1
        }
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", align: "center", fixed: "left", sort: true}
            , {field: 'title', width: 100, align: 'center', title: '标题'}
            , {field: 'image', width: 100, align: 'center', title: '广告图上', templet: "#imgTpl"}
            , {field: 'url', width: 200,align: 'center', title: '广告链接', templet: function (d) {
                    return '<a style="color: #0d8ddb" href="' + d.url + '" target="_blank">'+d.url+'</a>'
                }}
            , {field: 'create_time', width: 200, align: 'center', title: '创建时间'}
            , {title: "操作", width: 200, align: "center", fixed: "right", toolbar: "#LAY-bannerAd-list-tool-tages"}
        ]]
        ,height: 'full-200'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个banner广告"
        }
    });
    table.on('tool(LAY-bannerAd-list)', function(obj) {

        obj.data.type = "edit";
        obj.data.adType = "bannerAd";
        if(obj.event === "edit") {
            admin.popup({
                title: '编辑/查看Banner广告'
                , area: ['90%', '90%']
                , id: 'LAY-bannerAd-form-add'
                , success: function (layero, index) {
                    view(this.id).render('ad/add', obj.data);
                }
            });
        } else if (obj.event === "del") {
            layer.prompt({
                formType: 1
                , title: "删除操作，请验证口令"
            }, function(value, index) {
                layer.close(index);
                if(hex_md5(value) != layui.data("layuiAdmin").password) {
                    layer.msg("口令不正确");
                } else {
                    admin.req({
                        url: '/api/ad/del'
                        ,type: "post"
                        ,data: {id:obj.data.id}
                        ,success: function(res) {
                            console.log(res);
                            layer.msg(res.msg);
                            obj.del();
                            layer.close(index);
                        }
                    });
                }
            });
        }
    });
    form.on('submit(LAY-bannerAd-form-submit-filter-add)', function(data){
        var field = data.field;
        field.adType = "bannerAd";
        admin.popup({
            title: '添加Banner广告'
            , area: ['90%', '90%']
            , id: 'LAY-bannerAd-form-add'
            , success: function (layero, index) {
                view(this.id).render('ad/add', field);
            }
        });
    });










    table.render({
        elem: "#LAY-jobAd-list"
        , url: "/api/ad/getAdList"
        , method: "post"
        , where: {
            "type":2
        }
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: "numbers", align: "center", fixed: "left", sort: true}
            , {field: 'title', width: 100, align: 'center', title: '标题'}
            , {field: 'image', width: 100, align: 'center', title: '广告图上', templet: "#imgTpl"}
            , {field: 'url', width: 200,align: 'center', title: '广告链接', templet: function (d) {
                    return '<a style="color: #0d8ddb" href="' + d.url + '" target="_blank">'+d.url+'</a>'
                }}
            , {field: 'create_time', width: 200, align: 'center', title: '创建时间'}
            , {title: "操作", width: 200, align: "center", fixed: "right", toolbar: "#LAY-jobAd-list-tool-tages"}
        ]]
        ,height: 'full-200'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个职位广告"
        }
    });
    table.on('tool(LAY-jobAd-list)', function(obj) {

        obj.data.type = "edit";
        obj.data.adType = "jobAd";
        if(obj.event === "edit") {
            admin.popup({
                title: '编辑/查看职位广告'
                , area: ['90%', '90%']
                , id: 'LAY-jobAd-form-add'
                , success: function (layero, index) {
                    view(this.id).render('ad/add', obj.data);
                }
            });
        } else if (obj.event === "del") {
            layer.prompt({
                formType: 1
                , title: "删除操作，请验证口令"
            }, function(value, index) {
                layer.close(index);
                if(hex_md5(value) != layui.data("layuiAdmin").password) {
                    layer.msg("口令不正确");
                } else {
                    admin.req({
                        url: '/api/ad/del'
                        ,type: "post"
                        ,data: {id:obj.data.id}
                        ,success: function(res) {
                            console.log(res);
                            layer.msg(res.msg);
                            obj.del();
                            layer.close(index);
                        }
                    });
                }
            });
        }
    });
    form.on('submit(LAY-jobAd-form-submit-filter-add)', function(data){
        var field = data.field;
        field.adType = "jobAd";
        admin.popup({
            title: '添加职位广告'
            , area: ['90%', '90%']
            , id: 'LAY-jobAd-form-add'
            , success: function (layero, index) {
                view(this.id).render('ad/add', field);
            }
        });
    });




    var objs = {
        startAd: function() {

        },
        jobAd: function() {

        },
        bannerAd: function() {

        }
    };
    exports("ad", {});
});