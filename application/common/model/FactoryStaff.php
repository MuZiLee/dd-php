<?php


namespace app\common\model;

use think\Model;

/**
 * 员工表
 * Class FactoryStaff
 * @package app\common\model
 */
class FactoryStaff extends Model
{
    public $autoWriteTimestamp = true;

    protected $type = [
        "create_time" => 'timestamp:Y/m/d',
    ];
    /**
     * 工厂信息
     */
    public function factory() {
        return $this->hasOne("FactoryBasicInformation", "id", "fid");
    }

    /**
     * 工厂签单信息
     */
    public function sigingInformation() {
        return $this->hasOne("FactorySigningInformation", "fid", "fid");
    }

    /**
     * 员工信息
     */
    public function user() {
        return $this->hasOne("Users", "id", "uid");
    }

    /**
     * 工厂环境与待遇
     */
    public function envAndTreat() {
        return $this->hasOne("FactoryEnvironmentAndTreatment", "fid", 'fid');
    }

    /**
     * 职位信息
     */
    public function job() {
        return $this->hasOne("FactoryJobs", "id", "jid")->with(['jobType']);
    }
}