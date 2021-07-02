

layui.define(['admin','setter'], function(exports){
    console.log("welcome");

    var admin = layui.admin;
    var setter = layui.setter;


    console.log(layui.data("layuiAdmin").token);
    admin.req({
        url: "/api/account/getInfoByToken"
        , type: "post"
        , headers: {
            token: layui.data("layuiAdmin").token
        }
        , success: function(res) {
            console.log(res.data);
            if (res.code == 0) {
                //保存用户数据
                layui.data(setter.tableName, {
                    key: setter.userInfo
                    , value: res.data
                });
            }
        }
    });

    exports('welcome', {})
});