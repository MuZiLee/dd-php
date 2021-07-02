/**
 * 上传文件
 */
layui.define(['table', 'admin', 'table', 'form'], function (exports) {
    console.log("upfiles");


    var events = {
        onimage: function () {
            //普通图片上传
            // var uploadInst = upload.render({
            //     elem: '#logoAction'
            //     , url: '/api/upload/one' //改成您自己的上传接口
            //     , accept: 'image'
            //     , headers: { //通过 request 头传递
            //         token: layui.data('layuiAdmin').token
            //     }
            //     , before: function (obj) {
            //         //预读本地文件示例，不支持ie8
            //         obj.preview(function (index, file, result) {
            //             $('#logo').attr('src', result); //图片链接（base64）
            //         });
            //     }
            //     , done: function (res) {
            //         //如果上传失败
            //         if (res.code > 0) {
            //             return layer.msg('上传失败');
            //         }
            //         //上传成功
            //         logo = res.data.url;
            //         $('#logo').attr('src', 'http://' + res.data.url); //图片链接（base64）
            //     }
            //     , error: function () {
            //         //演示失败状态，并实现重传
            //         var demoText = $('#logoTitle');
            //         demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            //         demoText.find('.demo-reload').on('click', function () {
            //             uploadInst.upload();
            //         });
            //     }
            // });
        }
    };

    var objs = {
        events: events
    };
    exports('upfiles', objs);
});