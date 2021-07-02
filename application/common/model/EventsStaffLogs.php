<?php


namespace app\common\model;

use think\Model;

/**
 * 员工服务审核日志
 * Class EventsStaffLogs
 * @package app\common\model
 */
class EventsStaffLogs extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
        $this->ruser;
        $this->role;
    }

    /**
     * 员工事件审核人
     */
    public function ruser() {
        return $this->hasOne("Users", "id", "uid");
    }

    public function role() {
        return $this->hasOne("RolesType", "id", "rid");
    }

}