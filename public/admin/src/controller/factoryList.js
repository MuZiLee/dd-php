layui.define(["table", "admin", "view", "datarender"], function(exports) {

    var admin = layui.admin;
    var view = layui.view;
    var table = layui.table;
    var datarender = layui.datarender;

    // ---------------------------------------- 工厂table
    table.render({
        elem: "#LAY-factory-list"
        , url: "/api/factory/getlist" //模拟接口
        , type: "post"
        , toolbar: "#Lay-factory-list-toolbar"
        , cols: [[
            {type: "numbers", align: "center", title:"序号", fixed: "left"}
            , {width: 90, align: "center", title: "状态", fixed: "left", sort: true, templet: "#statusTpl"}

            // 基本信息
            , {field: "id", width: 70, align: "center", title: "ID"}
            , {width: 100, align: "center", title: "LOGO", templet: "#logoTpl"}
            , {width: 100, align: "center", title: "工厂环境", templet: "#imagesTpl"}
            , {width: 200, align: "center", title: "工厂名称", templet: "#factoryNameTpl"}
            , {width: 100, align: 'center', title: '省份', templet: "#provinceTpl"}
            , {width: 100, align: 'center', title: '城市', templet: "#cityTpl"}
            , {width: 100, align: 'center', title: '县/区/镇', templet: "#districtTpl"}
            , {width: 250, align: 'center', title: '地址', templet: "#addresTpl"}

            , {width: 180, align: 'center', title: '合作方式', templet: "#cooperation_modeTpl"}
            // , {width: 180, align: 'center', title: '工资发放方式', templet: "#salary_payment_methodTpl"}
            // , {width: 180, align: 'center', title: '签单价', templet: "#signed_unit_priceTpl"}
            // , {width: 180, align: 'center', title: '员工单价', templet: "#employee_unit_priceTpl"}
            // , {width: 180, align: 'center', title: '老师提成', templet: "#commission_for_teacherTpl"}
            // , {width: 180, align: 'center', title: '业务员提成', templet: "#commission_for_salesmanTpl"}
            // , {width: 180, align: 'center', title: '结算日期', templet: "#settlement_dateTpl"}
            // , {width: 180, align: 'center', title: '合同期限', templet: "#startTimeTpl"}

            // , {width: 80, align: 'center', title: '税费', templet: "#income_taxTpl"}
            // , {width: 80, align: 'center', title: '保险费', templet: "#iinsurance_premiumTpl"}


            // , {width: 180, align: 'center', title: '接待人', templet: "#receptionistTpl"}
            // , {width: 180, align: 'center', title: '宿舍管理员', templet: "#houseparentTpl"}
            // , {width: 180, align: 'center', title: '跟进人', templet: "#follow_up_personTpl"}
            // , {width: 180, align: 'center', title: '录入员', templet: "#keyboarderTpl"}

            , {width: 200, align: "center", title: "创建时间", templet: "#create_timeTpl"}
            , {title: "操作", width: 90, align: "center", fixed: "right", toolbar: "#LAY-factory-list-toolbar-tages"}
        ]]
        , height: "full-150"
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0 个工厂"
        }
    });

    //监听工具条
    table.on("tool(LAY-factory-list)", function(obj) {
        var data = obj.data;
        console.log(data);
        if(obj.event === "look") {

            layer.photos({
                photos: {
                    "title": "查看LOGO" //相册标题
                    , "data": [{
                        "src": data.logo //原图地址
                    }]
                }
                , shade: 0.01
                , closeBtn: 1
                , anim: 5
            });

        }

        if(obj.event === "seeimages") {
            console.log(data);
            var images = Array();
            for(i = 0; i < data.images.length; i++) {
                images.push({"src": data.images[i].url});
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

        if(obj.event === "tax-edit") {// 编辑税金


            layer.prompt({
                formType: 0
                , title: "编辑税金"
                , value: data.signingInformation.income_tax
            }, function(value, index) {
                var signingInformation = data.signingInformation;
                signingInformation.income_tax = value;
                admin.req({
                    url: "/api/factory/addTax"
                    , data: signingInformation
                    , success: function(res) {
                        layer.closeAll();
                        layer.msg(res.msg);
                        if(res.code == 0) {
                            table.reload("LAY-factory-list", {url: "/api/factory/getlist"});
                        }
                    }
                });
            });
        }

        // 添加税金
        if(obj.event === "tax-add") {
            layer.prompt({
                formType: 0
                , title: "添加税金"
                , value: "0.0元"
            }, function(value, index) {
                var signingInformation = data.signingInformation;
                signingInformation.income_tax = value;
                admin.req({
                    url: "/api/factory/addTax"
                    , data: signingInformation
                    , success: function(res) {
                        layer.closeAll();
                        layer.msg(res.msg);
                        if(res.code == 0) {
                            obj.update({
                                tax: res.tax
                            });
                            table.reload("LAY-factory-list");
                        }
                    }
                });
            });
        }
        // 编辑保险
        if(obj.event === "insurance-edit") {

            layer.prompt({
                formType: 0
                , title: "编辑保险"
                , value: data.signingInformation.insurance_premium
            }, function(value, index) {
                var signingInformation = data.signingInformation;
                signingInformation.insurance_premium = value;
                admin.req({
                    url: "/api/factory/addTnsurance"
                    , data: signingInformation
                    , success: function(res) {
                        layer.closeAll();
                        layer.msg(res.msg);
                        if(res.code == 0) {
                            obj.update({
                                tax: res.tax
                            });
                            table.reload("LAY-factory-list");
                        }
                    }
                });
            });
        }
        // 添加保险
        if(obj.event === "insurance-add") {


            layer.prompt({
                formType: 0
                , title: "添加保险"
                , value: "0.0元"
            }, function(value, index) {
                var signingInformation = data.signingInformation;
                signingInformation.insurance_premium = value;
                admin.req({
                    url: "/api/factory/addTnsurance"
                    , data: signingInformation
                    , success: function(res) {
                        if(res.code == 0) {
                            table.reload("LAY-factory-list", {url: "/api/factory/getlist"});
                        }
                        layer.closeAll();
                        layer.msg(res.msg);
                    }
                });
            });

        }

        //查看/修改
        if(obj.event === "lookinfo") {

            // popup
            admin.popup({
                title: "工厂信息"
                , area: ["90%", "90%"]
                , id: "查看工厂信息"
                , success: function(layero, index) {
                    // console.log(data.id);
                    // console.log(JSON.stringify(obj.data));
                    view(this.id).render("BusinessDepartment/Factory/lookinfo", data).done(() => datarender.events.renderLookInfo(data));
                }
            });

        }
    });

    //头工具栏事件
    table.on("toolbar(LAY-factory-list)", function(obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        var data = checkStatus.data;


        if(obj.event === "add") {
            admin.popup({
                id: "LAY-popup-factorys-allot-teacher"
                // id: new Date().getTime()
                , title: "添加工厂"
                , area: ["95%", "95%"]
                , success: function(layero, index) {
                    view(this.id).render("BusinessDepartment/Factory/add").done(function() {

                    });
                }
            });
            return;
        }

        console.log(checkStatus.data);
        if(checkStatus.data.length < 1) {
            layer.msg("未选工厂");
            return;
        }




    });


    exports("factorys", {})
});