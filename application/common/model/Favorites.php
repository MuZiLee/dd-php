<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/18
 * Time: 5:07 AM
 */

namespace app\common\model;


use think\Model;

/**
 * 收藏表
 * Class Favorites
 * @package app\common\model
 *
 *
 * type : 1文章收藏 2:职位收藏
 */
class Favorites extends Model
{
    protected $autoWriteTimestamp = true;
}