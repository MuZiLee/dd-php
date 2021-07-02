<?php


namespace app\common\model;


use think\Model;

/**
 * 工厂信息
 * Class FactoryInformation
 * @package app\common\model
 */
class FactoryInformation extends Model
{
    public $autoWriteTimestamp = true;
    protected $type = [
        "used_jobs" => "array",
        "bad_jobs" => "array",
        "labor_shortage_month" => "array"
    ];
}