<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Dividend;
use app\common\model\EnterpriseCommission;
use app\common\model\FactoryBasicInformation;
use app\common\model\PartnerPivot;
use app\common\model\RolesType;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use think\console\Command;
use think\Controller;

class DividendManager extends Controller
{
    /**
     * 获取佣金
     * 驻场老师
     * 业务员
     * 初级合伙人
     * 高级合伙人
     * 战略
     * 蛋蛋 id = 0
     */
    public function getEnterpriseCommission() {
        $uid = $this->request->param("uid");
        $rid = $this->request->param("rid");

        $dividendes = Dividend::where(['uid'=>$uid, 'rid'=>$rid])->all();
        foreach ($dividendes as $dividende) {
            $dividende->factory;
        }
        return SBResponse::response($dividendes);
    }

    /**
     * 获取预算佣金
     */
    public function getBudgetEnterpriseCommission() {
        $type = $this->request->param("rid");
        $uid = $this->request->param("uid");

        $data = [];
            if ($type == RolesType::junior_partner) {
                $commissions = EnterpriseCommission::where(["primaryId"=>$uid, "status"=>0])->select();
            }
            elseif ($type == RolesType::senior_partner) {
                $commissions = EnterpriseCommission::where(["advancedId"=>$uid, "status"=>0])->select();
            }
            elseif ($type == RolesType::strategic_alliance) {
                $commissions = EnterpriseCommission::where(["strategicId"=>$uid, "status"=>0])->select();
            }
            elseif ($type == RolesType::salesman) {
                $commissions = EnterpriseCommission::where(["salesmanId"=>$uid, "status"=>0])->select();
            }
            elseif ($type == RolesType::resident_teacher) {
                $commissions = EnterpriseCommission::where(["teacherId"=>$uid, "status"=>0])->select();
            }
            elseif ($type == RolesType::dandankj) {
                $commissions = EnterpriseCommission::where(["dandanId"=>$uid, "status"=>0])->select();
            }


             foreach ($commissions as $commission) {

                 $commission["factory"] = FactoryBasicInformation::find($commission["fid"]);
                 $data[] = $commission;
             }
        return SBResponse::response($data);
    }

    /**
     * 可提现的提现或分红
     */
    public function getCashableCommission() {
        $user = Users::fromToken();
        $rid = $this->request->param("rid");
        $dividendes = Dividend::where(['uid'=>$user->id, 'rid'=>$rid, 'isWithdraw'=>0])->all();
        foreach ($dividendes as $dividende) {
            $dividende->factory;
        }
        return SBResponse::response($dividendes);
    }

    /**
     * 转出到钱包
     */
    public function withdrawToLooseChange() {
        $user = Users::fromToken();
        if (!$user) {
            return SBResponse::error("缺少token");
        }
        $rid = $this->request->param("rid");
        $amount = $this->request->param("amount");
        $tid = $this->request->param("tid");
        $commission_fee = $this->request->param("commission_fee");

        $dividends = Dividend::where(['uid'=>$user->id, "rid"=>$rid, 'isWithdraw'=>0])->all();
        if (count($dividends) < 1) {
            return SBResponse::response("没有足够金额~！");
        }
        foreach ($dividends as $dividend) {
            $dividend->save([
                "isWithdraw" => 1
            ]);
        }

        $wallet = WalletVirtual::where(['uid'=>$user->id])->find();
        $wallet->save([
            "balance" => $wallet->balance + $amount,
        ]);

        $logs = WalletVirtualLogs::create([
            "wid" => $wallet->id,
            "tid" => $tid,
            "uid" => $user->id,
            "single_number" => md5(time()),
            "amount" => $amount,
            "balance" => $wallet->balance,
            "commission_fee" => $commission_fee,
            "amount_type" => false,
            "title" => "转出"
        ]);

        if (!$dividend || !$wallet || !$logs) {
            return SBResponse::error("系统繁忙，请稍等再试！");
        } else {
            return SBResponse::response();
        }

    }
}