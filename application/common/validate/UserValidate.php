<?php

namespace app\common\validate;

use think\Validate;

/**
 * 用户验证器
 * Class User
 * @package app\common\validate
 */
class UserValidate extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */	
	protected $rule = [
        'phone'    =>  'require|number|mobile',
        'password' =>  'require|notBetween:6,32',
        'vercode' =>   'require|min:5|max:5',
    ];
    
    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */	
    protected $message = [
        'phone.require' => '手机号不能为空',
        'phone.number' => '手机号必须是数字',
        'phone.mobile'  => '手机号不正确',

        'password.require'  => '密码不能为空',
        'password.notBetween'   => '密码必须在 6~32 范围内',

        'vercode.require'   => '验证码不能为空',
        'vercode.min'   => '验证码长度不对',
        'vercode.max'   => '验证码长度不对',
    ];


}
