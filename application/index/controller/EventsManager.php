<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Events;
use app\common\model\EventsLogs;
use app\common\model\EventsType;
use app\common\model\PartnerPivot;
use app\common\model\RolesPivot;
use app\common\model\RolesType;
use app\common\model\StrategicAlliance;
use app\common\model\Users;
use think\Controller;

/**
 * 事件管理器
 * Class EventsManager
 * @package app\index\controller
 */
class EventsManager extends Controller
{

    /**
     * 事件列表
     */
    public function getEventList() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
            $event["partner"] = Users::where(["id"=>$event->pid])->find();
        }
        return SBResponse::response($events);
    }

    /**
     * 获取用户职位申请记录
     */
    public function getJobEvents() {
        $uid = $this->request->param("uid");
        $events = Events::where(["uid"=>$uid])->select();
        foreach ($events as $event) {
            $event->more();
            $event["partner"] = Users::where(["id"=>$event->pid])->find();
        }
        return SBResponse::response($events);
    }

    /**
     * 事件历史操作记录
     */
    public function getEventLogsList() {
        $eid = $this->request->param("eid");
        $logs = EventsLogs::where(["eid"=>$eid])->select();
        foreach ($logs as $log) {
            $log->more();
        }
        return SBResponse::response($logs);
    }

    /**
     * 后台创建战略联盟
     */
    public function adminCreateStrategic() {

        $uid = $this->request->param("uid");


        if (!$uid) {
            return SBResponse::error("缺少uid");
        }

        $user = Users::where(['id'=>$uid])->find();
        $user->more();

        $event = Events::where(["etid" => EventsType::strategic_alliance_application, "uid" => $uid])->find();
        if (!$event) {
            $event = Events::create([
                "uid" => $uid,
                "etid" => EventsType::strategic_alliance_application,
                "pid" => $user->partner != null ? $user->partner->pid : $uid
            ]);
            $strategicAlliance = StrategicAlliance::where(['uid'=>$user->id])->find();

            if (!$strategicAlliance) {
                $data['uid'] = $user->id;
                $data['province'] = "";
                $data['city'] = "";
                $data['county'] = "";
                $data['address'] = "";
                $data['name'] = $this->request->param("name");
                $data['sos_name'] = $this->request->param("sos_name");
                $data['sos_phone'] = $this->request->param("sos_phone");
                $data["dd_dividend"] = "11.0";//蛋蛋分红
                $data["sa_dividend"] = "27.5";//战略分红
                $data["sp_dividend"] = "16.5";//高级分红
                $data["jp_dividend"] = "45.0";//初级分红
                StrategicAlliance::create($data);
            }

            return SBResponse::response($event);
        } else {
            return SBResponse::error("请等待审核");
        }
    }
    /**
     * 添加角色申请事件
     * 初级合伙人 高级合伙人 战略联盟合伙人 业务员
     */
    public function addRolesApple() {
        $etid = $this->request->param("etid");
        $rid = $this->request->param("rid");
        $user = Users::fromToken();

        if (!$etid) {
            return SBResponse::error("缺少事件类型");
        }
        if (!$rid) {
            return SBResponse::error("缺少角色");
        }
        $event = Events::where(["etid"=>$etid, "uid"=>$user->id])->find();
        if ($event && $event["status"] == 2) {
            $event->delete();
            $event = null;
        }
        if (!$event) {
            $event = Events::create([
                "uid" => $user->id,
                "etid" => $etid,
                "pid" => $user->partner->pid
            ]);
            if ($etid == EventsType::strategic_alliance_application) {
                $strategicAlliance = StrategicAlliance::where(['uid'=>$user->id])->find();

                if (!$strategicAlliance) {
                    $data['uid'] = $user->id;
                    $data['province'] = $this->request->param("province");
                    $data['city'] = $this->request->param("city");
                    $data['county'] = $this->request->param("county");
                    $data['address'] = $this->request->param("address");
                    $data['name'] = $this->request->param("name");
                    $data['sos_name'] = $this->request->param("sos_name");
                    $data['sos_phone'] = $this->request->param("sos_phone");
                    $data["dd_dividend"] = "11.0";//蛋蛋分红
                    $data["sa_dividend"] = "27.5";//战略分红
                    $data["sp_dividend"] = "16.5";//高级分红
                    $data["jp_dividend"] = "45.0";//初级分红
                    StrategicAlliance::create($data);
                }
            }

            return SBResponse::response($event);
        } else {
            return SBResponse::error("请等待审核");
        }
    }

    /**
     * 事件审核
     */
    public function eventAudit() {
        $user = Users::fromToken();
        if (!$user) {
            return SBResponse::error("缺少token");
        }
        $eid = $this->request->param("eid");
        $rid = $this->request->param("rid");
        $remark = $this->request->param("remark");
        $status = $this->request->param("status");

        if (!$user) {
            return SBResponse::error("缺少token");
        }
        if (!$eid) {
            return SBResponse::error("缺少事件ID");
        }
        if (!$rid) {
            return SBResponse::error("缺少角色");
        }
        if (!$rid) {
            return SBResponse::error("缺少rid");
        }

        if (!$status) {
            return SBResponse::error("缺少事件状态");
        }

        $event = Events::where(['id'=>$eid])->find();
        $eventUser = Users::where(['id'=>$event->uid])->find();
        /// TODO: 审核初级合伙人申请
        if ($event->etid == EventsType::junior_partner_application && $status == 1) {
            $pivot = RolesPivot::where(['uid'=>$event->uid, "rid"=>RolesType::junior_partner])->find();
            if (!$pivot) {
                //创建初级合伙人角色
                RolesPivot::create([
                    "uid" => $event->uid,
                    "rid" => RolesType::junior_partner,
                    "title" => "初级合伙人"
                ]);
                /// TODO: 创建邀请码
                if (!$eventUser->code) {
                    $eventUser->save([
                        "code" => $this->getCode()
                    ]);
                }

//                $jpush = new JPushServers();
//                $jpush->pushOne($eventUser->phone, "【角色升级】", "恭喜你成为了初级合伙人");

                // 上级
                $pivot = PartnerPivot::where(['uid'=>$eventUser->id])->find();
                // 查询上级是不是高级合伙人
                if (!RolesPivot::where(['uid'=>$pivot->pid, "rid"=>RolesType::senior_partner])->find()) {
                    // 查询上级是不是准高级合伙人
                    if (!RolesPivot::where(['uid'=>$pivot->pid, "rid"=>RolesType::associate_senior_partner])->find()) {
                        // TODO : 创建准高级合伙人
                        RolesPivot::create([
                            'rid' => RolesType::associate_senior_partner,
                            "uid" => $pivot->pid,
                            "title" => "准高级合伙人"
                        ]);

//                        $puser = Users::where(['uid'=>$pivot->pid])->find();
//                        $jpush = new JPushServers();
//                        $jpush->pushOne($puser->phone, "【角色升级】", "恭喜你成为了准高级合伙人");
                    }
                }
            }
        }

        /// TODO: 审核高级合伙人角色申请
        if ($event->etid == EventsType::senior_partner_application && $status == 1) {
            /// TODO: 如果申请者是准高级合伙人就删除该角色
            $associate_senior_partner = RolesPivot::where(['uid'=>$event->uid, "rid"=>RolesType::associate_senior_partner])->find();
            if ($associate_senior_partner) {
                $associate_senior_partner->delete($associate_senior_partner->id);
            }

            $pivot = RolesPivot::where(['uid'=>$event->uid, "rid"=>RolesType::senior_partner])->find();
            if (!$pivot) {
                // TODO : 创建高级合伙人
                RolesPivot::create([
                    "rid" => RolesType::senior_partner,
                    "uid" => $event->uid,
                    "title" => "高级合伙人"
                ]);

//                $jpush = new JPushServers();
//                $jpush->pushOne($eventUser->phone, "【角色升级】", "恭喜你成为了高级合伙人");
            }
        }

        /// TODO: 审核战略联盟角色申请
        if ($event->etid == EventsType::strategic_alliance_application && $status == 1) {
            // TODO : 如果没有初级合伙人角色
            if (!RolesPivot::where(['uid'=>$eventUser->id, 'rid'=>RolesType::junior_partner])->find()) {

                /// TODO: 创建邀请码
                if (!$eventUser->code) {
                    $eventUser->save([
                        "code" => $this->getCode()
                    ]);
                }
                // 创建初级合伙人角色
                RolesPivot::create([
                    "uid" => $eventUser->id,
                    "rid" => RolesType::junior_partner,
                    "title" => "初级合伙人"
                ]);

//                $jpush = new JPushServers();
//                $jpush->pushOne($eventUser->phone, "【角色升级】", "恭喜你成为了初级合伙人");
            }
            /// TODO : 如果没有高级合伙人角色
            if (!RolesPivot::where(['uid'=>$eventUser->id, "rid"=>RolesType::senior_partner])->find()) {
                // 创建高级合伙人角色
                RolesPivot::create([
                    "uid" => $eventUser->id,
                    "rid" => RolesType::senior_partner,
                    "title" => "高级合伙人"
                ]);
//                $jpush = new JPushServers();
//                $jpush->pushOne($eventUser->phone, "【角色升级】", "恭喜你成为了高级合伙人");
            }
            $strategicAlliance = StrategicAlliance::where(['uid'=>$eventUser->id])->find();
            if ($strategicAlliance) {
                $strategicAlliance->save([
                    "status" => 1
                ]);
            }
            if (!RolesPivot::where(['uid'=>$eventUser->id, "rid"=>RolesType::strategic_alliance])->find()) {
                /// TODO: 添加战略联盟角色
                RolesPivot::create([
                    "uid" => $eventUser->id,
                    "rid" => RolesType::strategic_alliance,
                    "title" => "战略联盟"
                ]);

                /// TODO : 创建上级是自己
                if (!PartnerPivot::where(['uid'=>$eventUser->id])->find()) {
                    PartnerPivot::create([
                        "uid" => $eventUser->id,
                        "pid" => $eventUser->id,
                        'sid' => $strategicAlliance->id
                    ]);
                }
//                $jpush = new JPushServers();
//                $jpush->pushOne($eventUser->phone, "【角色升级】", "恭喜你成为了战略联盟");
            }

        }

        /// TODO: 审核业务员角色申请
        if ($event->etid == EventsType::salesman_application && $status == 1) {
            $pivot = RolesPivot::where(['uid'=>$event->uid, "rid"=>RolesType::salesman])->find();
            if (!$pivot) {
                /// TODO: 创建业务员角色
                RolesPivot::create([
                    "uid" => $event->uid,
                    "rid" => RolesType::salesman,
                    "title" => "业务员"
                ]);
//                $jpush = new JPushServers();
//                $jpush->pushOne($eventUser->phone, "【角色升级】", "恭喜你成为了业务员");
            }
            $salesman = Users::get($event->uid);
            if ($salesman) {
                $salesman->save([
                    "isAdmin" => 1
                ]);
            }
        }

        if ($event) {
            //审核人
            $event->save([
                "status" => $status,
            ]);
            $event->logs()->save([
                "status" => $status,
                "rid" => $rid,
                "uid" => $user->id,
                "remark" => $remark,
            ]);
            $event->more();
            return SBResponse::response($event);
        } else {
            return SBResponse::error("事件不存在");
        }
    }

    /**
     * 创建邀请码
     */
    public function createCode() {
        $uid = $this->request->param("uid");
        $user = Users::get($uid);
        if ($user) {

            $partner = PartnerPivot::where(["uid"=>$user->id])->find();
            if (!$partner) {



            }

            $user->save([
                "code" => $this->getCode()
            ]);
            return SBResponse::response($user);
        } else {
            return SBResponse::error("用户不存在");
        }
    }

    /**
     * 计算邀请码
     */
    public function getCode($length = 5, $check = true) {
        $code = 0;
        for ($i = 1; $i <= $length; $i++) {
            $code = rand($i, 9) . $code;
        }
        /**
         * 判断数据库中是否存在被算出来的邀请码
         * 如果数据库中没这个邀请码再把邀请码返回
         */
        if ($check == true) {
            $user = Users::where(["code" => $code])->select();
            if (!$user->isEmpty()) {
                $this->getCode($length, $check);
            }
        }
        return $code;
    }

    /**
     * 获取我的申请事件
     */
    public function eventsListByMe() {
        $user = Users::fromToken();
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['uid'=>$user->id])->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
        }

        return SBResponse::response($events);
    }
    /**
     * 获取业务员申请事件
     */
    public function getSalesmanApplylist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['etid'=>EventsType::salesman_application])->select();
        foreach ($events as $event) {
            $event->more();
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where(['etid'=>EventsType::salesman_application])->count()]);
    }
    /**
     * 获取初级合伙人申请事件
     */
    public function getJuniorPartnerApplylist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['etid'=>EventsType::junior_partner_application])->select();
        foreach ($events as $event) {
            $event->more();
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where(['etid'=>EventsType::junior_partner_application])->count()]);
    }



    /**
     * 获取高级合伙人申请事件
     */
    public function getSeniorPartnerApplylist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['etid'=>EventsType::senior_partner_application])->select();
        foreach ($events as $event) {
            $event->more();
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where(['etid'=>EventsType::senior_partner_application])->count()]);
    }
    /**
     * 获取战略联盟合伙人申请事件
     */
    public function getStrategicAllianceApplylist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['etid'=>EventsType::strategic_alliance_application])->select();
        foreach ($events as $event) {
            $event->more();
            $event["user"]['company'] = StrategicAlliance::where(['uid'=>$event->uid])->find();
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where(['etid'=>EventsType::strategic_alliance_application])->count()]);
    }

    /**
     * TODO: 更新战略联盟合伙人公司信息
     */
    public function updateCompanyInfo() {
        $data = $this->request->param();
        $company = StrategicAlliance::get($data['id']);
        $company->save($data);
        return SBResponse::response($company);
    }

    /**
     * TODO: 删除事件
     */
    public function dele() {
        $eid = $this->request->param("id");
        $event = Events::get($eid);
        if ($event) {
            $logs = EventsLogs::where(["eid"=>$event->id])->all();
            foreach ($logs as $log) {
                $log->delete();
            }
            $event->delete();
            return SBResponse::response();
        } else {
            return SBResponse::error("事件不存在");
        }
    }

    /**
     * 获取战略联盟合伙人列表
     */
    public function getStrategiclist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['etid'=>EventsType::strategic_alliance_application])->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->etype;
            $event->user;
            $event->logs;
            $event["strategicAlliance"] = StrategicAlliance::where(['uid'=>$event->uid])->find();
        }
        return SBResponse::select($events, $page, $limit, Events::where(['etid'=>EventsType::strategic_alliance_application])->count());
    }

}