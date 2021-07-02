/**
 * 工厂数据提交
 */
layui.define(["jquery", "admin", "layer", "form", "table", "datarender", "upload"], function(exports) {
    console.log("factoryssubmit");

    var layer = layui.layer;
    var form = layui.form;
    var admin = layui.admin;
    var $ = layui.jquery;
    var upload = layui.upload;
    var table = layui.table;


    var logo = "";
    var images = new Array();

    //合作方式
    var cooperation_mode  = "";
    form.on('select(cooperation_mode)', function(data) {
        cooperation_mode = data.value;
    });
    // 工资结算
    var salary_payment_method = "";
    form.on('select(salary_payment_method)', function(data){
        salary_payment_method = data.value;
    });
    // 厂房性质
    var nature_of_plant = "";
    form.on('select(nature_of_plant)', function(data){
        nature_of_plant = data.value;
    });
    // 企业性质
    var nature_of_enterprise = "";
    form.on('select(nature_of_enterprise)', function(data) {
        nature_of_enterprise = data.value;
    });

    // 提交
    form.on("submit(factoryssubmit)", function(obj) {
        obj.field.cooperation_mode = cooperation_mode;
        obj.field.salary_payment_method = salary_payment_method;
        obj.field.nature_of_plant = nature_of_plant;
        obj.field.nature_of_enterprise = nature_of_enterprise;

        console.log("提交数据");
        console.log(obj.field);

        /**
         *  --------- 用过的工种
         */
        obj.field.used_jobs = new Array;
        layui.each(document.getElementsByName("used_jobs"), function(index, item) {
            if(item.checked == true) {
                obj.field.used_jobs.push(item.value);
            }
        });
        if(obj.field.used_jobs.length < 1) {
            layer.msg("请检查'工厂信息'");
            return false;
        }


        /**
         * --------- 不好招的工种
         */
        var bad_jobs = new Array;
        layui.each(document.getElementsByName("bad_jobs"), function(index, item) {
            if(item.checked == true) {
                bad_jobs.push(item.value);//这个是获取多选框中的值
            }
        });
        obj.field.bad_jobs = bad_jobs;
        if(obj.field.bad_jobs.length < 1) {
            layer.msg("请检查'工厂信息'");
            return false;
        }


        /**
         * --------- 用工紧张月
         */
        var labor_shortage_month = new Array;
        layui.each(document.getElementsByName("labor_shortage_month"), function(index, item) {
            if(item.checked == true) {
                labor_shortage_month.push(item.value);//这个是获取多选框中的值
            }
        });
        obj.field.labor_shortage_month = labor_shortage_month;
        if(obj.field.labor_shortage_month.length < 1) {
            layer.msg("请检查'工厂信息'");
            return false;
        }



        var locations = obj.field.location.split(",");
        obj.field.longitude = locations[0];
        obj.field.latitude = locations[1];
        if (logo) {
            obj.field.logo = logo;
        } else  {
            if (!obj.field.logo) {
                layer.msg("未上传LOGO");
                return;
            }
        }
        if (images.length > 0) {
            obj.field.images = images;
        } else {
            console.log(obj.field);
            if (!obj.field.images) {
                layer.msg("未上传工厂环境图片");
                return ;
            }
        }

        console.log("提交数据");
        console.log(obj.field);

        admin.req({
            url: "/api/factory/input"
            , type: "post"
            , data: obj.field
            , headers: {
                token: layui.data('layuiAdmin').token
            }
            , success(res) {
                if(res.code == 0) {
                    layer.closeAll();
                    table.reload("LAY-factory-list");
                }
            }
        });
    });


    // 图片上传
    $(function() {
        //普通图片上传
        var uploadInst = upload.render({
            elem: "#logoAction"
            , url: "/api/upload/one" //改成您自己的上传接口
            , accept: "image"
            , headers: { //通过 request 头传递
                token: layui.data("layuiAdmin").token
            }
            , before: function(obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result) {
                    $("#logo").attr("src", result); //图片链接（base64）
                });
            }
            , done: function(res) {
                //如果上传失败
                if(res.code > 0) {
                    return layer.msg("上传失败");
                }
                //上传成功
                logo = res.data.url;
                $("#logo").attr("src", res.data.url); //图片链接（base64）
            }
            , error: function() {
                //演示失败状态，并实现重传
                var demoText = $("#logoTitle");
                demoText.html("<span style=\"color: #FF5722;\">上传失败</span> <a class=\"layui-btn layui-btn-xs demo-reload\">重试</a>");
                demoText.find(".demo-reload").on("click", function() {
                    uploadInst.upload();
                });
            }
        });


        /**
         * 必看---多文件上传
         *
         * 注意：layui的多文件上传其实就是单文件队列上传
         * 这个与tp框架自带的多方件上传不一样，layui的多文件上传有几个就遍历上传
         * 而tp中的多文件上传是一个数组，把多个文件的信息添加到数组中上传的，
         * 所以使用接口 index/upload/one
         */
        var demoListView = $("#factory-images-list");
        var uploadListIns = upload.render({
            elem: "#imageList"
            , url: "/api/upload/one" //改成您自己的上传接口
            , accept: "file"
            , multiple: true
            , auto: false
            , headers: { //通过 request 头传递
                token: layui.data("layuiAdmin").token
            }
            , bindAction: "#imagesListAction"
            , choose: function(obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function(index, file, result) {
                    console.log(file);
                    console.log(result);

                    var tr = $(["<tr id=\"upload-" + index + "\">"
                        , "<td>"
                        , "<img src=\"" + result + "\" alt=\"" + file.name + "\">"
                        , "</td>"
                        , "<td>" + file.name + "</td>"
                        , "<td>" + (file.size / 1024).toFixed(1) + "kb</td>"
                        , "<td>等待上传</td>"
                        , "<td>"
                        , "<button class=\"layui-btn layui-btn-xs images-reload layui-hide\">重传</button>"
                        , "<button class=\"layui-btn layui-btn-xs layui-btn-danger images-delete\">删除</button>"
                        , "</td>"
                        , "</tr>"].join(""));

                    //单个重传
                    tr.find(".images-reload").on("click", function() {
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find(".images-delete").on("click", function() {
                        delete files[index]; //删除对应的文件
                        delete images[index];
                        tr.remove();
                        uploadListIns.config.elem.next()[index].value = ""; //清空 input file 值，以免删除后出现同名文件不可选
                    });

                    demoListView.append(tr);
                });
            }
            , done: function(res, index, upload) {
                console.log("上传成功");
                console.log(res.data);
                /**
                 * 插入上传完成的图片
                 */
                images.push(res.data.url);
                if(res.msg == "成功") { //上传成功
                    var tr = demoListView.find("tr#upload-" + index)
                        , tds = tr.children();
                    tds.eq(3).html("<span style=\"color: #5FB878;\">上传成功</span>");
                    tds.eq(4).html(""); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            , error: function(index, upload) {
                var tr = demoListView.find("tr#upload-" + index)
                    , tds = tr.children();
                tds.eq(3).html("<span style=\"color: #FF5722;\">上传失败</span>");
                tds.eq(4).find(".images-reload").removeClass("layui-hide"); //显示重传
            }
        });

    });


    var dataRender = layui.datarender;
    // dataRender.events.factoryForm();
    // dataRender.events.mapLoad();

    exports("factoryssubmit", {});
});