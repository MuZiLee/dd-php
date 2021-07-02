<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/26
 * Time: 2:10 AM
 */

namespace app\common\model;

use think\Model;

/**
 * 战略合伙人
 * Class StrategicAlliance
 * @package app\common\model
 */
class StrategicAlliance extends Model
{
    public $autoWriteTimestamp = true;
    protected $readonly = ["uid"];
}