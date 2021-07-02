<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Dividend;
use app\common\model\EnterpriseCommission;
use app\common\model\EventsPaySlip;
use app\common\model\EventsPaySlipAgent;
use app\common\model\EventsPaySlipEpfew;
use app\common\model\EventsPaySlipHourlyWorker;
use app\common\model\FactoryBasicInformation;
use app\common\model\FactorySigningInformation;
use app\common\model\PartnerPivot;
use app\common\model\RolesPivot;
use app\common\model\RolesType;
use app\common\model\StrategicAlliance;
use app\common\model\Users;
use think\Controller;

/**
 * 工资条管理器
 * EventsPaySlip 工资条事件
 * EventsPaySlipHourlyWorker 小时工工资详情
 * EventsPaySlipEpfew 同工同酬工资条详情
 * EventsPaySlipAgent 代理招聘工资条详情
 * Class PaySlipManager
 * @package app\index\controller
 */
class PaySlipManager extends Controller
{
    /**
     * 添加工资条
     */
    public function addPaySlip() {
        $type = $this->request->param("type");


        if (!$type) {
            return SBResponse::error("缺少工资条类型");
        }
        $user = Users::fromToken();
        if (!$user) {
            return SBResponse::error("缺少token");
        }
        $event = $this->request->param("event");
        $data = $this->request->param();


        if ($type == "小时工工资条") {
            // 小时工工资条
            $hourlyWorker = EventsPaySlipHourlyWorker::create($data);
            $event['pwdid'] = $hourlyWorker->id;
        }

        if ($type == "同工同酬工资条") {
            //
            $paySlipEpfew = EventsPaySlipEpfew::create($data);
            $event['pwdid'] = $paySlipEpfew->id;
        }
        if ($type == "代理招聘工资条") {
            //
            $paySlipAgent = EventsPaySlipAgent::create($data);
            $event['pwdid'] = $paySlipAgent->id;
        }
        if (!$event['pwdid']) {
            return SBResponse::error("工资条创建失败");
        }

        $paySlip = EventsPaySlip::create($event);
        return SBResponse::response($paySlip);
    }

    /**
     * 我的工资条
     */
    public function myPaySliplist() {
        $user = Users::fromToken();

        $events = EventsPaySlip::where(['uid'=>$user->id])->all();
        foreach ($events as $event) {
            $event->more();
            if ($event->type == "小时工工资条") {
                $event['slip'] = EventsPaySlipHourlyWorker::where(['id'=>$event->pwdid])->find();
            }
            if ($event->type == "同工同酬工资条") {
                $event['slip'] = EventsPaySlipEpfew::where(['id'=>$event->pwdid])->find();
            }
            if ($event->type == "代理招聘工资条") {
                $event['slip'] = EventsPaySlipAgent::where(['id'=>$event->pwdid])->find();
            }
        }
        return SBResponse::response($events);
    }

    /**
     * 员工确认工资条
     */
    public function confirmPaySlip() {
        $id = $this->request->param("id");
        $event = EventsPaySlip::get($id);
        if ($event) {
            $event->save([
                "status" => 1
            ]);
            return SBResponse::response($event);
        } else {
            return SBResponse::error("工条不存在");
        }
    }

    /**
     * TODO : 获取所有工资条事件
     */
    public function getPaySliplist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = EventsPaySlip::page($page)->limit($limit)->order('create_time desc')->select();
        foreach ($events as $event) {
            $event->more();
            //高级合伙人
            $pivot = PartnerPivot::where(['uid'=>$event->pid])->find();
            $sppivot = PartnerPivot::where(['uid'=>$pivot->pid])->find();
            $event['seniorPartner'] = Users::with(['roles'])->where(['id'=>$sppivot->uid])->find();
            $owned = array();
            $rtitles = array();
            foreach ($event['seniorPartner']['roles'] as $role) {
                $owned = array_merge($owned, [$role['id']]);
                $rtitles = array_merge($rtitles, [$role['title']]);
            }
            $event['seniorPartner']['owned'] = $owned;
            $event['seniorPartner']['rtitles'] = $rtitles;

            //业务员
            $event['salesman'] = Users::get($event->factory->uid);

            //签单信息
            $event['signingInfo'] = FactorySigningInformation::where(['fid'=>$event->fid])->find();

            if ($event->type == "小时工工资条") {
                $event['slip'] = EventsPaySlipHourlyWorker::get($event['pwdid']);
            }
            if ($event->type == "同工同酬工资条") {
                $event['slip'] = EventsPaySlipEpfew::get($event['pwdid']);
            }
            if ($event->type == "代理招聘工资条") {
                $event['slip'] = EventsPaySlipAgent::get($event['pwdid']);
            }
        }
        return SBResponse::select($events, $page, $limit, EventsPaySlip::count());
    }

    /**
     * 删除工资条
     */
    public function deleteSlip() {
        $data = $this->request->param();
        if ($data['type'] == "小时工工资条") {
            $horly = EventsPaySlipHourlyWorker::where(['id'=>$data['pwdid']])->find();
            if ($horly) {
                $horly->delete($data['pwdid']);
            }
        }
        if ($data['type'] == "同工同酬工资条") {
            $horly = EventsPaySlipEpfew::where(['id'=>$data['pwdid']])->find();
            if ($horly) {
                $horly->delete($data['pwdid']);
            }
        }
        if ($data['type'] == "代理招聘工资条") {
            $horly = EventsPaySlipAgent::where(['id'=>$data['pwdid']])->find();
            if ($horly) {
                $horly->delete($data['pwdid']);
            }
        }
        $event = EventsPaySlip::where(['id'=>$data['id']])->find();
        if ($event) {
            $event->delete($data['id']);
        }
        return SBResponse::response($event);
    }

    public function getMoney() {
        $uid = $this->request->param("uid");
        $type = $this->request->param("type");

        $data = null;
        if ($type == RolesType::dandankj) {
            $data = EnterpriseCommission::where(["dandanId"=>$uid, "status"=> 0, "status"=>1])->select();
        }
        if ($type == RolesType::resident_teacher) {
            $data = EnterpriseCommission::where(["teacherId"=>$uid, "status"=> 0, "status"=>1])->select();
        }
        if ($type == RolesType::salesman) {
            $data = EnterpriseCommission::where(["salesmanId"=>$uid, "status"=> 0, "status"=>1])->select();
        }
        if ($type == RolesType::junior_partner) {
            $data = EnterpriseCommission::where(["primaryId"=>$uid, "status"=> 0, "status"=>1])->select();
        }
        if ($type == RolesType::senior_partner) {
            $data = EnterpriseCommission::where(["advancedId"=>$uid, "status"=> 0, "status"=>1])->select();
        }
        if ($type == RolesType::strategic_alliance) {
            $data = EnterpriseCommission::where(["strategicId"=>$uid, "status"=> 0, "status"=>1])->select();
        }

        return SBResponse::response($data);

    }

    /**
     * 发工资
     */
    public function payWage() {
        $data = $this->request->param();
        $type = $this->request->param("type");

        $slip = EventsPaySlip::where(['id'=>$data['id']])->find();
        $factory = FactoryBasicInformation::where(['id'=>$slip->fid])->find();
        $factory->signingInformation;

//        $jpush = new JPushServers();
        if ($type == "小时工工资条") {
            $hourlyWorker = EventsPaySlipHourlyWorker::where(['id'=>$data['pwdid']])->find();
            $hourlyWorker->save([
                'status' => 1
            ]);
            if ($data['status'] == 1) {
                //驻场老师提成
                Dividend::create([
                    "uid" => $slip->tuid,
                    "amount" => $hourlyWorker->resident_teacher_commission,//驻场老师提成
                    "wages" => $hourlyWorker->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::resident_teacher,
                    "type" => "小时工",
                    "proportion" => $factory->signingInformation->commission_for_teacher,//驻场老师提成比例
                ]);
                $tuser = Users::where(['id'=>$slip->tuid])->find();
//                $jpush->pushOne($tuser->phone, '【驻场提成】', "你得到了有一笔驻场提成");

                //业务员提成
                Dividend::create([
                    "uid" => $factory->uid,
                    "amount" => $hourlyWorker->salesperson_commission,//业务员提成
                    "wages" => $hourlyWorker->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::salesman,
                    "type" => "小时工",
                    "proportion" => $factory->signingInformation->commission_for_salesman,//业务员提成比例
                ]);
                $fuser = Users::where(['id'=>$factory->uid])->find();
//                $jpush->pushOne($fuser->phone, '【业务提成】', "你得到了有一笔业务提成");
                //战略
                $strategic = StrategicAlliance::where(['id'=>$slip->sid])->find();
                // 蛋蛋
                Dividend::create([
                    "uid" => 0,
                    "amount" => $hourlyWorker->dividend,//战略分红
                    "wages" => $hourlyWorker->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::dandankj,
                    "type" => "小时工",
                    "proportion" => $strategic->dd_dividend,//战略分红分红比例
                ]);
                //战略分红
                Dividend::create([
                    "uid" => $strategic->uid,
                    "amount" => $hourlyWorker->strategic_dividend,//战略分红
                    "wages" => $hourlyWorker->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::strategic_alliance,
                    "type" => "小时工",
                    "proportion" => $strategic->sa_dividend,//战略分红分红比例
                ]);
                $suser = Users::where(['id'=>$strategic->uid])->find();
//                $jpush->pushOne($suser->phone, '【战略分红】', "你得到了有一笔战略分红");
                //高级合伙人分红
                $pivot = PartnerPivot::where(['uid'=>$slip->pid])->find();
                Dividend::create([
                    "uid" => $pivot->pid,
                    "amount" => $hourlyWorker->advanced_dividend,//高级合伙人分红
                    "wages" => $hourlyWorker->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::senior_partner,
                    "type" => "小时工",
                    "proportion" => $strategic->sp_dividend,//高级合伙人分红比例
                ]);
                $psuser = Users::where(['id'=>$pivot->pid])->find();
//                $jpush->pushOne($psuser->phone, '【高级分红】', "你得到了有一笔高级分红");
                //初级合伙人分红
                Dividend::create([
                    "uid" => $slip->pid,
                    "amount" => $hourlyWorker->primary_dividend,//驻场老师提成
                    "wages" => $hourlyWorker->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::junior_partner,
                    "type" => "小时工",
                    "proportion" => $strategic->jp_dividend,//初级合伙人分红比例
                ]);
                $pauser = Users::where(['id'=>$slip->pid])->find();
//                $jpush->pushOne($pauser->phone, '【初级分红】', "你得到了有一笔初级分红");
            }
            $enterprises = EnterpriseCommission::where(["uid"=>$data["uid"], "jid"=>$slip->jid])->select();
            foreach ($enterprises as $enterprise) {
                $enterprise->save([
                    "status"=>1
                ]);
            }
        }

        if ($type == "同工同酬工资条") {
            $epfew = EventsPaySlipEpfew::where(['id'=>$data['pwdid']])->find();
            $epfew->save([
                'status' => 1
            ]);
            if ($data['status'] == 1) {
                //驻场老师提成
                Dividend::create([
                    "uid" => $slip->tuid,
                    "amount" => $epfew->resident_teacher_commission,//驻场老师提成
                    "wages" => $epfew->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::resident_teacher,
                    "type" => "同工同酬",
                    "proportion" => $factory->signingInformation->commission_for_teacher,//驻场老师提成比例
                ]);
                $tuser = Users::where(['id'=>$slip->tuid])->find();
//                $jpush->pushOne($tuser->phone, '【驻场提成】', "你得到了有一笔驻场提成");
                //业务员提成
                Dividend::create([
                    "uid" => $factory->uid,
                    "amount" => $epfew->salesperson_commission,//驻场老师提成
                    "wages" => $epfew->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::salesman,
                    "type" => "同工同酬",
                    "proportion" => $factory->signingInformation->commission_for_salesman,//业务员提成比例
                ]);
                $fuser = Users::where(['id'=>$factory->uid])->find();
//                $jpush->pushOne($fuser->phone, '【业务提成】', "你得到了有一笔业务提成");
                //战略
                $strategic = StrategicAlliance::where(['id'=>$slip->sid])->find();
                // 蛋蛋分红
                Dividend::create([
                    "uid" => 0,
                    "amount" => $epfew->dividend,//战略分红
                    "wages" => $epfew->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::dandankj,
                    "type" => "同工同酬",
                    "proportion" => $strategic->dd_dividend,//战略分红分红比例
                ]);
                //战略分红
                Dividend::create([
                    "uid" => $strategic->uid,
                    "amount" => $epfew->strategic_dividend,//战略分红
                    "wages" => $epfew->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::strategic_alliance,
                    "type" => "同工同酬",
                    "proportion" => $strategic->sa_dividend,//战略分红分红比例
                ]);
                $sauser = Users::where(['id'=>$strategic->uid])->find();
//                $jpush->pushOne($sauser->phone, '【战略分红】', "你得到了有一笔战略分红");
                //高级合伙人分红
                $pivot = PartnerPivot::where(['uid'=>$slip->pid])->find();
                Dividend::create([
                    "uid" => $pivot->pid,
                    "amount" => $epfew->advanced_dividend,//高级合伙人分红
                    "wages" => $epfew->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::senior_partner,
                    "type" => "同工同酬",
                    "proportion" => $strategic->sp_dividend,//高级合伙人分红比例
                ]);
                $psuser = Users::where(['id'=>$pivot->pid])->find();
//                $jpush->pushOne($psuser->phone, '【高级分红】', "你得到了有一笔高级分红");
                //初级合伙人分红
                Dividend::create([
                    "uid" => $slip->pid,
                    "amount" => $epfew->primary_dividend,//驻场老师提成
                    "wages" => $epfew->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::junior_partner,
                    "type" => "同工同酬",
                    "proportion" => $strategic->jp_dividend,//初级合伙人分红比例
                ]);
                $pauser = Users::where(['id'=>$slip->pid])->find();
//                $jpush->pushOne($pauser->phone, '【初级分红】', "你得到了有一笔初级分红");

                $enterprises = EnterpriseCommission::where(["uid"=>$data["uid"], "jid"=>$slip->jid])->select();
                foreach ($enterprises as $enterprise) {
                    $enterprise->save([
                        "status"=>1
                    ]);
                }
            }


        }

        if ($type == "代理招聘工资条") {
            $agent = EventsPaySlipAgent::where(['id'=>$data['pwdid']])->find();
            $agent->save([
                'status' => 1
            ]);
            if ($data['status'] == 1) {
                //驻场老师提成
                Dividend::create([
                    "uid" => $slip->tuid,
                    "amount" => $agent->resident_teacher_commission,//驻场老师提成
                    "wages" => $factory->signingInformation->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::resident_teacher,
                    "type" => "代理招聘",
                    "proportion" => $factory->signingInformation->commission_for_teacher,//驻场老师提成比例
                ]);
                $tuser = Users::where(['id'=>$slip->tuid])->find();
//                $jpush->pushOne($tuser->phone, '【驻场提成】', "你得到了有一笔驻场提成");
                //业务员提成
                Dividend::create([
                    "uid" => $factory->uid,
                    "amount" => $agent->salesperson_commission,//驻场老师提成
                    "wages" => $factory->signingInformation->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::salesman,
                    "type" => "代理招聘",
                    "proportion" => $factory->signingInformation->commission_for_salesman,//业务员提成比例
                ]);
                //战略
                $strategic = StrategicAlliance::where(['id'=>$slip->sid])->find();
                // 蛋蛋分红
                Dividend::create([
                    "uid" => 0,
                    "amount" => $agent->dividend,//战略分红
                    "wages" => $factory->signingInformation->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::dandankj,
                    "type" => "代理招聘",
                    "proportion" => $strategic->dd_dividend,//战略分红分红比例
                ]);

                //战略分红
                Dividend::create([
                    "uid" => $strategic->uid,
                    "amount" => $agent->strategic_dividend,//战略分红
                    "wages" => $factory->signingInformation->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::strategic_alliance,
                    "type" => "代理招聘",
                    "proportion" => $strategic->sa_dividend,//战略分红分红比例
                ]);
                $sauser = Users::where(['id'=>$strategic->uid])->find();
//                $jpush->pushOne($sauser->phone, '【战略分红】', "你得到了有一笔战略分红");
                //高级合伙人分红
                $pivot = PartnerPivot::where(['uid'=>$slip->pid])->find();
                Dividend::create([
                    "uid" => $pivot->pid,
                    "amount" => $agent->advanced_dividend,//高级合伙人分红
                    "wages" => $factory->signingInformation->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::senior_partner,
                    "type" => "代理招聘",
                    "proportion" => $strategic->sp_dividend,//高级合伙人分红比例
                ]);
                $psuser = Users::where(['id'=>$pivot->pid])->find();
//                $jpush->pushOne($psuser->phone, '【高级分红】', "你得到了有一笔高级分红");
//                初级合伙人分红
                Dividend::create([
                    "uid" => $slip->pid,
                    "amount" => $agent->primary_dividend,//初级合伙人分红
                    "wages" => $factory->signingInformation->employee_unit_price,
                    "fid" => $slip->fid,
                    "jid" => $slip->jid,
                    "rid" => RolesType::junior_partner,
                    "type" => "代理招聘",
                    "proportion" => $strategic->jp_dividend,//初级合伙人分红比例
                ]);
//                $pauser = Users::where(['id'=>$slip->pid])->find();
//                $jpush->pushOne($pauser->phone, '【初级分红】', "你得到了有一笔初级分红");

                $enterprises = EnterpriseCommission::where(["uid"=>$data["uid"], "jid"=>$slip->jid])->select();
                foreach ($enterprises as $enterprise) {
                    $enterprise->save([
                        "status"=>1
                    ]);
                }
            }
        }
        return SBResponse::response($data);
    }


}