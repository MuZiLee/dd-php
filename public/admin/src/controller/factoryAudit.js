layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function(exports) {
    console.log("factoryAudit");
    var form = layui.form;
    var table = layui.table;
    var admin = layui.admin;
    var view = layui.view;



    table.render({
        elem: "#LAY-factoryAudit-list"
        , url: "/api/factory/getInputEvent"
        , method: "post"
        , toolbar: "#Lay-factoryAudit-list-toolbar"
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            ,{type: "numbers", align: "center", title:"序号", fixed: "left"}
            , {field: "id", align: "center", title: "ID"}
            , {width: 80, align: "center", title: "状态",  templet: function (d) {
                var logs = d.logs.pop();
                // console.log(logs);
                if (!logs) {
                    return '<span class="layui-badge layui-bg-orange">待审核</span>';
                } else if (logs.status == 1){
                    return '<span class="layui-badge layui-bg-blue">已通过</span>';
                } else  {
                    return '<span class="layui-badge layui-bg-black">已下架或驳回</span>';
                }

            }}

            // 基本信息
            , {width: 100, align: "center", title: "LOGO", templet: "#logoTpl"}
            , {width: 100, align: "center", title: "工厂环境", templet: "#imagesTpl"}
            , {width: 200, align: "center", title: "工厂名称", templet: "#factoryNameTpl"}
            , {width: 100, align: 'center', title: '合作方式', templet: "#cooperation_modeTpl"}
            , {width: 120, align: 'center', title: '工资发放方式', templet: "#salary_payment_methodTpl"}

            , {width: 90, align: 'center', title: '税费', templet: "#income_taxTpl"}
            , {width: 90, align: 'center', title: '保险费', templet: "#iinsurance_premiumTpl"}
            , {width: 90, align: 'center', title: '管理费', templet: "#managerCostTpl"}

            , {width: 90, align: 'center', title: '签单价', templet: "#signed_unit_priceTpl"}
            , {width: 100, align: 'center', title: '员工单价', templet: "#employee_unit_priceTpl"}
            , {width: 100, align: 'center', title: '老师提成', templet: "#commission_for_teacherTpl"}
            , {width: 100, align: 'center', title: '业务员提成', templet: "#commission_for_salesmanTpl"}

            , {width: 90, align: 'center', title: '跟进人', templet: "#follow_up_personTpl"}
            , {width: 90, align: 'center', title: '录入员', templet: "#keyboarderTpl"}

            , {width: 200, align: "center", title: "创建时间", templet: "#create_timeTpl"}
            , {title: "操作", width: 100, align: "center", fixed: "right", toolbar: "#LAY-factoryAudit-list-tool-tages"}
        ]]
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0工厂录入事件"
        }
    });

    table.on("tool(LAY-factoryAudit-list)", function(obj) {

        if (obj.event === "look"){
            admin.popup({
                title: obj.data.factory.factory_name
                , area: ['90%', '90%']
                , id: 'LAY-filter-factory-look-form'
                , success: function (layero, index) {
                    // console.log(data.factory.id);
                    // console.log(JSON.stringify(data.factory));
                    view(this.id).render("factory/look", obj.data.factory).done(function() {

                    });
                }
            });
        }

        if(obj.event === "seeimages") {

            var images = Array();
            for(i = 0; i < obj.data.factory.images.length; i++) {
                images.push({"src": obj.data.factory.images[i].url});
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


        var signingInformation = obj.data.factory.signingInformation;
        // 税费
        if(obj.event === "income_taxTpl") {
            layer.prompt({
                formType: 0
                , title: "编辑税费"
                , value: signingInformation.income_tax
            }, function(value, index) {

                signingInformation.income_tax = value;
                if (!value) {
                    return;
                }
                setSigningInfo(signingInformation);
            });
        }
        // 保险费
        if(obj.event === "iinsurance_premiumTpl") {
            layer.prompt({
                formType: 0
                , title: "编辑保险费"
                , value: signingInformation.insurance_premium
            }, function(value, index) {

                signingInformation.insurance_premium = value;
                if (!value) {
                    return;
                }
                setSigningInfo(signingInformation)
            });
        }
        // 管理费
        if(obj.event === "managerCostTpl") {
            layer.prompt({
                formType: 0
                , title: "编辑管理费"
                , value: signingInformation.management_expense
            }, function(value, index) {
                signingInformation.management_expense = value;
                if (!value) {
                    return;
                }
                if (value >= signingInformation.signed_unit_price) {
                    layer.msg("管理费不得大于签单价");
                    return;
                }

                setSigningInfo(signingInformation);
            });
        }
        // 合作方式
        if(obj.event === "cooperation_modeTpl") {
            //cooperation_mode
            // layer.prompt({
            //     formType: 2
            //     , title: "编辑合作方式"
            // }, function(value, index) {
            // //     signingInformation.management_expense = value;
            // //     if (!value) {
            // //         return;
            // //     }
            // //     setSigningInfo(signingInformation);
            // });

            admin.popup({
                id: new Date().getTime()
                , title: "编辑合作方式"
                , area: ["50%", "50%"]
                , success: function() {
                    view(this.id).render("FinanceDepartment/setSigningInfo", signingInformation).done(function() {
                        form.render(null, 'cooperation_mode-formlist');

                        //监听提交
                        form.on('submit(cooperation_mode-submit)', function(data){
                            var field = data.field; //获取提交的字段
                            console.log(data.field);
                            signingInformation.cooperation_mode = field.cooperation_mode;
                            setSigningInfo(signingInformation);
                        });
                    });


                }
            });

        }
        // 工资发放方式
        if(obj.event === "salary_payment_methodTpl") {

            admin.popup({
                id: new Date().getTime()
                , title: "编辑合作方式"
                , area: ["50%", "50%"]
                , success: function() {
                    view(this.id).render("FinanceDepartment/salaryPpaymentMethod", signingInformation).done(function() {
                        form.render(null, 'salaryPpaymentMethod-formlist');

                        //监听提交
                        form.on('submit(salaryPpaymentMethod-submit)', function(data){
                            var field = data.field; //获取提交的字段
                            console.log(data.field);
                            signingInformation.salary_payment_method = field.salary_payment_method;
                            setSigningInfo(signingInformation);
                        });
                    });


                }
            });

        }
        // 签单价
        if(obj.event === "signed_unit_priceTpl") {
            layer.prompt({
                formType: 0
                , title: "编辑签单价"
                , value: signingInformation.signed_unit_price
            }, function(value, index) {
                signingInformation.signed_unit_price = value;
                if (!value) {
                    return;
                }
                setSigningInfo(signingInformation);
            });
        }
        // 员工单价
        if(obj.event === "employee_unit_priceTpl") {
            layer.prompt({
                formType: 0
                , title: "编辑员工单价"
                , value: signingInformation.employee_unit_price
            }, function(value, index) {
                signingInformation.employee_unit_price = value;
                if (!value) {
                    return;
                }
                setSigningInfo(signingInformation);
            });
        }
        // 驻场老师提成
        if(obj.event === "commission_for_teacherTpl") {
            layer.prompt({
                formType: 0
                , title: "编辑驻场老师提成"
                , value: signingInformation.commission_for_teacher
            }, function(value, index) {
                signingInformation.commission_for_teacher = value;
                if (!value) {
                    return;
                }
                setSigningInfo(signingInformation);
            });
        }
        // 业务员提成
        if(obj.event === "commission_for_salesmanTpl") {
            layer.prompt({
                formType: 0
                , title: "编辑业务员提成"
                , value: signingInformation.commission_for_salesman
            }, function(value, index) {
                signingInformation.commission_for_salesman = value;
                if (!value) {
                    return;
                }
                setSigningInfo(signingInformation);
            });
        }
    });

    function setSigningInfo(data) {
        console.log(data);
        admin.req({
            url: "/api/factory/setSigningInfo"
            , data: data
            , success: function(res) {
                layer.closeAll();
                if(res.code == 0) {
                    table.reload("LAY-factoryAudit-list");
                }
            }
        });
    }

    table.on("toolbar(LAY-factoryAudit-list)", function(obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        var data = checkStatus.data;
        var factory = data[0].factory;
        var event   = data[0];
        console.log(event);

        if(data.length < 1) {
            layer.msg("未选工厂");
            return;
        }

        /// 工厂事件审核
        if(obj.event === "dispose") {

            layer.confirm("你需要如何处理？", {
                btn: ["同意", "驳回", "退出"] //按钮
            }, function() {
                _touchEventDispose({status: 1, eid: event.id, fid: factory.id});
            }, function() {
                _touchEventDispose({status: 2, eid: event.id, fid: factory.id});
            });
        }

        /// 驻场老师管理
        if(obj.event === "teacher") {
            console.log(event);

            admin.popup({
                id: new Date().getTime()
                , title: "分配驻场老师"
                , area: ["95%", "95%"]
                , success: function() {

                    layui.setter.setData({type: obj.event, data: event});
                    view(this.id).render("ResidentManager/factoryTeacher", event).done(function() {

                    });

                }
            });
        }
        /// 工厂HR管理
        if(obj.event === "hr") {
            admin.popup({
                id: new Date().getTime()
                , title: "分配工厂HR"
                , area: ["95%", "95%"]
                , success: function() {
                    // layui.setter.setData({type: obj.event, data: data.fid});
                    layui.setter.setData({type: obj.event, data: factory});
                    view(this.id).render("Personnel/allothr", factory).done(function() {

                    });

                }
            });
        }

    });

    function _touchEventDispose({status,  eid, fid}) {
        layer.prompt({
            formType: 2
            , title: status == 1 ? "同意：备注" : "驳回: 备注"
        }, function(value, index) {
            if(!value) {
                return false;
            }
            var data = {};
            data.remark = value;
            data.status = status;
            data.eid = eid;
            data.fid = fid;

            console.log(data);

            admin.req({
                url: "/api/factory/dispose"
                , type: "post"
                , headers: {
                    token: layui.data("layuiAdmin").token
                }
                , data: data
                , success: function(res) {
                    table.reload("LAY-factoryAudit-list");
                    layer.closeAll();
                }
            });

        });
    }

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


    exports("factoryAudit", {});
});