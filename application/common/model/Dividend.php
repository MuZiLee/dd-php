<?php


namespace app\common\model;

use think\Model;

/**
 * 分红
 * Class Dividend
 * @package app\common\model
 */
class Dividend extends Model
{
    public $autoWriteTimestamp = true;



    public function factory() {
        return $this->hasOne("FactoryBasicInformation", 'id', 'fid');
    }

}