<?php


namespace app\common\model;

use think\Model;

/**
 * 企业佣金
 * Class EnterpriseCommission
 * @package app\common\model
 */
class EnterpriseCommission extends Model
{
    public $autoWriteTimestamp = true;



    public function factory() {
        return $this->hasOne("FactoryBasicInformation", 'id', 'fid');
    }

    public function user() {
        return $this->hasOne("Users", 'id', 'uid');
    }



}