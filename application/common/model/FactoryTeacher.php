<?php


namespace app\common\model;


use think\Model;

/**
 * 驻厂老师
 * Class FactoryTeacher
 * @package app\common\model
 */
class FactoryTeacher extends Model
{
    public $autoWriteTimestamp = true;

    public function info() {
        return $this->hasOne("Users", 'id', 'uid');
    }

}