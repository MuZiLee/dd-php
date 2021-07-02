<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/26
 * Time: 2:34 AM
 */

namespace app\common\model;



use think\model\Pivot;

class PartnerPivot extends Pivot
{
    protected $autoWriteTimestamp = true;


    /**
     * 经纪人(邀请码)
     * 上级用户
     */
    public function user() {
        return $this->hasOne("Users", "id", "pid")->with('strategic');
    }

    /**
     * 我的准工人
     * 初级合伙人的下级
     */
    public function prospectiveWorker() {
        return $this->hasOne("Users", "id", "uid");
    }

    /**
     * 战略合伙人(经纪人的上级)
     * 所属战略合伙人
     */
    public function strategic() {
        return $this->hasOne("StrategicAlliance", "id", "sid");
    }




}