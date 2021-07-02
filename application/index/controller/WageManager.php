<?php


namespace app\index\controller;

use app\_Base\controller\SBResponse;
use app\common\model\EventsStaff;
use app\common\model\EventsStaffLogs;
use app\common\model\Users;
use think\Controller;

/**
 * 工资条，工资计算，获取工时等
 * Class WageManager
 * @package app\index\controller
 */
class WageManager extends Controller {

    /**
     * 查询某员工工时
     */
    public function findHour() {
        $uid =  $this->request->param("uid"); //员工ID
        if ($uid) {
            $wages = EventsStaff::where(["uid"=>$uid, "status"=>1, "etid"=>11])->select();

            $hour = 0;
            foreach ($wages as $wage) {
                $hour = $wage["hour"]+$hour;
            }

            return SBResponse::response($hour);
        } else {
            return SBResponse::error("未找到该用户");
        }

    }

}