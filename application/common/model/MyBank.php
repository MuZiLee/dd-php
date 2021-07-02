<?php


namespace app\common\model;

use think\Model;

/**
 * 我的银行卡
 * Class MyBank
 * @package app\common\model
 */
class MyBank extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
     $this->bank;
     $this->user;
    }

    /**
     * 银行卡
     */
    public function bank() {
        return $this->hasOne("BankList", 'id', "bid");
    }

    public function user() {
        return $this->hasOne("Users", 'id', 'uid');
    }
}