layui.define(['admin', 'form'], function (exports) {
    var $ = layui.$
        ,setter = layui.setter
        ,admin = layui.admin
        ,form = layui.form
        ,router = layui.router()
        ,search = router.search;
    var $body = $('body');

    //提交
    form.on('submit(LAY-user-login-submit)', function (obj) {

        //请求登入接口
        admin.req({
            url: '/api/account/admin' //实际使用请改成服务端真实接口
            , type: 'post'
            , data: obj.field
            , done: function (res) {
                var user = res.data;
                if (user.isAdmin == 0) {
                    layer.msg("权限不足!");
                    return;
                }


                //请求成功后，写入 access_token
                layui.data(setter.tableName, {
                    key: setter.request.tokenName
                    , value: res.data.token
                });
                //保存密码作为口令
                layui.data(setter.tableName, {
                    key: setter.verify.key
                    , value: hex_md5(obj.field.password)
                });


                //登入成功的提示与跳转
                layer.msg('登入成功', {
                    offset: '15px'
                    , icon: 1
                    , time: 1000
                }, function () {

                    location.hash = search.redirect ? decodeURIComponent(search.redirect) : '/';
                });
            }
        });

    });

    //更换图形验证码
    $body.on('click', '#LAY-user-get-vercode', function(){
        var othis = $(this);
        this.src = '/api/captcha/getCaptcha'
    });


    exports('login', {})
});