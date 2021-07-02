<?php


namespace app\index\controller;

use app\_Base\controller\SBResponse;
use app\common\model\BankList;
use app\common\model\EventsPaySlip;
use app\common\model\EventsPaySlipEpfew;
use app\common\model\EventsPaySlipHourlyWorker;
use app\common\model\EventsStaff;
use app\common\model\EventsType;
use app\common\model\FactoryEnvironmentAndTreatment;
use app\common\model\FactorySigningInformation;
use app\common\model\MyBank;
use app\common\model\Users;
use app\common\model\WalletServiceCharge;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use think\Controller;
use think\Model;

/**
 * 钱包管理
 * Class WalletManager
 * @package app\index\controller
 */
class WalletManager extends Controller
{
    /**
     * 手续费
     */
    public function getServiceCharge()
    {
        return SBResponse::response(WalletServiceCharge::get(1));
    }

    /**
     * 一般手续费
     */
    public function generalHandlingCharges()
    {
        $data = $this->request->param("service_charge_for_withdrawal");
        $service = WalletServiceCharge::get(1);
        if (!$service) {
            $service = WalletServiceCharge::create([
                "service_charge_for_withdrawal" => $data
            ]);
        }
        $service->save([
            "service_charge_for_withdrawal" => $data
        ]);
        return SBResponse::response($service);
    }

    /**
     * 提成手续费
     */
    public function updateCommissionFee()
    {
        $data = $this->request->param("commission_fee");

        $service = WalletServiceCharge::get(1);
        if (!$service) {
            $service = WalletServiceCharge::create([
                "commission_fee" => $data
            ]);
        }
        $service->save([
            "commission_fee" => $data
        ]);
        return SBResponse::response($service);
    }

    /**
     * 我的钱包
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getMyWallet()
    {
        $user = Users::fromToken();
        $wallet = WalletVirtual::where(['uid' => $user->id])->find();
        $wallet->more();
        return SBResponse::response($wallet);
    }

    /**
     * 可预支金额
     */
    public function availableAmount()
    {
        $uid = $this->request->param("uid");
        $events = EventsStaff::where(['uid' => $uid, 'etid' => EventsType::punch_the_clock,'xstatus'=>0])->select();

        $available = 0.0;
        $total_working_hours = 0.0;// 总工时
        $employee_unit_price = 0.0;// 员工单价
        $working_hours = 0.0;// 工作时长
        $rest_day_count = 0.0; // 每月休息多少天
        foreach ($events as $event) {

            $signingInfo = FactorySigningInformation::where(['fid' => $event->fid])->find();
            $environment = FactoryEnvironmentAndTreatment::where(['fid' => $event->fid])->find();

            $event->factory['signingInfo'] = $signingInfo;
            $cooperation_mode = $signingInfo->cooperation_mode;
            // 计算总工时
            $total_working_hours = $event->hour + $total_working_hours;
            // 员工单价
            $employee_unit_price = $signingInfo->employee_unit_price;

        }

        /// TODO : 这里可能需要处理可预支的%
        // 总工时 * 员工单价 * 0.5 = 可预支金额
        $available = $total_working_hours * $employee_unit_price * 0.5;

        return SBResponse::response($available);
    }

    /**
     * TODO : 预支申请
     */
    public function applyForAdvance()
    {
        $user = Users::fromToken();
        $user->more();
        $data['cost'] = $this->request->param("amount");
        $data['uid'] = $user->id;
        $data['etid'] = EventsType::advance_payments;
        $data['pid'] = $user->staff->pid;
        $data['fid'] = $user->staff->fid;
        $data['jid'] = $user->staff->jid;

        $event = EventsStaff::create($data);
        return SBResponse::response($event);
    }

    /**
     * TODO : 查询这个月是否预支过
     */
    public function isAdvance()
    {
        $user = Users::fromToken();
        $user->more();
        $event = EventsStaff::where(monthWhere(time()))->where(['etid' => EventsType::advance_payments, 'uid' => $user->id, 'fid' => $user->staff->fid, 'jid' => $user->staff->jid])->find();

        return SBResponse::response($event);
    }

    public function billingDetailslist() {
        $user = Users::fromToken();
        $logs = WalletVirtualLogs::with('etype')->where(['uid'=>$user->id])->order('create_time desc')->all();

        return SBResponse::response($logs);
    }

    /**
     * 我的银行卡
     */
    public function getMyCardList() {
        $user = Users::fromToken();
        $bankes = MyBank::where(['uid'=>$user->id])->all();
        foreach ($bankes as $bank) {
            $bank->more();
        }
        return SBResponse::response($bankes);
    }

    /**
     * 添加银行卡
     */
    public function addCard() {
        $user = Users::fromToken();
        $data = $this->request->param();
        $data['uid'] = $user->id;
        $mybank = MyBank::where(['uid'=>$user->id,"number"=>$data['number']])->find();
        if (!$mybank) {
            $bank = MyBank::create($data);
            return SBResponse::response($bank);
        } else {
            return SBResponse::response("该卡片已经添加");
        }
    }

    /**
     * 银行卡列表
     */
    public function getBanklist() {
        return SBResponse::response(BankList::all());
    }


    /**
     * 可提现工资
     */
    public function withdrawableSalary() {
        $user = Users::fromToken();

        $events = EventsPaySlip::where(['uid'=>$user->id, "status"=>1, "isWithdraw"=>0])->all();
        $amount = 0.0;
        foreach ($events as $event) {
            if ($event['type'] == "小时工工资条") {
               $hourlyWorker = EventsPaySlipHourlyWorker::where(['uid'=>$user->id, 'status'=>1])->all();
                foreach ($hourlyWorker as $item) {
                    //实发工资相加
                    $amount = $amount + $item["actual_salary"];
                }
            }
            if ($event['type'] == "同工同酬工资条") {
                $epfews = EventsPaySlipEpfew::where(['uid'=>$user->id, 'status'=>1])->all();
                foreach ($epfews as $item) {
                    //实发工资相加
                    $amount = $amount + $item["actual_salary"];
                }
            }
        }

        return SBResponse::response($amount);
    }

    /**
     * 工资转出到钱包
     */
    public function rolloutWageToWallet() {
        $user = Users::fromToken();
        if (!$user) {
            return SBResponse::error("缺少token");
        }

        $events = EventsPaySlip::where(['uid'=>$user->id, "status"=>1, "isWithdraw"=>0])->all();
        $amount = 0.0;
        foreach ($events as $event) {
            if ($event['type'] == "小时工工资条") {
                $hourlyWorker = EventsPaySlipHourlyWorker::where(['uid'=>$user->id, "status"=>1])->all();
                foreach ($hourlyWorker as $item) {
                    //实发工资相加
                    $amount = $amount + $item["actual_salary"];
                }
            }
            if ($event['type'] == "同工同酬工资条") {
                $epfews = EventsPaySlipEpfew::where(['uid'=>$user->id, 'status'=>1])->all();
                foreach ($epfews as $item) {
                    //实发工资相加
                    $amount = $amount + $item["actual_salary"];
                }
            }
            // 设置为已转出
            $event->save([
                "isWithdraw" => 1
            ]);
        }
        $wallet = WalletVirtual::where(['uid'=>$user->id])->find();
        $wallet->save([
            "balance" => $wallet->balance + $amount
        ]);
        $logs = WalletVirtualLogs::create([
            "tid" => WalletType::wage,
            "uid" => $user->id,
            "wid" => $wallet->id,
            "single_number" => md5(time()),
            "amount" => $amount,
            "balance" => $wallet->balance,
            "commission_fee" => "0.0",
            "amount_type" => true,
            "title" => "转出"
        ]);
        if ($wallet && $logs) {
            return SBResponse::response();
        } else {
            return SBResponse::error("转出失败");
        }
    }



}