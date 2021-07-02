<?php


namespace app\common\model;


use think\Model;

/**
 * 文章 涨知识 公告
 * Class Articles
 * @package app\common\model
 */
class Articles extends Model
{
    public $autoWriteTimestamp = true;

    protected $type = [
        "visible" => "array"
    ];



}