<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/16
 * Time: 4:46 PM
 */

namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\SignIn;
use app\common\model\SystemModel;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use think\Controller;

class SignInManager extends Controller
{

    public function add() {
        $data = $this->request->only(["uid", "id"]);

        $signes = SignIn::where(["uid" => $data["id"]])->select();

        $unsignIn = false;
        foreach ($signes as $signe) {
            if (date ( 'Ymd' , strtotime($signe["create_time"]) ) == date ( 'Ymd' )){
                $unsignIn = true;
                break;
            }
        }
        if ($unsignIn) {
            // 已签过到了
            return SBResponse::response("", 2);
        }

        $user = Users::where(["id"=>$data["id"]])->find();

        // 获取签到一次可得蛋币数
        $system = SystemModel::get(1);

        // 创建签到
        $signin = SignIn::create([
            "uid" => $data['id'],  //签到用户
            "reward" => $system->sign_in_reward,//奖励
        ]);
        // 获取钱包
        $wallet = WalletVirtual::where(['uid'=>$user->id])->find();
        $wallet->save([
            "egg_coin" => $wallet->egg_coin + $system->sign_in_reward
        ]);
        //创建流水
        WalletVirtualLogs::create([
            "tid" => WalletType::SignIn,
            "uid" => $user->id,
            "wid" => $wallet->id,
            "total_egg" => $wallet->egg_coin,  //获取钱包的蛋币数
            "balance" => $wallet->balance,     //获取钱包的余额数
            "amount" => "0.00",
            "egg_coin" => $system->sign_in_reward, //当前所得蛋币
            "single_number" => md5(time()),
            "status" => 1,
            "amount_type" => true,
            "title" => "签到"
        ]);
        return SBResponse::response($signin);
    }

    public function getList() {
        $data = $this->request->only('id');

        $today_start = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $today_end = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;

        $where[] = ['create_time', 'between time', [$today_start, $today_end]];

        $signins = SignIn::where(["uid"=>$data['id']])->select();

        return SBResponse::response($signins);
    }

}