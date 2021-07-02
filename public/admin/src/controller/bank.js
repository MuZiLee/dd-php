layui.define(["jquery", "element", "layer", "laydate", "layedit", "view", "table", "form", "admin", "upload"], function(exports) {
    console.log("bank");

    var table = layui.table;

    table.render({
        elem: "#LAY-bank-list"
        , url: "/api/bank/get"
        , method: "post"
        , cols: [[
            {type: "numbers", align: "center", fixed: "left"}
            , {align: "center", title: "银行名称", sort: true, templet: "#titleTpl"}
            , {align: "center", title: "银行代号", sort: true, templet: "#bankcodeTpl"}
            , {align: "center", title: "银行缩写", sort: true, templet: "#bankTpl"}
            , {align: "center", title: "费率", sort: true, templet: "#rateTpl"}

        ]]
        , cellMinWidth: 200
        , defaultToolbar: []
        , height: "full-150"
        , page: true
        , limit: 15
        , limits: [10, 15, 20, 30, 40, 50, 100]
        , text: {
            none: "0家银行"
        }
    });

    exports("bank", {});
});