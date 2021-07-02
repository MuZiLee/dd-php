<?php


namespace app\common\model;


use think\Model;

/**
 * 代理招聘工资条详情
 * Class EventsPaySlipAgent
 * @package app\common\model
 */
class EventsPaySlipAgent extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
        $this->user;
    }


    public function user() {
        return $this->hasOne("Users", 'id', 'uid');
    }
}