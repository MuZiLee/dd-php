<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/3
 * Time: 7:18 AM
 */

namespace app\index\Controller;


class Captcha
{
    public function getCaptcha() {
        $config =    [
            // 验证码字体大小
            'fontSize'    =>    30*5,
            'imageH'    =>    75*5,
            'imageW'    =>    180*7,
            'fontttf'  => '2.ttf'
        ];
        $captcha = new \think\captcha\Captcha($config);
        return $captcha->entry();
    }
}