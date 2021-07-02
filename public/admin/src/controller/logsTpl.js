layui.define(['jquery', 'element', 'layer', 'laydate', 'table'], function(exports) {
    console.log("logsTpl ");

    var table = layui.table;


    table.render({
        elem: "#LAY-personnelMatters-list"
        , url: "/api/factory/getApplylist"
        , method: "post"
        , toolbar: "#Lay-personnelMatters-list-toolbar"
        , cols: [[
            {type: "numbers", width: 60, title: "序号", align: "center", fixed: "left", sort: true}
            , {width: 80,align: "center", title:"用户", fixed: "left", templet:"#imgTpl"}
            , {width: 150,align: "center", title:"事件名称", templet:"#titleTpl"}
            , {width: 100,align: "center", title:"申请人", templet:"#usernameTpl"}
            , {width: 200,align: "center", title:"工厂名称", templet:"#factoryTpl"}
            , {width: 150,align: "center", title:"职位名称", templet:"#jobTpl"}
            , {width: 150,align: "center", title:"审核记录", templet:"#logsTpl"}
            , {width: 200, align: 'center', title: '申请时间', templet: "#createTimeTpl"}
            , {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#LAY-personnelMatters-list-tool-tages"}
        ]]
        , defaultToolbar: []
        ,height: 'full-150'
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0个职位申请"
        }
    });



    exports("logsTpl", {});
});