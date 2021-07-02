<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/10
 * Time: 8:26 AM
 */

namespace app\index\Controller;


use app\_Base\controller\SBResponse;
use app\common\model\AllAward;
use app\common\model\EventsPaySlipAgent;
use app\common\model\EventsPaySlipEpfew;
use app\common\model\EventsPaySlipHourlyWorker;
use app\common\model\EventsPivot;
use app\common\model\EventsStaff;
use app\common\model\FactoryHrs;
use app\common\model\Factorys;
use app\common\model\Feedbackes;
use app\common\model\Jobs;
use app\common\model\PartnerPivot;
use app\common\model\RolesPivot;
use app\common\model\Teacher;
use app\common\model\RolesType;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WorkHours;
use app\common\model\WriteOff;
use app\common\model\WriteOffPivot;
use think\Controller;
use think\Db;
use think\Model;

class SSUser extends Model
{
    protected $table = "ss_user";

    protected $type = [
//        'factory_teacher_ids' => 'array'
//        ,'factory_hr_ids' => 'array'
        'roles' => 'array'
    ];
}

class SSEvents extends Model
{
    protected $table = "ss_event";
    protected $type = [
        'extend' => 'array'
        , 'images' => 'array'
    ];
}

class Test extends Controller
{

    public function index() {

        return SBResponse::response(EventsPaySlipEpfew::get(2));
    }


    public function createWallet() {
        $user = Users::fromToken();


        $walletes = WalletVirtual::where([
            "uid" => $user->id,
        ])->find();

        $walletes->add([
            "uid"=>$user->id,
            "tid"=>WalletType::Pay
        ]);


        return SBResponse::response($walletes);
    }

    public function mont() {

        //然后在查询的时候，可以TP的between操作来查询。例如你在数据库标识时间的字段为publishtime，那么查询可以这样写


        $events = EventsStaff::where(monthWhere(time()))->where(['etid'=>8])->select();


        return SBResponse::response($events);
    }

    /**
    {
    "date": [
    "2020-05-01",
    "2020-05-31"
    ],
    "time": [
    1588262400,
    1590854400
    ]
    }
     */
    function getthemonth($time)
    {
        $time = strtotime($time);
        $fratday = date('Y-m-01', strtotime("$time 0 month"));
        $fratdaytime = strtotime($fratday);

        $lastday = date('Y-m-d', strtotime("$fratday +1 month -1 day"));
        $lastdaytime = strtotime($lastday);

        $date = [
            "date" => [$fratday, $lastday],
            "time" => [$fratdaytime, $lastdaytime],
        ];
        return $date;
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





    public function userRolesById() {
        $uid = $this->request->param("uid");
        $user = Users::get($uid);
        $user->more();
        return SBResponse::response($user);
    }
}
