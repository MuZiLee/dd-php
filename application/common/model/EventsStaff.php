<?php


namespace app\common\model;

use think\Model;

/**
 * 员工服务
 * Class EventsStaff
 * @package app\common\model
 */
class EventsStaff extends Model
{
    public $autoWriteTimestamp = true;
    protected $type = [
        "images" => "array",
    ];

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
     * 事件提交用户
     */
    public function user() {
        return $this->hasOne("Users", "id", "uid");
    }

    /**
     * 工作流日志
     */
    public function logs() {
        return $this->hasMany("EventsStaffLogs", "eid", "id")->with(["ruser","role"]);
    }

    /**
     * 工厂
     */
    public function factory() {
        return $this->hasOne("FactoryBasicInformation", "id", "fid");
    }

    /**
     * 查工价
     */
    public function signingInfo() {
        return $this->hasOne("FactorySigningInformation", "fid", "fid");
    }

    /**
     * 职位
     */
    public function job() {
        return $this->hasOne("FactoryJobs", "id", "jid");
    }
}