<?php


namespace app\index\controller;

use app\_Base\controller\SBResponse;
use app\common\model\EnterpriseCommission;
use app\common\model\Events;
use app\common\model\EventsStaff;
use app\common\model\EventsType;
use app\common\model\FactoryTeacher;
use app\common\model\Users;
use think\Controller;

/**
 * 员工服务相关
 * Class StaffManager
 * @package app\index\controller
 */
class StaffManager extends Controller
{
    /**
     * 员工申请
     * TODO: 请假 报销 离职 打卡
     */
    public function addFlow() {
        $user = Users::fromToken();
        $data['uid'] = $user->id;
        $data['pid'] = $user->partner->pid;
        $data['fid'] = $this->request->param("fid");
        $data['jid'] = $this->request->param("jid");
        $data['etid'] = $this->request->param("etid");

        if (!$data["jid"]) {
            return SBResponse::error("缺少jid");
        }
        if (!$data["jid"]) {
            return SBResponse::error("缺少jid");
        }
        if (!$data['etid']) {
            return SBResponse::error("缺少事件类型");
        }

        // TODO : 请假
        if ($data['etid'] == EventsType::leave_application) {
            $data['start_time'] = $this->request->param("start_time");
            $data['end_time'] = $this->request->param("end_time");
            $data['remark'] = $this->request->param("remark");
            $data['hour'] = $this->request->param("hour");

            foreach (FactoryTeacher::where(['fid'=>$data['fid']])->all() as $item) {
                $tuser = Users::where(['id'=>$item->uid])->find();
//                $jpush = new JPushServers();
//                $jpush->pushOne($tuser->phone, "【请假申请】", "你有一个请假申请需要处理");
            }
        }

        // TODO: 报销
        if ($data['etid'] == EventsType::claim_for_reimbursement) {
            //报销费用
            $data['cost'] = $this->request->param("cost");
            $data['images'] = $this->request->param("images");
            $data['remark'] = $this->request->param("remark");

            foreach (FactoryTeacher::where(['fid'=>$data['fid']])->all() as $item) {
                $tuser = Users::where(['id'=>$item->uid])->find();
//                $jpush = new JPushServers();
//                $jpush->pushOne($tuser->phone, "【报销申请】", "你有一个报销申请需要处理");
            }
        }
        // TODO: 离职
        // TODO: 在离职审核中,记得把员工角色删除掉
        if ($data['etid'] == EventsType::quit_application) {
            $data['remark'] = $this->request->param("remark");
            $data['end_time'] = $this->request->param("end_time");
            $oevent = EventsStaff::where(["etid" => $data['etid'], "uid"=>$user->id, "fid"=>$data['fid'], "jid"=>$data['jid']])->find();
            if ($oevent) {
                //如果已提交过离职申请
                return SBResponse::error("已经提交过，请等待审批");
            }

            /// TODO: 给驻场老师打分
            $star = $this->request->param("star");
            $teachers = FactoryTeacher::where(["fid"=>$data['fid']])->select();
            foreach ($teachers as $teacher) {
                 $score = doubleval($teacher->score) + doubleval($star);
                 $teacher->save([
                     "score" => $score
                 ]);
            }

            foreach (FactoryTeacher::where(['fid'=>$data['fid']])->all() as $item) {
                $tuser = Users::where(['id'=>$item->uid])->find();
//                $jpush = new JPushServers();
//                $jpush->pushOne($tuser->phone, "【离职申请】", "你有一个离职申请需要处理");
            }
        }
        // TODO: 打卡
        if ($data['etid'] == EventsType::punch_the_clock) {
            $data['hour'] = $this->request->param("hour");

            $bill = $this->request->param("bill");
            EnterpriseCommission::create([
                "status"=>0
                ,"uid"=>$data["uid"]
                ,"fid"=>$data["fid"]
                ,"jid"=>$data["jid"]
                ,"hour"=>$data["hour"]
                ,"signBill"=>$bill["signBill"]
                ,"staffBill"=>$bill["staffBill"]
                ,"teacherBill"=>$bill["teacherBill"]
                ,"salesmanBill"=>$bill["salesmanBill"]
                ,"primaryBill"=>$bill["primaryBill"]
                ,"advancedBill"=>$bill["advancedBill"]
                ,"strategicBill"=>$bill["strategicBill"]
                ,"dandanBill"=>$bill["dandanBill"]

                ,"teacherId"=>$bill["teacherId"]
                ,"salesmanId"=>$bill["salesmanId"]
                ,"primaryId"=>$bill["primaryId"]
                ,"advancedId"=>$bill["advancedId"]
                ,"strategicId"=>$bill["strategicId"]
            ]);
        }

        $event = EventsStaff::create($data);
        return SBResponse::response($event);

    }

    /**
     * TODO: 获取打卡事件
     */
    public function getPunchTheClocklist() {
        $user = Users::fromToken();
        $events = EventsStaff::where(['uid'=>$user->id, 'etid'=>EventsType::punch_the_clock])->order('create_time', 'desc')->all();
        foreach ($events as $event) {
            $event->signingInfo;
            $event->factory;
            $event->etype;
            $event->user;
        }
        return SBResponse::response($events);
    }

    /**
     * TODO : 当月的打卡事件
     */
    public function getSameMonthClocklist() {
        $user = Users::fromToken();
        $events = EventsStaff::where(monthWhere(time()))->where(['etid'=>EventsType::punch_the_clock, 'uid'=> $user->id])->select();
        foreach ($events as $event) {
            $event->factory;
            $event->signingInfo;
        }
        return SBResponse::response($events);
    }

    /**
     * TODO : 获取当月的预支
     */
    public function getSameMontcAdvancePayments() {
        $user = Users::fromToken();
        $events = EventsStaff::where(monthWhere(time()))->where(['uid'=>$user->id, "etid"=>EventsType::advance_payments])->select();

        return SBResponse::response($events);
    }

    /**
     * TODO: 工作流 历史记录
     */
    public function workflowHistory() {
        $user = Users::fromToken();
        $events = EventsStaff::where(['uid'=>$user->id])->order('create_time', 'desc')->all();
        foreach ($events as $event) {
            $event->more();
        }
        return SBResponse::response($events);
    }

    /**
     * TODO : 预支申请
     */
    public function advancePayments() {
        $user = Users::fromToken();

        $events = EventsStaff::where(monthWhere(time()))->where(['uid'=>$user->id, "etid"=>EventsType::advance_payments])->select();
        if (count($events) > 0) {
            return SBResponse::error("你这个月已经申请过了");
        } else {

            $data = $this->request->param();
            $data['etid'] = EventsType::advance_payments;
            $data['uid'] = $user->id;
            if (!$data['cost']) {
                return SBResponse::error("缺少cost", $data);
            }

            $event = EventsStaff::create($data);

            return SBResponse::response($event);
        }

    }

}