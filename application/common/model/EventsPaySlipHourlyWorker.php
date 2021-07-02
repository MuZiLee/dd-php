<?php


namespace app\common\model;


use think\Model;

/**
 * 小时工工资详情
 * Class EventsPaySlipHourlyWorker
 * @package app\common\model
 */
class EventsPaySlipHourlyWorker extends Model
{
    public $autoWriteTimestamp = true;

    protected $readonly = [
        "create_time", "id"
    ];

    public function more() {
        $this->user;
    }
    public function user() {
        return $this->hasOne("Users", 'id', 'uid');
    }
}