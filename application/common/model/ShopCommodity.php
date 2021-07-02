<?php


namespace app\common\model;

use think\Model;

/**
 * 商城-商品
 * Class ShopCommodity
 * @package app\common\model
 */
class ShopCommodity extends Model
{
    public $autoWriteTimestamp = true;

    protected $type = [
        "images" => "array"
    ];


    public function more() {

        $this->user;
        $this->stype;

    }

    public function user() {
        return $this->hasOne("Users", "id", "uid");
    }

    public function stype() {
        return $this->hasOne("ShopType", "id", "tid");
    }


}