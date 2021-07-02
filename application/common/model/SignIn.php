<?php


namespace app\common\model;


use think\Model;

/**
 * 签到表(天天金蛋)
 * Class SignIn
 * @package app\common\model
 */
class SignIn extends Model
{
    public $autoWriteTimestamp = true;
    protected $type = [
        "create_time" => "timestamp"
    ];

}