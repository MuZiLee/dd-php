layui.define(['jquery', 'element', 'layer', 'laydate', 'layedit', 'view', 'table', 'form', 'admin', 'upload'], function (exports) {
    "use jobs";

    var $ = layui.jquery;
    var layer = layui.layer;
    var admin = layui.admin;
    var view = layui.view;
    var table = layui.table;
    var form = layui.form;


    /**
     * 职位类型列表
     */
    table.render({
        elem: '#LAY-jobs-category-list'
        , url: '/api/factory/getJobTypes'
        , method: "post"
        , cols: [[
            {type: 'numbers', align: 'center', width: 60, title: "序号", fixed: 'left'}
            // , {field: 'id', width: 100, align: 'center', title: 'ID', templet: "#idTpl"}
            , {field: 'title', minWidth: 100, align: 'center', title: '类名', templet: "#titleTpl"}
        ]]
        , height: "full-150"
        , text: '对不起，加载出现异常！'
    });

    /**
     * 职位列表
     */
    table.render({
        elem: '#LAY-job-list'
        , toolbar: '#Lay-job-list-toolbar'
        // ,skin: 'nob'// 无边框风格 //有边框'line'
        // ,size:'lg' // 大尺寸
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , height: 'full-150'
        , cols: [[
            {type: "radio", title: "单选", fixed: "left"}
            , {type: 'numbers', align: 'center', title: '序号', fixed: 'left'}
            , {width: 70, align: 'center', title: '状态', fixed: 'left', templet: "#statusTpl"}
            , {width: 70, align: 'center', title: 'ID', sort: true, templet: "#idTpl"}
            , {width: 150, align: 'center', title: '职位名称', sort: true, templet: "#job_nameTpl"}
            , {width: 150, align: 'center', title: '职位类型', sort: true, templet: "#job_typeTpl"}
            , {width: 100, align: 'center', title: '热招', sort: true, templet: "#isHotTpl"}
            , {width: 140, align: 'center', title: '合作方式', templet: function (d) {
                return d.factory.signingInformation.cooperation_mode;
            }}
            , {width: 300, align: 'center', title: '所在工厂', sort: true, templet: "#factory_nameTpl"}
            , {width: 100, align: 'center', title: '省', sort: true, templet: "#provinceTpl"}
            , {width: 100, align: 'center', title: '市', sort: true, templet: "#cityTpl"}
            , {width: 150, align: 'center', title: '区/县/镇', sort: true, templet: "#districtTpl"}
            , {width: 300, align: 'center', title: '地址', sort: true, templet: "#addresTpl"}
            , {width: 200, align: 'center', title: '底薪', sort: true, templet: "#base_salaryTpl"}
            , {width: 200, align: 'center', title: '综合薪资', sort: true, templet: "#minimum_search_rangeTpl"}
            , {width: 200, align: 'center', title: '创建时间', sort: true, templet: "#create_timeTpl"}
            , {title: '操作', width: 200, align: 'center', fixed: 'right', toolbar: "#LAY-job-list-toolbar-tages"}
        ]]
        , text: {
            none: '职位 0 个',
        }
        , url: '/api/factory/jobList' //模拟接口
        // ,where: {token: 'sasasas', id: 123} //如果无需传递额外参数，可不加该参数
        , method: "post" //如果无需自定义HTTP类型，可不加该参数
        , request: {
            headers: {
                token: layui.data('layuiAdmin').token
            }
        } //如果无需自定义请求参数，可不加该参数
        , response: {} //如果无需自定义数据响应名称，可不加该参数

    });

    //监听工具条
    table.on('toolbar(LAY-job-list)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id);
        var data = checkStatus.data;//数组

        if (obj.event === "add") {

            admin.popup({
                title: '添加职位'
                , area: ['95%', '95%']
                , id: 'LAY-popup-job-add-tags'
                , success: function (layero, index) {
                    view(this.id).render('Personnel/job/form').done(function () {

                        // 获取已审核通过的工厂名称列表
                        admin.req({
                            url: '/api/factory/getAvailableTactorylist'
                            , dataType: "json"
                            , success: function (result) {
                                console.log(result);

                                var select_obj = $("#factory_name");
                                for (i in result.data) {
                                    var obj = result.data[i];

                                    var option = document.createElement("option");
                                    option.value = obj.id;
                                    option.innerHTML = obj.factory_name;
                                    option.name = "factory_name";
                                    // console.log(option);

                                    select_obj.append(option);
                                }

                                form.render("select");
                                form.render("checkbox");
                            }
                        });
                        //点击工厂名称搜索框时调用
                        var fid = "";
                        form.on('select(factory_name)', function (data) {
                            console.log(data.value); //得到被选中的值
                            console.log(data.othis); //得到被选中的值
                            fid = data.value;
                        });

                        //渲染职位类型
                        admin.req({
                            url: '/api/factory/getJobTypes'
                            , dataType: "json"
                            , success: function (result) {
                                var select_obj = $("#job_type");

                                for (i in result.data) {
                                    var obj = result.data[i];

                                    var option = document.createElement("option");
                                    option.value = obj.id;
                                    option.innerHTML = obj.title;
                                    option.name = "job_type";
                                    select_obj.append(option);
                                }
                                form.render("select");
                                form.render("checkbox");
                            }
                        });
                        //职位类型选中时回调
                        var jtid = "";
                        form.on('select(job_type)', function (data) {
                            jtid = data.value;
                        });

                        // 提交
                        form.on('submit(LAY-job-button-event-add)', function (data) {

                            if (data.field.isHot == "on") {
                                data.field.isHot = 1;
                            } else {
                                data.field.isHot = 0;
                            }
                            data.field.fid = fid;
                            data.field.jtid = jtid;

                            console.log(data.field);


                            admin.req({
                                url: '/api/factory/addJob',
                                data: data.field,
                                type: 'post',
                                success: function (res) {
                                    //提交 Ajax 成功后，关闭当前弹层并重载表格
                                    //$.ajax({});
                                    console.log(res);
                                    layui.table.reload('LAY-job-list'); //重载表格
                                    layer.close(index); //执行关闭
                                }
                            });

                            return false;
                        });


                    });
                }
            });


        } else if (obj.event === "push") {

            if(data.length < 1) {
                layer.msg("未选中职位");
                return;
            }
            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                if (hex_md5(value) != layui.data('layuiAdmin').password) {
                    layer.msg("口令不正确");
                } else {

                    var jobids = [];
                    for (var i = 0; i < data.length; i++) {
                        jobids.push(data[i].id);
                    }
                    console.log(jobids);
                    if (jobids.length < 1) {
                        return;
                    }
                    admin.req({
                        url: '/api/factory/pushJob'
                        , type: "post"
                        , data: data[0]
                        , success: function (res) {
                            layer.msg("上架了 " + res.data.job_name);
                            layui.table.reload('LAY-job-list'); //重载表格
                        }
                    });

                }
            });

        } else if (obj.event === 'soldOut') {
            if (data.length == 0) {
                layer.msg("选择条目");
                return;
            }

            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                if (hex_md5(value) != layui.data('layuiAdmin').password) {
                    layer.msg("口令不正确");
                } else {

                    var jobids = [];
                    for (var i = 0; i < data.length; i++) {
                        jobids.push(data[i].id);
                    }
                    console.log(jobids);
                    if (jobids.length < 1) {
                        return;
                    }
                    admin.req({
                        url: '/api/factory/soldOutJob'
                        , type: "post"
                        , data: data[0]
                        , success: function (res) {
                            layer.msg(res.data.job_name +" 已经下架");
                            layui.table.reload('LAY-job-list'); //重载表格
                        }
                    });

                }
            });


        }
    });


    table.on('tool(LAY-job-list)', function (obj) {
        var data = obj.data;
        console.log(data);
        if (obj.event === 'lookinfo') {

            admin.popup({
                title: '查看职位'
                , area: ['95%', '95%']
                , id: 'LAY-popup-job-add-tags'
                , success: function (layero, index) {
                    view(this.id).render('Personnel/job/form', data).done(function () {

                        var job;
                        admin.req({
                            url: '/api/factory/jobInfo'
                            , dataType: "json"
                            , type: 'post'
                            , data: data
                            , success: function (result) {
                                job = result.data;
                                var factorys = job.factorys;



                                //渲染可用的工厂名
                                var factory_name = $("#factory_name");
                                layui.each(factorys, function(index, item) {

                                    var option = document.createElement("option");
                                    option.value = item.id;
                                    option.innerHTML = item.factory_name;
                                    option.name = "factory_name";
                                    if (job.factory.id == item.id) {
                                        option.selected = 'selected';
                                    }
                                    factory_name.append(option);
                                });
                                //渲染职位类型
                                var job_type = $("#job_type");
                                layui.each(job.types, function(index, item) {

                                    var option = document.createElement("option");
                                    option.value = item.id;
                                    option.innerHTML = item.title;
                                    option.name = "job_type";
                                    if (job.job_type.id == item.id) {
                                        option.selected = 'selected';
                                    }
                                    job_type.append(option);
                                });

                                //给表单赋值
                                form.val("LAY-jobs-form-list", {
                                    "isHot": job.isHot
                                    ,'job_basic': job.job_basic
                                    ,'minimum_salary_range': job.minimum_salary_range
                                });
                                console.log(job);
                                // form.render("select");
                                // form.render("checkbox");
                            }
                        });
                        //点击工厂名称搜索框时调用
                        var fid = null;
                        form.on('select(factory_name)', function (obj) {
                            console.log(obj.value); //得到被选中的值
                            console.log(obj.othis); //得到被选中的值
                            fid = obj.value;

                        });


                        //职位类型选中时回调
                        var jtid = null;
                        form.on('select(job_type)', function (obj) {
                            jtid = obj.value;
                            console.log(obj.value); //得到被选中的值
                            console.log(obj.othis); //得到被选中的值
                        });

                        // 提交
                        form.on('submit(LAY-job-button-event-update)', function (formObj) {

                            if (!formObj.field.base_salary) {
                                layer.msg("底薪不能为空");
                                return false;
                            }

                            if (formObj.field.isHot == "on") {
                                formObj.field.isHot = 1;
                            } else {
                                formObj.field.isHot = 0;
                            }
                            console.log(formObj.field);

                            admin.req({
                                url: '/api/factory/updateJob',
                                data: formObj.field,
                                type: 'post',
                                headers: {
                                    token: layui.data('layuiAdmin').token
                                },
                                success: function (res) {
                                    //提交 Ajax 成功后，关闭当前弹层并重载表格
                                    //$.ajax({});
                                    console.log(res);
                                    layui.table.reload('LAY-job-list'); //重载表格
                                    layer.close(index); //执行关闭
                                }
                            });

                            return false;
                        });


                    });
                }
            });

        } else if (obj.event === "del") {
            console.log(data);
            layer.prompt({
                formType: 1
                , title: '删除操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                admin.req({
                    url: '/api/factory/delJob'
                    , type: "post"
                    , data: data
                    , success: function (res) {
                        layui.table.reload('LAY-job-list'); //重载表格
                    }
                });
            });
        } else if (obj.event === "isHotAction") {
            console.log(data);
            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                admin.req({
                    url: '/api/factory/isHotJob'
                    , type: "post"
                    , data: data
                    , success: function (res) {
                        layui.table.reload('LAY-job-list'); //重载表格
                    }
                });
            });

        }

    });



    var events = {
        loadFactorys: function () {

            // 获取已审核通过的工厂名称列表
            $.ajax({
                type: "post"
                , url: '{:url("admin/factory/getAvailableTactorylist")}'
                , dataType: "json"
                , success: function (result) {
                    // console.log(result);

                    var select_obj = $("#factory_name");
                    for (i in result.data) {
                        var obj = result.data[i];

                        var option = document.createElement("option");
                        option.value = obj.id;
                        option.innerHTML = obj.factory_name;
                        option.name = "factory_name";
                        // console.log(option);

                        select_obj.append(option);
                    }
                    form.render("select");
                }
            });


        }
    };

    var objs = {
        init: function () {
            console.log("init");
        },
        events: events
    };
    exports('jobs', objs);
});