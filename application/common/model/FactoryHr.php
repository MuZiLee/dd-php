<?php


namespace app\common\model;


use think\Model;

/**
 * 工厂HR
 * Class FactoryHr
 * @package app\common\model
 */
class FactoryHr extends Model
{
    protected $table = "dd_factory_hr";
    public $autoWriteTimestamp = true;

    public function info() {
        return $this->hasOne("Users", 'id', 'uid');
    }

}