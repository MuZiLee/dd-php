<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Events;
use app\common\model\EventsLogs;
use app\common\model\EventsType;
use app\common\model\FactoryStaff;
use app\common\model\PartnerPivot;
use app\common\model\RolesPivot;
use app\common\model\RolesType;
use app\common\model\StrategicAlliance;
use app\common\model\Users;
use app\index\Type\Roles;
use think\App;
use think\Controller;

class PartnerManager extends Controller
{
    /**
     * 获取合伙人列表
     * type: 1:初级合伙人列表 2:高级事伙人列表 3:准高级合伙人列表 4:战略联盟合伙人列表
     */
    public function getList()
    {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $type = $this->request->param("type");

        $role_type = RolesType::junior_partner;
        if ($type == 1) {
            $role_type = RolesType::junior_partner;
        } else if ($type == 2) {
            $role_type = RolesType::senior_partner;
        } else if ($type == 3) {
            $role_type = RolesType::associate_senior_partner;
        } else if ($type == 4) {
            $role_type = RolesType::strategic_alliance;
        }

        $rolesType = RolesPivot::where(['rid' => $role_type])->page($page)->limit($limit)->order('create_time', 'asc')->select();
        foreach ($rolesType as $item) {
            $user = $item['user'];
            $user->more();
        }
        return json(["data" => $rolesType, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => RolesPivot::where(['rid' => $role_type])->count()]);
    }


    /// ------- 初级合伙人审核

    /**
     * 初级合伙人审核事件
     */
    public function auditAuniorPartner()
    {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $user = Users::fromToken();
        $events = Events::where(['etid' => EventsType::position_application, "pid" => $user->id])->select();
        foreach ($events as $event) {
            $event->more();
//            $event["user"]['company'] = StrategicAlliance::where(['uid'=>$event->uid])->find();
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where(['etid' => EventsType::strategic_alliance_application])->count()]);
    }

    /**
     * 报名审核
     */
    public function registrationReview()
    {
        $data = $this->request->param();
        $event = Events::get($data['eid']);
        if ($event) {
            $euser = Users::get($event->uid);
            $euser->more();
            if ($euser->staff != null) {
                return SBResponse::error("TA已经入职,无法审核");
            }

            $user = Users::fromToken();
            if (!$user) {
                return SBResponse::error("缺少token");
            }
            /// TODO: 初级合伙人审核职位报名
            $data['rid'] = RolesType::junior_partner;
            $data['uid'] = $user->id;
            EventsLogs::create($data);
            $event->more();
            return SBResponse::response($event);
        } else {
            return SBResponse::error("事件不存在");
        }
    }

    /**
     * 获取我的工人
     */
    public function getMyStafflist()
    {
        $user = Users::fromToken();
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $staffes = FactoryStaff::where(['pid' => $user->id, 'status' => 1])->page($page)->limit($limit)->select();
        foreach ($staffes as $staffe) {
            $staffe->user;
            $staffe->user["factory"] = $staffe->factory;
            $staffe->user["job"] = $staffe->job;
            unset($staffe->factory);
            unset($staffe->job);
        }
        return json(["data" => $staffes, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => FactoryStaff::where(['pid' => $user->id,'status'=>1])->count()]);
    }

    /**
     * TODO : 我的准工人
     */
    public function getMyPWorkerlist()
    {
        $user = Users::fromToken();
        $pivots = PartnerPivot::where(['pid' => $user->id])->all();

        $users = [];
        foreach ($pivots as $pivot) {
            $wuser = Users::where(['id'=>$pivot->uid])->find();
            if ($wuser != null) {
                if (!FactoryStaff::where(['uid' => $wuser->id, 'status' => 1])->find()) {
                    $users[] = $wuser;
                }
            }
        }
        return SBResponse::response($users);
    }

    /**
     * 删除报名事件
     */
    public function delete()
    {
        $eid = $this->request->param("eid");
        $event = Events::get($eid);
        $logs = EventsLogs::where(['eid' => $eid])->all();
        foreach ($logs as $log) {
            $log->delete($log["id"]);
        }
        $event->delete(['id' => $eid]);
        return SBResponse::response();
    }

    /**
     * TODO: 获取我的初级合伙人
     */
    public function getMyJuniorPartnerlist()
    {
        $user = Users::fromToken();
        //拿出我所有下级
        $subordinate = PartnerPivot::where(['pid' => $user->id])->all();
        $users = [];
        foreach ($subordinate as $item) {
            $suser = Users::with("roles")->get($item->uid);
            /// TODO: 这里可能因为旧数据的用户id,在新数据中找不到而suser == null
            if ($suser) {
                $owned = [];
                if ($suser->id != $user->id) {
                    foreach ($suser['roles'] as $key => $value) {
                        $owned[] = $value['id'];
                    }
                    if (in_array(RolesType::junior_partner, $owned)) {
                        $users[] = $suser;
                    }
                }
            }
        }
        return SBResponse::response($users);
    }

    /**
     * TODO: 获取我的高级合伙人
     */
    public function getMySeniorPartner()
    {
        $user = Users::fromToken();
        //拿出我所有下级
        $subordinate = PartnerPivot::where(['pid' => $user->id])->all();
        $users = [];
        foreach ($subordinate as $item) {
            $suser = Users::with("roles")->get($item->uid);
            /// TODO: 这里可能因为旧数据的用户id,在新数据中找不到而suser == null
            if ($suser) {
                $owned = [];
                if ($suser->id != $user->id) {
                    foreach ($suser['roles'] as $key => $value) {
                        $owned[] = $value['id'];
                    }
                    if (in_array(RolesType::senior_partner, $owned)) {
                        $users[] = $suser;
                    }
                }
            }
        }
        return SBResponse::response($users);
    }

    /**
     * TODO: 获取我的准高级合伙人
     */
    public function getMyASPartnerlist()
    {
        $user = Users::fromToken();
        //拿出我所有下级
        $subordinate = PartnerPivot::where(['pid' => $user->id])->all();
        $users = [];
        foreach ($subordinate as $item) {
            $suser = Users::with("roles")->get($item->uid);
            /// TODO: 这里可能因为旧数据的用户id,在新数据中找不到而suser == null
            if ($suser) {
                $owned = [];
                if ($suser->id != $user->id) {
                    foreach ($suser['roles'] as $key => $value) {
                        $owned[] = $value['id'];
                    }
                    if (in_array(RolesType::associate_senior_partner, $owned)) {
                        $users[] = $suser;
                    }
                }
            }
        }
        return SBResponse::response($users);
    }


    /**
     *这里最重要
     * 数据转换 stdClass Object转array
     * @access public
     */
    public function object_array($array)
    {
        if (is_object($array)) {
            $array = (array)$array;
        }
        if (is_array($array)) {
            foreach ($array as $key => $value) {
                if (!$value) {
                    $array[$key] = $value;
                } else {
                    $array[$key] = self::object_array($value);
                }
            }
        }
        return $array;
    }

    /**
     * 获取战略联盟合伙人列表
     */
    public function getStrategiclist()
    {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['etid' => EventsType::strategic_alliance_application])->page($page)->limit($limit)->select();
        return SBResponse::select($events, $page, $limit, Events::where(['etid' => EventsType::strategic_alliance_application])->count());
    }

    /**
     * TODO : 设置战略联盟信息
     * 初级分红 高级分红 战略分红 蛋蛋分红
     */
    public function setStrategicInfo()
    {
        $sid = $this->request->param("id");
        $data = $this->request->param();
        $strategic = StrategicAlliance::get($sid);
        if ($strategic) {
            $strategic->save($data);
        }
        return SBResponse::response($strategic);
    }

    /**
     * 获取战略信息
     */
    public function getStrategicInfor() {
        $sid = $this->request->param("sid");
        $strategic = StrategicAlliance::get($sid);
        return SBResponse::response($strategic);
    }
}