/**
 * 工厂数据渲染
 */
layui.define(['form', 'admin', 'jquery', 'laydate'], function (exports) {

    var form  = layui.form;
    var admin = layui.admin;
    var $     = layui.jquery;
    var laydate = layui.laydate;

    var events = {
        factoryForm: function () {
            console.log("factoryForm event");

            form.render('select');
            // 合同届满薪资结算日期
            laydate.render({elem: '#settlement_date'});
            // 合同有效期 起始时间
            laydate.render({elem: '#startTime'});
            // 合同有效期 结局时间
            laydate.render({elem: '#endTime'});


            admin.req({
                url: '/api/factory/getCondition'
                ,type: 'post'
                ,success: function(res) {
                    /**
                     * 合作方式 cooperation_mode
                     */
                    layui.each(res.data.cooperation_mode, function (index, item) {
                        // console.log(item);
                        $('#cooperation_mode').append(new Option(item.title, item.id));
                    });
                    /**
                     * 工资发放方式 salary_payment_method
                     */
                    layui.each(res.data.salary_payment_method, function(index, item) {
                        $('#salary_payment_method').append(new Option(item.title, item.id));
                    });

                    /**
                     * 厂房性质 nature_of_plant
                     */
                    layui.each(res.data.nature_of_plant, function(index, item) {
                        $('#nature_of_plant').append(new Option(item.title, item.id));
                    });
                    /**
                     * 企业性质 nature_of_enterprise
                     */
                    layui.each(res.data.nature_of_enterprise, function(index, item) {
                        $('#nature_of_enterprise').append(new Option(item.title, item.id));
                    });
                    /**
                     * 用过的工种 used_jobs
                     */
                    layui.each(res.data.type_of_work, function(index, item) {
                        var checkBox = document.createElement("input");
                        checkBox.setAttribute("type", "checkbox");
                        checkBox.setAttribute("value", item.id);
                        checkBox.setAttribute("name", 'used_jobs');
                        checkBox.setAttribute("title", item.title);
                        // checkBox.setAttribute("checked", false);
                        $('#used_jobs').append(checkBox);
                    });
                    /**
                     * 不好招的工种 bad_jobs
                     */
                    layui.each(res.data.type_of_work, function(index, item) {
                        var checkBox = document.createElement("input");
                        checkBox.setAttribute("type", "checkbox");
                        checkBox.setAttribute("value", item.id);
                        checkBox.setAttribute("name", 'bad_jobs');
                        checkBox.setAttribute("title", item.title);
                        // checkBox.setAttribute("checked", false);
                        $('#bad_jobs').append(checkBox);
                    });
                    /**
                     * 用工紧张月 month
                     */
                    layui.each(res.data.month, function(index, item) {
                        var checkBox = document.createElement("input");
                        checkBox.setAttribute("type", "checkbox");
                        checkBox.setAttribute("value", item.id);
                        checkBox.setAttribute("name", 'labor_shortage_month');
                        checkBox.setAttribute("title", item.title);
                        // checkBox.setAttribute("checked", false);
                        $('#labor_shortage_month').append(checkBox);
                    });
                    form.render('checkbox');
                    form.render('select');

                }

            });


        }
        ,mapLoad: function() {
            var form = layui.form;
            form.on('select(panel)', function (data) {
                // alert("panel");
                layer.msg(data);
            });
            console.log("开始加载地图");
            var map = new AMap.Map("container", {
                zoom: 10
            });

            var poiPicker;
            AMapUI.loadUI(["misc/PoiPicker"], function(PoiPicker) {

                poiPicker = new PoiPicker({
                    input: "searchInput",
                    placeSearchOptions: {
                        map: map,
                        city: "全国",
                        pageSize: 10
                    },
                    searchResultsContainer: "searchResults"
                });

                poiPicker.on("poiPicked", function(poiResult) {
                    poiPicker.hideSearchResults();
                    var source = poiResult.source,
                        poi = poiResult.item;
                    if(source !== "search") {
                        //suggest来源的，同样调用搜索
                        poiPicker.searchByKeyword(poi.name);
                        console.log("选中search结果");
                    } else {
                        console.log("点击searchResults结果");
                        console.log(poi);
                    }
                });
                // 默认一开始就搜索
                // poiPicker.onCityReady(function() {
                //     poiPicker.searchByKeyword("东莞市金鸿盛电器有限公司");
                // });
            });

        }
        ,renderLookInfo: function(data) {

            if (!data) {
                return;
            }
            console.log(data);
            admin.req({
                url: '/api/factory/getCondition'
                ,type: 'post'
                ,success: function(res) {
                    /**
                     * 合作方式 cooperation_mode
                     */
                    layui.each(res.data.cooperation_mode, function (index, item) {
                        var option = new Option(item.title, item.id);
                        if (data.signingInformation.cooperation_mode     == item.title) {
                            option.setAttribute("selected", true);
                        }
                        $('#cooperation_mode').append(option);
                    });
                    /**
                     * 工资发放方式 salary_payment_method
                     */
                    layui.each(res.data.salary_payment_method, function(index, item) {
                        var option = new Option(item.title, item.id);
                        if (data.signingInformation.salary_payment_method == item.title) {
                            option.setAttribute("selected", true);
                        }
                        $('#salary_payment_method').append(option);
                    });

                    /**
                     * 厂房性质 nature_of_plant
                     */
                    layui.each(res.data.nature_of_plant, function(index, item) {
                        var option = new Option(item.title, item.id);
                        if (data.information.nature_of_plant == item.title) {
                            option.setAttribute("selected", true);
                        }
                        $('#nature_of_plant').append(option);
                    });
                    /**
                     * 企业性质 nature_of_enterprise
                     */
                    layui.each(res.data.nature_of_enterprise, function(index, item) {
                        var option = new Option(item.title, item.id);
                        if (data.information.nature_of_enterprise == item.title) {
                            option.setAttribute("selected", true);
                        }
                        $('#nature_of_enterprise').append(option);
                    });
                    /**
                     * 用过的工种 used_jobs
                     */
                    layui.each(res.data.type_of_work, function(index, item) {
                        var checkBox = document.createElement("input");
                        checkBox.setAttribute("type", "checkbox");
                        checkBox.setAttribute("value", item.id);
                        checkBox.setAttribute("name", 'used_jobs');
                        checkBox.setAttribute("title", item.title);
                        layui.each(data.information.bad_jobs, function (inx, val) {
                            if (val == item.title) {
                                checkBox.setAttribute("checked", true);
                            }
                        });
                        $('#used_jobs').append(checkBox);
                    });
                    /**
                     * 不好招的工种 bad_jobs
                     */
                    layui.each(res.data.type_of_work, function(index, item) {
                        var checkBox = document.createElement("input");
                        checkBox.setAttribute("type", "checkbox");
                        checkBox.setAttribute("value", item.id);
                        checkBox.setAttribute("name", 'bad_jobs');
                        checkBox.setAttribute("title", item.title);
                        layui.each(data.information.bad_jobs, function (inx, val) {
                            if (val == item.title) {
                                checkBox.setAttribute("checked", true);
                            }
                        });
                        $('#bad_jobs').append(checkBox);
                    });
                    /**
                     * 用工紧张月 month
                     */
                    layui.each(res.data.month, function(index, item) {
                        var checkBox = document.createElement("input");
                        checkBox.setAttribute("type", "checkbox");
                        checkBox.setAttribute("value", item.id);
                        checkBox.setAttribute("name", 'labor_shortage_month');
                        checkBox.setAttribute("title", item.title);
                        layui.each(data.information.labor_shortage_month, function (inx, val) {
                            if (val == item.id) {
                                checkBox.setAttribute("checked", true);
                            }
                        });
                        $('#labor_shortage_month').append(checkBox);
                    });
                    form.render('checkbox');
                    form.render('select');

                }

            });


            console.log("开始渲染");
            form.val("LAY-filter-factory-info-form", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                "factory_name": data.factory_name
                ,"province": data.province
                ,"city": data.city
                ,"district": data.district
                ,"addres": data.addres
                ,"location": data.location
                //签单信息
                ,"cooperation_mode": data.signingInformation.cooperation_mode
                ,"salary_payment_method": data.signingInformation.salary_payment_method
                ,"signed_unit_price": data.signingInformation.signed_unit_price
                ,"commission_for_teacher": data.signingInformation.commission_for_teacher
                ,"employee_unit_price": data.signingInformation.employee_unit_price
                ,"teacher_royalty": data.signingInformation.teacher_royalty
                ,"commission_for_salesman": data.signingInformation.commission_for_salesman
                ,"settlement_date": data.signingInformation.settlement_date
                ,"startTime": data.signingInformation.startTime
                ,"endTime": data.signingInformation .endTime
                //工厂信息
                ,"nature_of_plant": data.information.nature_of_plant
                ,"nature_of_enterprise": data.information.nature_of_enterprise
                ,"fixed_assets": data.information.fixed_assets
                ,"registered_capital": data.information.registered_capital
                ,"plant_area": data.information.plant_area
                ,"ratio_of_men_to_women": data.information.ratio_of_men_to_women
                ,"existing_employees": data.information.existing_employees
                ,"average_age": data.information.average_age
                ,"existing_recruitment_channels": data.information.existing_recruitment_channels
                ,"stable_age": data.information.stable_age
                ,"expected_demand": data.information.expected_demand
                //用过工种
                // ,"usedOfWork": data.usedOfWork
                //不好招工种
                // ,"badOfWork": data.badOfWork
                //紧张月
                // ,"month": data.month
                // 环境与待遇
                ,"age_requirements": data.environmental.age_requirements
                ,"working_hours": data.environmental.working_hours
                ,"rest_day_count": data.environmental.rest_day_count
                ,"way_to_work": data.environmental.way_to_work
                ,"is_insurance": data.environmental.is_insurance
                ,"is_experience": data.environmental.is_experience
                ,"dormitory_location": data.environmental.dormitory_location
                ,"people_of_dormitory": data.environmental.people_of_dormitory
                ,"is_toilet": data.environmental.is_toilet
                ,"dietary_standard": data.environmental.dietary_standard
                ,"night_shift_allowance": data.environmental.night_shift_allowance
                ,"required_certificates": data.environmental.required_certificates
                ,"training_time": data.environmental.training_time
                ,"training_content": data.environmental.training_content
                ,"ethnic_restrictions": data.environmental.ethnic_restrictions
                //相关人员
                ,"receptionist": data.personnel.receptionist
                ,"receptionist_phone": data.personnel.receptionist_phone
                ,"houseparent": data.personnel.houseparent
                ,"houseparent_phone": data.personnel.houseparent_phone
                ,"follow_up_person": data.personnel.follow_up_person
                ,"follow_up_person_phone": data.personnel.follow_up_person_phone
                ,"logo": data.logo
                ,"remark": data.remark
            });
            console.log("渲染结束");
            layui.setter.setData(data);
            console.log(layui.setter.getData());
            document.getElementById("logo").src = data.logo;
            document.getElementById("remark").value = data.remark;

            var demoListView = $('#factory-images-list');
            layui.each(data.images, function (index, item) {
                var tr = $(['<tr id="upload-' + index + '">'
                    , '<td>'
                    , '<img src="' + item.url + '" alt="' + item.url + '">'
                    , '</td>'
                    , '<td>' + item.url + '</td>'
                    , '<td></td>'
                    , '<td>已上传</td>'
                    , '<td>'
                    // , '<button class="layui-btn layui-btn-xs images-reload layui-hide">重传</button>'
                    // , '<button class="layui-btn layui-btn-xs layui-btn-danger images-delete">删除</button>'
                    , '</td>'
                    , '</tr>'].join(''));
                demoListView.append(tr);
            });

            form.render();
        }
        ,event2: function () {
            return 'event2';
        }
    };

    var objs = {
        events: events
    };
    exports('datarender', objs);
});