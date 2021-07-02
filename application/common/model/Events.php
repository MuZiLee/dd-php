<?php


namespace app\common\model;

use think\Model;

/**
 * 事件表
 * Class Events
 * @package app\common\model
 */
class Events extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
        $this->etype;
        $this->user;
        $this->logs;
        $this->factory;
        $this->job;
    }

    /**
     * 事件类型
     */
    public function etype() {
        return $this->hasOne("EventsType", 'id', "etid");
    }

    /**
     * 事件发起者
     */
    public function user() {
        return $this->hasOne("Users", 'id', 'uid')->with('roles');
    }

    /**
     * 事件历史
     */
    public function logs() {
        return $this->hasMany("EventsLogs", 'eid', 'id')->with(['role','user']);
    }

    /**
     * 工厂
     */
    public function factory() {
        return $this->hasOne("FactoryBasicInformation", "id", "fid");
    }

    /**
     * 职位
     */
    public function job() {
        return $this->hasOne("FactoryJobs", "id", "jid");
    }
}