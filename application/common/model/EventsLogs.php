<?php


namespace app\common\model;


use think\Model;

/**
 * 事件日志
 * Class EventsLogs
 * @package app\common\model
 */
class EventsLogs extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
        $this->user;
        $this->role;
    }

    public function user() {
        return $this->hasOne("Users", 'id', 'uid');
    }

    /**
     * 审核角色
     */
    public function role() {
        return $this->hasOne("RolesType", 'id', "rid");
    }
}