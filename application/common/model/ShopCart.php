<?php


namespace app\common\model;

use think\Model;
use think\model\relation\HasOne;

/**
 * 购物车
 * Class ShopCart
 * @package app\common\model
 */
class ShopCart extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
        $this->user;
        $this->order;
        $this->suser;
    }

    public function user() {
        return $this->hasOne("Users", "id", "uid");
    }
    public function order() {
        return $this->hasOne("ShopCommodity", "id", "cid")->with(["user", 'stype']);
    }
    // 这个sid != 合伙人中的sid，这里是ShopCart中的商家ID = user->id
    public function suser() {
        return $this->hasOne("Users", "id", "sid");
    }

}