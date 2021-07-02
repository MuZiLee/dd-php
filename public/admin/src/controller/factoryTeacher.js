layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("factoryTeacher");
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
        elem: "#LAY-factoryAudit-list"
        , url: "/api/factory/getInputEvent"
        , method: "post"
        , toolbar: "#Lay-factoryAudit-list-toolbar"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            ,{type: "numbers", align: "center", title:"序号", fixed: "left"}
            // , {width: 120, align: "center", title: "状态", fixed: "left", templet: function (d) {
            //     var logs = d.factory.logs.pop();
            //     console.log(logs);
            //     if (!logs) {
            //         return '<span class="layui-badge layui-bg-orange">待审核</span>';
            //     } else if (logs.status == 1){
            //         return '<span class="layui-badge layui-bg-blue">已通过</span>';
            //     } else  {
            //         return '<span class="layui-badge layui-bg-black">已下架或驳回</span>';
            //     }
            // }}

            // 基本信息
            , {field: "id", width: 80, align: "center", title: "ID"}
            , {width: 100, align: "center", title: "LOGO", templet: "#logoTpl"}
            , {width: 100, width: 120, align: "center", title: "驻场老师人数", templet: function (d) {
                console.log(d.factory.teacher);
                return d.factory.teacher.length+"人";
            }}
            , {width: 100, align: "center", title: "工厂环境", templet: "#imagesTpl"}
            , {width: 200, align: "center", title: "工厂名称", templet: "#factoryNameTpl"}
            , {width: 90, align: 'center', title: '省份', templet: "#provinceTpl"}
            , {width: 90, align: 'center', title: '城市', templet: "#cityTpl"}
            , {width: 100, align: 'center', title: '县/区/镇', templet: "#districtTpl"}
            , {width: 250, align: 'center', title: '地址', templet: "#addresTpl"}

            , {width: 100, align: 'center', title: '合作方式', templet: "#cooperation_modeTpl"}
            , {width: 120, align: 'center', title: '工资发放方式', templet: "#salary_payment_methodTpl"}

            , {width: 90, align: 'center', title: '接待人', templet: "#receptionistTpl"}
            , {width: 90, align: 'center', title: '宿管', templet: "#houseparentTpl"}
            , {width: 90, align: 'center', title: '跟进人', templet: "#follow_up_personTpl"}
            , {width: 90, align: 'center', title: '录入员', templet: "#keyboarderTpl"}

            , {width: 200, align: "center", title: "创建时间", templet: "#create_timeTpl"}
            , {title: "操作", width: 100, align: "center", fixed: "right", toolbar: "#LAY-factoryAudit-list-tool-tages"}
        ]]
        // , cellMinWidth: 100
        , defaultToolbar: []
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0工厂录入事件"
        }
    });

    table.on("tool(LAY-factoryAudit-list)", function(obj) {

        // console.log(obj.data);
        var data = obj.data;


        if (obj.event === "look"){
            admin.popup({
                title: data.factory.factory_name
                , area: ['90%', '90%']
                , id: 'LAY-filter-factory-look-form'
                , success: function (layero, index) {
                    // console.log(data.factory.id);
                    // console.log(JSON.stringify(data.factory));
                    view(this.id).render("factory/look", data.factory).done(function() {

                    });
                }
            });
        }

        if(obj.event === "seeimages") {
            console.log(data);
            var images = Array();
            for(i = 0; i < data.factory.images.length; i++) {
                images.push({"src": data.factory.images[i].url});
            }

            layer.photos({
                photos: {
                    "title": "查看LOGO" //相册标题
                    , "data": images
                }
                , shade: 0.01
                , closeBtn: 1
                , anim: 5
            });
        }

    });

    table.on("toolbar(LAY-factoryAudit-list)", function(obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        var data = checkStatus.data;

        if(data.length < 1) {
            layer.msg("未选中工厂");
            return;
        }

        var factory = data[0];

        console.log(event);


        /// 驻场老师管理
        if(obj.event === "teacher") {
            admin.popup({
                id: new Date().getTime()
                , title: "分配驻场老师"
                , area: ["95%", "95%"]
                , success: function() {
                    // layui.setter.setData({type: obj.event, data: data.fid});
                    layui.setter.setData({type: obj.event, data: factory});
                    view(this.id).render("ResidentManager/factoryTeacher", factory).done(function() {

                    });

                }
            });
        }

    });


    exports("factoryTeacher", {});
});