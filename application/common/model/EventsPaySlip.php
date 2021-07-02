<?php


namespace app\common\model;


use think\Model;

/**
 * 工资条事件
 * 驻场老师创建工资条->员工确认->财务审核
 * Class EventsPaySlip
 * @package app\common\model
 */
class EventsPaySlip extends Model
{
    public $autoWriteTimestamp = true;

    protected $type = [
       'create_time' => 'timestamp:Y/m/d',
    ];

    public function more() {
        $this->teacher;
        $this->staff;
        $this->junior;
        $this->strategic;
        $this->factory;
        $this->job;
    }

    protected $readonly = [
        "create_time", "id"
    ];

    public function teacher() {
        return $this->hasOne("Users", "id", "tuid");
    }

    public function staff() {
        return $this->hasOne("Users", "id", "uid");
    }

    public function junior() {
        return $this->hasOne("Users", "id", "pid");
    }

    public function strategic() {
        return $this->hasOne("StrategicAlliance", "id", "sid");
    }

    public function factory() {
     return $this->hasOne("FactoryBasicInformation", 'id', "fid");
    }

    public function job() {
        return $this->hasOne("FactoryJobs", 'id', 'jid');
    }


}