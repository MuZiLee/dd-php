<?php


namespace app\common\model;

use think\Model;

/**
 * 同工同酬工资条详情
 * Class EventsPaySlipEpfew
 * @package app\common\model
 */
class EventsPaySlipEpfew extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
        $this->user;
    }
    public function user() {
        return $this->hasOne("Users", 'id', 'uid');
    }
}