<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/3
 * Time: 5:57 AM
 */

namespace app\index\Controller;


use app\_Base\controller\SBResponse;
use app\common\model\FactorySigningInformation;
use app\common\model\FactoryStaff;
use app\common\model\Friends;
use app\common\model\PartnerPivot;
use app\common\model\RolesPivot;
use app\common\model\RolesType;
use app\common\model\StrategicAlliance;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use app\common\validate\UserValidate;


use JMessage\IM\User as JUser;
use JMessage\JMessage;
use JPush\Client as JPush;
use think\App;
use think\Controller;



class Account extends Controller
{
    private $appKey;
    private $masterSecret;
    private $juser;
    private $push;

    public function __construct(App $app = null){
        parent::__construct($app);

        $this->appKey = '79778172c79dd53e94bb6ae5';
        $this->masterSecret = '12b1d5eeb2f5f0d349576d31';

        $jm = new JMessage($this->appKey, $this->masterSecret);
        /// 极光推送
        $this->push = new JPush($this->appKey, $this->masterSecret);
        $this->juser = new JUser($jm);

    }

    /**
     * 获取上级ID
     */
    public function getPrimaryId() {
        $uid = $this->request->param("uid");

        $partener = PartnerPivot::where(["uid"=>$uid])->find();
        $user = Users::where(["id"=>$partener["pid"]])->find();
        $user->more();
        $partener["strategicId"] = $user["strategic"]["uid"];
        return SBResponse::response($partener);
    }

    /**
     * 查询上级公司
     */
    public function getStrategicInfo() {
        $pid = $this->request->param("pid");

        $partener = PartnerPivot::where(["uid"=>$pid])->find();

        $stategic = StrategicAlliance::where(["id"=>$partener->sid])->find();
        return SBResponse::response($stategic);
    }

    /**
     * 创建账号
     */
    public function createAccount() {
        $data = $this->request->only(["phone", "password"]);
        $user = Users::where(['phone'=>$data['phone']])->find();
//        return SBResponse::response($user);
        if ($data["phone"] && $data["password"]) {
            $data["password"] = md5($data["password"]);

            $user = Users::where(['phone'=>$data['phone']])->find();
            if ($user) {
                return SBResponse::response("", 201, "该手机已注册");
            }

            $data['birthday'] = time();
            $user = Users::create($data);

            /// TODO：添加普通用户角色
            $roles = RolesPivot::where(["uid"=>$user->id, "rid"=>RolesType::ordinary_users])->find();
            if (!$roles) {
                RolesPivot::create([
                    "rid" => RolesType::ordinary_users,
                    "uid" => $user->id,
                    "title" => "普通用户"
                ]);
            }

            /// TODO: 创建钱包
            $wallet = WalletVirtual::where(['uid'=>$user->id])->find();
            if (!$wallet) {
                WalletVirtual::create(["uid" => $user->id]);
            }
            /// TODO：IM注册
            $this->juser->register($data["phone"], "123456789");
            $this->juser->updatePassword($data["phone"], "123456789");

            return SBResponse::response($user);
        } else {
            return SBResponse::response("", 201, "手机和密码不能为空");
        }
    }

    /**
     * 通过手机号和密码获取用户信息
     */
    public function getInfo() {

        $data = $this->request->only(['phone']);
        if ($data["phone"]) {
            $user = Users::where(["phone"=>$data["phone"]])->find();
            if ($user) {
                $user->more();

                return SBResponse::response($user);
            } else {
                return SBResponse::error("手机或密码不正确");
            }
        } else {
            return SBResponse::response("", 201, "手机和密码不能为空");
        }
    }

    /**
     * 通过ID获取用户信息
     */
    public function get() {
        $uid = $this->request->only('uid');
        $user = Users::where(['id'=>$uid])->find();
        $user->more();
        return SBResponse::response($user);
    }

    /**
     * 通过邀请码获取用户信息
     */
    public function getInfoByCode() {
        $data = $this->request->only("code");
        if ($data["code"]) {

            $user = Users::where(["code"=>$data["code"]])->find();
            if ($user) {
//                $user->more();
                return SBResponse::response($user);
            } else {
                return SBResponse::error("该用户不存在");
            }
        } else {
            return SBResponse::response("", 201, "邀请码不能为空");
        }
    }

    /**
     * 通过手机号获取用户信息
     */
    public function getInfoByPhone() {
        $data = $this->request->only("phone");
        if ($data["phone"]) {

            $user = Users::where(["phone"=>$data["phone"]])->find();
            if ($user) {
                $user->more();
                return SBResponse::response($user);
            } else {
                return SBResponse::error("该用户不存在");
            }
        } else {
            return SBResponse::response("", 201, "手机不能为空");
        }
    }

    /**
     * 用户登陆
     */
    public function login() {
        $data = $this->request->only(['phone', "password"]);
        if ($data["phone"] && $data["password"]) {
            $data["password"] = md5($data["password"]);
            $user = Users::where(["phone"=>$data["phone"], "password"=>$data['password']])->find();
            if ($user) {
                return SBResponse::response(jwt_encode($user->id));
            } else {
                return SBResponse::error("手机或密码不正确!");
            }
        } else {
            return SBResponse::response("", 201, "手机和密码不能为空");
        }
    }

    /**
     * 后台登录
     */
    public function admin()
    {
        $data = $this->request->only(['phone', 'password', 'vercode']);

        $userValidate = new UserValidate;
        if (!$userValidate->check($data)) {
            return SBResponse::error($userValidate->getError());
        }
        $user = Users::where(['phone' => $data['phone']])->find();
        if ($user) {
            if ($user->isAdmin == 0) {
                return  SBResponse::error("权限不足");
            } else {
                return SBResponse::response(['token' => jwt_encode($user->id)]);
            }
        } else {
            return SBResponse::error("用户不存在");
        }
    }

    /**
     * 通过token获取用户信息
     */
    public function getInfoByToken() {
        $data = $this->request->header("token");

        if ($data) {
            $uid = jwt_uncode($data);
            $user = Users::get($uid);


            if ($user) {
                $user->more();
                foreach ($user->teachers as $teacher) {
                    $teacher["sigingInformation"] = FactorySigningInformation::where(['fid'=>$teacher['id']])->find();
                }
                $owned = array();

                foreach ($user->roles as $role) {
                    $owned = array_merge($owned, [$role['id']]);
//                    if ($role['id'] == RolesType::ordinary_users) {
//                        $owned = array_merge($owned, [RolesType::ordinary_users]);
//                    } else if ($role['id'] == RolesType::member) {
//                        $owned = array_merge($owned, [RolesType::member]);
//                    } else if ($role['id'] == RolesType::worker) {
//                        $owned = array_merge($owned, [RolesType::worker]);
//                    } else if ($role['id'] == RolesType::junior_partner) {
//                        $owned = array_merge($owned, [RolesType::junior_partner]);
//                    } else if ($role['id'] == RolesType::senior_partner) {
//                        $owned = array_merge($owned, [RolesType::senior_partner]);
//                    } else if ($role['id'] == RolesType::strategic_alliance) {
//                        $owned = array_merge($owned, [RolesType::strategic_alliance]);
//                    } else if ($role['id'] == RolesType::resident_teacher) {
//                        $owned = array_merge($owned, [RolesType::resident_teacher]);
//                    } else if ($role['id'] == RolesType::salesman) {
//                        $owned = array_merge($owned, [RolesType::salesman]);
//                    }
                }
                $user["owned"] = $owned;

                return SBResponse::response($user);
            } else {
                return SBResponse::error("该用户不存在");
            }
        } else {
            return SBResponse::error("缺少token");
        }
    }

    /**
     * 绑定邀请码
     */
    public function bindInvitationCode() {
        $data = $this->request->only("code");
        $token = $this->request->header("token");
        if (!$token) {
            return SBResponse::error("缺少token");
        }
        if (!$data['code']) {
            return SBResponse::error("邀请码不能为空");
        } else {
            $puser = Users::where(['code'=>$data['code']])->find();
            if ($puser != null) {

                $user = Users::fromToken();
                $user->more();
                if ($user->company != null || $user->partner != null) {
                    return SBResponse::error("你已经绑定过了");
                }

                $strategic = StrategicAlliance::where(['uid'=>$puser->id])->find();
                $pivot = PartnerPivot::where(['uid'=>$puser->id])->find();
                PartnerPivot::create([
                    "uid" => $user->id,
                    "pid" => $puser->id, // 上级ID
                    // 如果邀请码自己是战略就绑定邀请码的战略,如果邀请码不是战略,就绑定邀请码的所属战略
                    "sid" => $strategic == null ? $pivot->sid : $strategic->id
                ]);
                $pivot = RolesPivot::where(["uid"=>$user->id, "rid"=>RolesType::member])->find();
                if (!$pivot) {
                    RolesPivot::create([
                        "rid" => RolesType::member,
                        "uid" => $user->id,
                        "title" => "准工人"
                    ]);

//                    $jpush = new JPushServers();
//                    $jpush->pushOne($user->phone,  "【角色升级】", "恭喜你成为了会员");
//                    $jpush->pushOne($puser->phone,  "【绑定邀请码】", "你有一个新的下级会员");
                }

                return SBResponse::response($user);
            } else {
                return SBResponse::error("邀请码用户不存在");
            }
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
     * 获取白名单列表
     */
    public function getWhitelist() {

        $page = $this->request->param("page");
        if (!$page) {
            $page = 1;
        }
        $limit = $this->request->param("limit");
        if (!$limit) {
            $limit = 100;
        }

        $users = Users::where(['isDeath'=>0])->page($page)->limit($limit)->order('id desc')->select();
        foreach ($users as $user) {
            $user->more();
            if ($user->partner) {
                $user->partner->user->more();
            }
        }
        return json(["data"=>$users, "page"=>$page, 'limit'=>$limit, 'code' => 0, 'count'=>Users::where(['isDeath'=>0])->count()]);
    }


    /**
     * 设为白名单
     */
    public function makeWhitelist() {
        $uid = $this->request->only('uid');
        $user = Users::where(['id'=>$uid])->find();
        if ($user) {
            $user->save([
                "isDeath" => 0
            ]);
        }
        return SBResponse::response($user);
    }

    /**
     * 获取黑名单列表
     */
    public function getBlacklist() {

        $page = $this->request->param("page");
        $limit = $this->request->param("limit");

        $users = Users::where(['isDeath'=>1])->page($page)->limit($limit)->select();
        foreach ($users as $user) {
            $user->more();
        }
        return json(["data"=>$users, "page"=>$page, 'limit'=>$limit, 'code' => 0, 'count'=>Users::where(['isDeath'=>1])->count()]);
    }

    /**
     * 设为黑名单
     */
    public function makeBlacklist() {
        $uid = $this->request->only('uid');
        $user = Users::where(['id'=>$uid])->find();
        if ($user) {
            $user->save([
                "isDeath" => 1
            ]);
        }
        return SBResponse::response($user);
    }

    /**
     * 设为超级管理员
     */
    public function makeAdmin() {
        $uid = $this->request->only('uid');
        $user = Users::where(['id'=>$uid])->find();
        if ($user) {
            $user->save([
                "isAdmin" => 1
            ]);
        }
        return SBResponse::response($user);
    }

    /**
     * 删除超级管理员
     */
    public function unmakeAdmin() {
        $uid = $this->request->only('uid');
        $user = Users::where(['id'=>$uid])->find();
        if ($user) {
            $user->save([
                "isAdmin" => 0
            ]);
        }
        return SBResponse::response($user);
    }

    /**
     * 修改用户名
     */
    public function setUserName() {
        $username = $this->request->param("username");
        $user = Users::fromToken();
        if ($user || $username) {
            $user->save([
                "username" => $username
            ]);
//            /// TODO: 修改用户名
//            $appKey = 'b1ee7d2fd69c7f9c5c26cd07';
//            $masterSecret = '3289f09d747eaf43f76b608e';
//            $jm = new JMessage($appKey, $masterSecret);
//            $jmuser = new User($jm);
//            $jmuser->upda($user->phone, "123456789");
            return SBResponse::response($user);
        } else {
            return SBResponse::error("缺少参数");
        }
    }

    /**
     * 修改用户性别
     */
    public function setUserSex() {
        $sex = $this->request->param("sex");
        $user = Users::fromToken();
        if ($user || $sex) {
            $user->save([
                "sex" => $sex
            ]);
            return SBResponse::response($user);
        } else {
            return SBResponse::error("缺少参数");
        }
    }

    /**
     * 修改用户生日
     */
    public function setBirthday() {
        $birthday = $this->request->param("birthday");
        $age = $this->request->param("age");
        $user = Users::fromToken();
        if ($user && $birthday && $age) {
            $user->save([
                "birthday" => $birthday,
                "age" => $age
            ]);
            return SBResponse::response($user);
        } else {
            return SBResponse::error("缺少参数");
        }
    }

    /**
     * 修改头像
     */
    public function setAvatar() {
        $url = $this->request->param("url");
        $user = Users::fromToken();
        if ($user && $url) {
            $user->save([
                "avatar" => $url
            ]);
            return SBResponse::response($user);
        } else {
            return SBResponse::error("缺少参数");
        }
    }

    /**
     * 获取角色类型列表
     */
    public function getRoleslist() {
        $roleslist = RolesType::all();
        return SBResponse::response($roleslist);
    }

    /**
     * 设置管理员
     */
    public function setAdmin() {
        $data = $this->request->only(['phone', 'isAdmin']);
        $user = Users::where(['phone'=>$data['phone']])->find();
        if ($user) {
            $user->save([
                'isAdmin' => $data['isAdmin']
            ]);
        }
        return SBResponse::response($user);
    }

    /**
     * 修改密码
     */
    public function setPassword() {
        $phone = $this->request->param("phone");
        $password = $this->request->param("password");
        if (!$password) {
            return SBResponse::error("密码不能为空");
        }
        $user = Users::where(['phone'=>$phone])->find();
        if ($user) {
            $user->save([
                "password" => md5($password)
            ]);
            return SBResponse::response();
        } else {
            return SBResponse::error("用户不存在");
        }
    }

    /**
     * 申请好友
     */
    public function addFriend() {
        $fuid = $this->request->param("fuid");
        $tuid = $this->request->param("tuid");

        $friend = Friends::where(["tuid"=>$tuid, "fuid"=>$fuid])->find();
        if ($friend) {
            if ($friend->status == 0) {
                return SBResponse::error("等待对方同意");
            } else {
                return SBResponse::error("你们已是好友");
            }
        } else {
            $friend = Friends::create([
                "fuid" => $fuid,
                "tuid" => $tuid
            ]);
            return SBResponse::response($friend);
        }
    }

    /**
     * 获取好友申请列表
     */
    public function getFriends() {
        $uid = $this->request->param("uid");
        $friends = Friends::where(["status"=>0, "tuid"=>$uid])->select();

        $fs = [];
        $count = 0;
        foreach ($friends as $friend) {

            $friend["user"] = Users::find($friend["fuid"]);
            $fs[$count] = $friend;
            $count ++;
        }
        return SBResponse::response($fs);
    }

    /**
     * 同意好友申请
     */
    public function acceptInvitation() {
        $id = $this->request->param("id");
        $friend = Friends::find($id);
        $friend->save([
            "status" => 1
        ]);
        return SBResponse::response($friend);
    }

  /**
   * 拒绝好友申请
   */
    public function declineInvitation() {
        $id = $this->request->param("id");
        $friend = Friends::find($id);
        $friend->delete($id);
        return SBResponse::response($friend);
  }

    /**
     * 搜索用户
     */
    public function searchKeyword() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $keyword = $this->request->param("keyword");
        if(is_numeric($keyword)){
            //是数字
            $users = Users::where('phone','like',"%".$keyword."%")
                ->where(['isDeath'=>0])->page($page)->limit($limit)->select();
            return SBResponse::response($users);
        } else {
            //不是数字
            $users = Users::where("username", 'like', '%'.$keyword.'%')
                ->where(["isDeath"=>0])->page($page)->limit($limit)
                ->all();
            return SBResponse::response($users);
        }
    }

    /**
     * 搜索用户
     */
    public function searchuser() {
        $keyword = $this->request->param("keyword");
        if(is_numeric($keyword)){
            //是数字
            $users = Users::where('phone','like',"%".$keyword."%")
                ->where(['isDeath'=>0])->select();
            return SBResponse::response($users);
        } else {
            //不是数字
            $users = Users::where("username", 'like', '%'.$keyword.'%')
                ->where(["isDeath"=>0])->all();
            return SBResponse::response($users);
        }
    }

    /**
     * 更新registrationID
     */
    public function registrationID() {

        $registrationID = $this->request->param("registrationID");
        $user = Users::fromToken();
        if ($user) {
            $user->save([
                "registrationID" => $registrationID
            ]);
            return  SBResponse::response();
        } else {
            return SBResponse::error("缺少token");
        }
    }

    /**
     * useradmin
     */
    public function useradmin() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $rid = $this->request->param("rid");

        $condition = [
            RolesType::resident_manager,
            RolesType::resident_teacher,
            RolesType::salesman,
            RolesType::ministry_of_personnel,
            RolesType::finance_department,
        ];
        $users = Users::where(["isAdmin"=>1])->select();
        $ruser = [];
        foreach ($users as $user) {
            $user->more();
            $ruser[] = $user;
            if ($rid == "-1") {
                if (count(array_intersect($user['owned'], $condition)) > 0) {

                }
            }
            if ($rid == RolesType::salesman) {
                // 业务员
                if (count(array_intersect($user['owned'], [RolesType::salesman])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::resident_manager) {
                // 驻场经理
                if (count(array_intersect($user['owned'], [RolesType::resident_manager])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::ministry_of_personnel) {
                // 人事部
                if (count(array_intersect($user['owned'], [RolesType::ministry_of_personnel])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::finance_department) {
                // 财务部
                if (count(array_intersect($user['owned'], [RolesType::finance_department])) > 0) {
                    $ruser[] = $user;
                }
            }
        }

        return SBResponse::select($ruser,$page,$limit,count($ruser));
    }

    /**
     * 获取驻场经理列表
     */
    public function getResidentManager() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $pivotes = RolesPivot::where(['rid'=>RolesType::resident_manager])->page($page)->limit($limit)->select();
        foreach ($pivotes as $pivote) {
            $pivote->more();
        }
        return SBResponse::select($pivotes, $page, $limit, RolesPivot::where(['rid'=>RolesType::resident_manager])->count());
    }
    /**
     * 获取不是驻场经理的用户
     */
    public function getUnresidentManager() {

        $pivotes = RolesPivot::where('rid', '<', RolesType::resident_manager)->all();
        foreach ($pivotes as $pivote) {
            $pivote->more();
        }
        return SBResponse::response($pivotes);
    }

    /**
     * 添加驻场经理
     */
    public function addResidentManager() {
        $uid = $this->request->param("uid");
        $pivot = RolesPivot::where(['uid'=>$uid, "rid"=>RolesType::resident_manager])->find();
        if (!$pivot) {
            RolesPivot::create([
                "uid" => $uid,
                "rid" => RolesType::resident_manager,
                "title" => "驻场经理"
            ]);
            return SBResponse::response();
        } else {
            return SBResponse::error("该用户已经是驻场经理了");
        }

    }

    /**
     * 删除驻场经理角色
     */
    public function delResidentManager() {
        $uid = $this->request->param("uid");
        $pivot = RolesPivot::where(['uid'=>$uid, "rid"=>RolesType::resident_manager])->find();
        if ($pivot) {
            $pivot->delete($pivot->id);
            return SBResponse::response();
        } else {
            return SBResponse::error("该用户不是驻经理");
        }
    }

    /**
     * 获取不是后台管理用户
     */
    public function getUnadminlist() {
        $users = Users::where(['isAdmin' => 0])->all();
        foreach ($users as $user) {
            $owned = array();
            $rtitles = array();
            foreach ($user->roles as $role) {
                $owned = array_merge($owned, [$role['id']]);
                $rtitles = array_merge($rtitles, [$role['title']]);
            }
            $user['owned'] = $owned;
            $user['rtitles'] = $rtitles;
        }
        return SBResponse::response($users);
    }

    /**
     * 设置后台角色
    1	普通用户
    2	会员
    3	工人
    4	初级合伙人
    5	高级合伙人
    6	准高级合伙人
    7	战略联盟
    8	驻场老师
    9	驻场经理
    10	工厂HR
    11	业务员
    12	人事部
    13	财务部
    14	总经理
    15	蛋蛋
    16	驻场经理
     */
    public function setAdminroles() {
        $rid = $this->request->param("rid");
        $uid = $this->request->param("uid");
        $checked = $this->request->param("checked");

        if (!$rid) {
            return SBResponse::error("缺少rid");
        }
        if (!$uid) {
            return SBResponse::error("缺少uid");
        }

        $pivote = RolesPivot::where(["uid"=>$uid, "rid"=>$rid])->find();

        $title = "";
        if ($rid == 9) {
            $title = "驻场经理";
        } elseif ($rid == 11) {
            $title = "业务员";
        } elseif ($rid == 12) {
            $title = "人事部";
        } elseif ($rid == 13) {
            $title = "财务部";
        } elseif ($rid == 14) {
            $title = "总经理";
        } elseif ($rid == 15) {
            $title = "蛋蛋";
        } elseif ($rid == 100) {
            $title = "管理员";
        }
        $user = Users::get($uid);
        if ($checked == 1) {
            $user->save([
                "isAdmin" => true
            ]);
            RolesPivot::create([
                "uid" => $uid,
                "rid" => $rid,
                "title" => $title
            ]);
        } else {
            if ($pivote) {
                $pivote->delete($pivote->id);
            }
            if ($rid == 100) {
                $user->save([
                    "isAdmin" => false
                ]);
            }
        }

        return SBResponse::response($pivote);
    }

    // 获取指定用户角色列表
    public function getRoles() {
        $rid = $this->request->param("rid");
        $pivotes = RolesPivot::where(["rid"=>$rid])->select();

        $ruser = [];
        foreach ($pivotes as $piv) {
            $user = Users::get($piv["uid"]);
            $user->more();

            if ($rid == "-1") {
                $ruser[] = $user;
            }
            if ($rid == RolesType::salesman) {
                // 业务员
                if (count(array_intersect($user['owned'], [RolesType::salesman])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::resident_manager) {
                // 驻场经理
                if (count(array_intersect($user['owned'], [RolesType::resident_manager])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::ministry_of_personnel) {
                // 人事部
                if (count(array_intersect($user['owned'], [RolesType::ministry_of_personnel])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::finance_department) {
                // 财务部
                if (count(array_intersect($user['owned'], [RolesType::finance_department])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::ceo) {
                // 总经理
                if (count(array_intersect($user['owned'], [RolesType::ceo])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::dandankj) {
                // 蛋蛋
                if (count(array_intersect($user['owned'], [RolesType::dandankj])) > 0) {
                    $ruser[] = $user;
                }
            }
            if ($rid == RolesType::admin) {
                // 后台管理员
                if (count(array_intersect($user['owned'], [RolesType::admin])) > 0) {
                    $ruser[] = $user;
                }
            }
        }
        return SBResponse::response($ruser);
    }

    // 获取指定角色用户列表
    public function getRoleUsers() {
        $rid = $this->request->param("rid");

    }

}