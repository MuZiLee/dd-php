layui.define(["table"], function(exports) {
    "use tableExtension";




    var objs = {
        reload: function({elem = "#", url = "", data = {}, toolbar = "#", dataSources = [[]], text = "没有数据"}) {

            var table = layui.table.render({
                elem: elem
                , url: url
                , method: "post"
                , where: data
                , toolbar: toolbar
                , cols: dataSources
                // , cellMinWidth: 100
                , page: true
                , limit: 15
                , limits: [10, 15, 20, 30, 40, 50, 100]
                , text: {
                    none: text,
                }
            });

            return table;
        },
        // events: events
    };
    exports("tableExtension", objs);
});