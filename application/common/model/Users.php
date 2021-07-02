<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/9
 * Time: 8:50 PM
 */

namespace app\common\model;

use think\Controller;
use think\facade\Request;
use think\Model;


class Users extends Model
{

    /**
     * 类型转换
     */
    protected $type = [
        'id'   =>  'integer',
        'code'  =>  'integer',
        'sex'  =>  'integer',
        'age'  =>  'integer',
        'said'  =>  'integer',
        'birthday'  =>  'timestamp:Y/m/d',
        'login_time' => 'timestamp'
    ];

    protected $autoWriteTimestamp = true;

    //只读字段
    protected $readonly = ["phone","id"];

    //隐藏字段
    protected $hidden = [
        "password"
    ];

    static public function fromToken() {
        $token = Request::header('token');
        if (!$token || $token == '') {
            return null;
        }

        $uid = jwt_uncode($token);
        if ($uid) {
            return self::with(['roles'])->where(['id'=>$uid])->find();
        } else {
            return null;
        }
    }

    static public function byToken() {
        $token = Request::header('token');
        if (!$token || $token == '') {
            return null;
        }
        $uid = jwt_uncode($token);
        return self::get($uid);
    }


    static public function infobyId($uid) {
        $user = self::with(['roles'])->where(['id'=>$uid])->find();
        $pivot = PartnerPivot::where(['uid'=>$uid])->find();
        if ($pivot) {
            $partner = self::where(['id'=>$pivot->pid])->find();
            $enterprise = Enterprise::where(["id"=>$pivot->eid])->find();

            $user->partner = $partner;
            $user->partner->enterprise = $enterprise;

        } else {
            $user->partner = null;
        }
        return $user;
    }


    public function more() {
        $this->roles;
        $this->partner;     // 我的上级
        $this->strategic;   //我的上级的战略
        $this->company;     //我的战略
        $this->teachers;    //我是驻场老师
        $this->hrs;         //我是工厂HR
        $owned = array();
        $rtitles = array();
        foreach ($this->roles as $role) {
            $owned = array_merge($owned, [$role['id']]);
            $rtitles = array_merge($rtitles, [$role['title']]);
        }
        $this['owned'] = $owned;
        $this['rtitles'] = $rtitles;

        $this->staff;       //我是员工

    }

    public function simple() {
        $this->roles;
        $owned = array();
        $rtitles = array();
        foreach ($this->roles as $role) {
            $owned = array_merge($owned, [$role['id']]);
            $rtitles = array_merge($rtitles, [$role['title']]);
        }
        $this['owned'] = $owned;
        $this['rtitles'] = $rtitles;
    }

    /**
     * 多对多关联查询 用户角色
     */
    public function roles() {
        return $this->belongsToMany('RolesType', 'RolesPivot', 'rid', 'uid')->order('rid', 'asc');
    }
    /**
     * 一对一关联查询 我的上级
     * superior -> partner
     */
    public function partner() {
       return $this->hasOne("PartnerPivot", 'uid', "id")->with('user');
    }

    /**
     * 所属于战略
     * strategy -> strategic
     */
    public function strategic() {
        return $this->hasOne("StrategicAlliance", "uid", "id")->where(['status'=>1]);
    }




    /**
     * 一对多关联查询 所驻场的工厂
     */
    public function teachers()
    {
        return $this->belongsToMany('FactoryBasicInformation', 'FactoryTeacher', 'fid', 'uid');
    }

    /**
     * 一对多关联查询 多家工厂招聘情况
     */
    public function hrs() {
        return $this->belongsToMany('FactoryBasicInformation', 'FactoryHr', 'fid', 'uid');
    }

    /**
     * 员工信息
     */
    public function staff() {
        return $this->hasOne('FactoryStaff', "uid", 'id')->where(['status'=>1])->with(['factory','job', 'sigingInformation']);
    }

    /**
     * 战略合伙人(我的战略)
     * 所属战略合伙人
     */
    public function company() {
        return $this->hasOne("StrategicAlliance", "uid", "id")->where(['status'=>1]);
    }

    /**
     * 下级
     * 对应pid的下级
     */
    public function subordinate() {
        return $this->hasMany("PartnerPivot", 'pid', 'id')->with(["user"]);
    }

}