<?php


namespace app\common\model;

use think\Model;

/**
 * 商城-订单
 * Class ShopOrder
 * @package app\common\model
 */
class   ShopOrder extends Model
{
    public $autoWriteTimestamp = true;

    public function more() {
        $this->user;
        $this->euser;
        $this->order;
        $this->addres;
    }

    public function user() {
        return $this->hasOne("Users", "id", "uid");
    }

    public function euser() {
        return $this->hasOne("Users", "id", "euid");
    }

    /**
     * 对应 => 商品列表
     */
    public function order() {
        return $this->hasOne("ShopCommodity", "id", "cid")->with(['stype']);
    }

    public function addres() {
        return $this->hasOne("Addres", "id", "addid");
    }

}