<?php


namespace app\common\model;


use think\Model;

class Feedbackes extends Model
{
    public $autoWriteTimestamp = true;

    public function user() {
        return $this->hasOne("Users", 'id', "uid");
    }
}