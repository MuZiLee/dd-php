<?php


namespace app\common\model;


use think\Model;

class FactoryJobs extends Model
{
    public $autoWriteTimestamp = true;

    protected $readonly = ["id"];

    public function factory() {
        return $this->hasOne("FactoryBasicInformation", "id", "fid")->with("images");
    }

    public function jobType() {
        return $this->hasOne("FactoryJobType", "id", "job_type");
    }


}