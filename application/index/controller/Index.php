<?php
namespace app\index\controller;



use app\_Base\controller\BaseController;
use app\_Base\controller\SBResponse;
use app\common\model\Borrow;
use app\common\model\EventsPaySlipAgent;
use app\common\model\EventsPaySlipEpfew;
use app\common\model\EventsPaySlipHourlyWorker;
use app\common\model\EventsStaff;
use app\common\model\EventsType;
use app\common\model\FactorySigningInformation;
use app\common\model\FactoryStaff;
use app\common\model\PartnerPivot;
use app\common\model\RolesPivot;
use app\common\model\RolesType;
use app\common\model\SignIn;
use app\common\model\StrategicAlliance;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtualLogs;
use think\Controller;


class Index extends BaseController
{

    public function index() {
        return redirect("/admin/start");
    }

    public function menu() {
        $data = $this->request->header("token");
        $uid = jwt_uncode($data);
        $user = Users::get($uid);
        $user->more();
        foreach ($user->teachers as $teacher) {
            $teacher["sigingInformation"] = FactorySigningInformation::where(['fid'=>$teacher['id']])->find();
        }
        $data = array();

//        foreach ($user->roles as $role) {

//            if ($role['id'] == RolesType::ordinary_users) {
                /// 用户管理
                $data = array_merge($data,[
                    ["name"=> "get","title"=> "用户管理","icon"=> "layui-icon-group","list"=> [
                    ["name"=> "get","title"=> "用户列表","jump"=> "User/list"],
                    ["name"=> "get","title"=> "黑名单列表","jump"=> "User/black"],
                    ["name"=> "get","title"=> "角色类型","jump"=> "User/category"],
                    ]]
                ]);
//            } elseif ($role['id'] == RolesType::resident_manager) {
                //驻场经理
                $data = array_merge($data,[
                    ["name"=> "get","title"=> "驻场经理","icon"=> "layui-icon-template", "list"=> [
                        ["name"=> "get","title"=> "驻场老师管理","icon"=> "layui-icon-template", "jump"=> "ResidentManager/list"],
                    ]]
                ]);
//            } elseif ($role['id'] == RolesType::salesman) {
                /// 业务部
                $data = array_merge($data, [
                    ["name"=> "get","title"=> "业务部","icon"=> "layui-icon-template", "list"=> [
                        ["name"=> "get","title"=> "工厂列表","jump"=> "BusinessDepartment/Factory/list"],
                        ["name"=> "get","title"=> "文章管理","icon"=> "layui-icon-template", "jump"=> "BusinessDepartment/Article/list"],
                        ["name"=> "get","title"=> "商城管理","icon"=> "layui-icon-cart","list"=> [
                            ["name"=> "get","title"=> "商品管理","jump"=> "BusinessDepartment/Shop/list"],
                            ["name"=> "get","title"=> "商品类型","jump"=> "BusinessDepartment/Shop/category"],
                            ["name"=> "get","title"=> "订单列表","jump"=> "BusinessDepartment/Shop/orderList"],
                        ]],
                    ]]
                ]);
//            } elseif ($role['id'] == RolesType::ministry_of_personnel) {
                $data = array_merge($data, [
                    ["name"=> "get","title"=> "人事部","icon"=> "layui-icon-tabs","list"=> [
                        ["name"=> "get","title"=> "职位管理","jump"=> "Personnel/job/list"],
                        ["name"=> "get","title"=> "驻场经理管理","jump"=> "Personnel/residentManager"],
                        ["name"=> "get","title"=> "工厂HR管理","jump"=> "Personnel/hrlist"],
                        ["name"=> "get","title"=> "入职","jump"=> "Personnel/entry"],
                        ["name"=> "get","title"=> "请假","jump"=> "Personnel/leave"],
                        ["name"=> "get","title"=> "离职","jump"=> "Personnel/quit"],
                        ["name"=> "get","title"=> "报销","jump"=> "Personnel/reimbursement"],
                        ["name"=> "get","title"=> "意见反馈","jump"=> "Personnel/feedbackes"],
                        ["name"=> "get","title"=> "业务员申请","jump"=> "Personnel/salesman/salesmanlist"],
                        ["name"=> "get","title"=> "初、高级合伙人审核", "list"=>[
                            ["name"=> "get","title"=> "初级合伙人申请","jump"=> "Personnel/Partner/jplist"],
                            ["name"=> "get","title"=> "高级合伙人申请","jump"=> "Personnel/Partner/splist"],
                        ]],
                    ]]
                ]);
//            } elseif ($role['id'] == RolesType::finance_department) {
                $data = array_merge($data, [
                    ["name"=> "get","title"=> "财务部","icon"=> "layui-icon-tabs","list"=> [
                        ["name"=> "get","title"=> "工作流", "list"=>[
                            ["name"=> "get","title"=> "工资发放","jump"=> "FinanceDepartment/payoff"],
                            ["name"=> "get","title"=> "报销","jump"=> "FinanceDepartment/reimbursement"],
                            ["name"=> "get","title"=> "借款","jump"=> "FinanceDepartment/collectInAdvance"],
                            ["name"=> "get","title"=> "事件记录","jump"=> "FinanceDepartment/eventlog"],
//                    ["name"=> "get","title"=> "提现","jump"=> "FinanceDepartment/cashWithdrawal"],
                        ]],

                        ["name"=> "get","title"=> "合伙人", "list"=>[
                            ["name"=> "get","title"=> "战略联盟管理","jump"=> "FinanceDepartment/strategic"],
                            ["name"=> "get","title"=> "分红","jump"=> "FinanceDepartment/abonus"],
                        ]],

                        ["name"=> "get","title"=> "工厂审核","jump"=> "FinanceDepartment/factoryAudit"],
                        ["name"=> "get","title"=> "费率管理","icon"=> "layui-icon-rmb", "jump"=> "FinanceDepartment/rate"],
                        ["name"=> "get","title"=> "银行列表","icon"=> "layui-icon-fonts-strong", "jump"=> "FinanceDepartment/bank"],
                    ]]
                ]);
//            } elseif ($role['id'] == RolesType::ceo) {
                $data = array_merge($data, [
                    /// 广告管理
                    ["name"=> "get","title"=> "广告管理","icon"=> "layui-icon-flag","list"=> [
                        ["name"=> "get","title"=> "启动广告","jump"=> "AD/startad"],
                        ["name"=> "get","title"=> "Banner广告","jump"=> "AD/bannerad"],
                        ["name"=> "get","title"=> "职位广告","jump"=> "AD/jobad"],
                    ]],
                    /// 系统设置
                    ["name"=> "get","title"=> "系统设置","icon"=> "layui-icon-set", "list"=> [
                        ["name"=> "get","title"=> "系统使用说明","jump"=> "system/document"],
                        ["name"=> "get","title"=> "后台管理员", "jump"=> "administrators/role"],
                        ["name"=> "get","title"=> "其他设置", "jump"=> "system/set"],
                    ]],
                ]);
//            } elseif ($role['id'] == RolesType::dandankj) {
//
//            } elseif ($role['id'] == RolesType::admin) {
//
//            }

//        }




        return SBResponse::response($data);

//        $data = [
//
//            /// 用户管理
//            ["name"=> "get","title"=> "用户管理","icon"=> "layui-icon-group","list"=> [
//                ["name"=> "get","title"=> "用户列表","jump"=> "User/list"],
//                ["name"=> "get","title"=> "黑名单列表","jump"=> "User/black"],
//                ["name"=> "get","title"=> "角色类型","jump"=> "User/category"],
//            ]],
//
//            /// 业务部
//            ["name"=> "get","title"=> "业务部","icon"=> "layui-icon-template", "list"=> [
//                ["name"=> "get","title"=> "工厂列表","jump"=> "BusinessDepartment/Factory/list"],
//                ["name"=> "get","title"=> "文章管理","icon"=> "layui-icon-template", "jump"=> "BusinessDepartment/Article/list"],
//                ["name"=> "get","title"=> "商城管理","icon"=> "layui-icon-cart","list"=> [
//                    ["name"=> "get","title"=> "商品管理","jump"=> "BusinessDepartment/Shop/list"],
//                    ["name"=> "get","title"=> "商品类型","jump"=> "BusinessDepartment/Shop/category"],
//                    ["name"=> "get","title"=> "订单列表","jump"=> "BusinessDepartment/Shop/orderList"],
//                ]],
//            ]],
//
//
//            /// 驻场经理
//            ["name"=> "get","title"=> "驻场经理","icon"=> "layui-icon-template", "list"=> [
//                ["name"=> "get","title"=> "驻场老师管理","icon"=> "layui-icon-template", "jump"=> "ResidentManager/list"],
//            ]],
//
//            /// 人事部
//            ["name"=> "get","title"=> "人事部","icon"=> "layui-icon-tabs","list"=> [
//                ["name"=> "get","title"=> "职位管理","jump"=> "Personnel/job/list"],
//                ["name"=> "get","title"=> "驻场经理管理","jump"=> "Personnel/residentManager"],
//                ["name"=> "get","title"=> "工厂HR管理","jump"=> "Personnel/hrlist"],
//                ["name"=> "get","title"=> "入职","jump"=> "Personnel/entry"],
//                ["name"=> "get","title"=> "请假","jump"=> "Personnel/leave"],
//                ["name"=> "get","title"=> "离职","jump"=> "Personnel/quit"],
//                ["name"=> "get","title"=> "报销","jump"=> "Personnel/reimbursement"],
//                ["name"=> "get","title"=> "意见反馈","jump"=> "Personnel/feedbackes"],
//                ["name"=> "get","title"=> "业务员申请","jump"=> "Personnel/salesman/salesmanlist"],
//                ["name"=> "get","title"=> "初、高级合伙人审核", "list"=>[
//                    ["name"=> "get","title"=> "初级合伙人申请","jump"=> "Personnel/Partner/jplist"],
//                    ["name"=> "get","title"=> "高级合伙人申请","jump"=> "Personnel/Partner/splist"],
//                ]],
//            ]],
//
//            /// 财务部
//            ["name"=> "get","title"=> "财务部","icon"=> "layui-icon-tabs","list"=> [
//                ["name"=> "get","title"=> "工作流", "list"=>[
//                    ["name"=> "get","title"=> "工资发放","jump"=> "FinanceDepartment/payoff"],
//                    ["name"=> "get","title"=> "报销","jump"=> "FinanceDepartment/reimbursement"],
//                    ["name"=> "get","title"=> "借款","jump"=> "FinanceDepartment/collectInAdvance"],
//                    ["name"=> "get","title"=> "事件记录","jump"=> "FinanceDepartment/eventlog"],
////                    ["name"=> "get","title"=> "提现","jump"=> "FinanceDepartment/cashWithdrawal"],
//                ]],
//
//                ["name"=> "get","title"=> "合伙人", "list"=>[
//                    ["name"=> "get","title"=> "战略联盟管理","jump"=> "FinanceDepartment/strategic"],
//                    ["name"=> "get","title"=> "分红","jump"=> "FinanceDepartment/abonus"],
//                ]],
//
//                ["name"=> "get","title"=> "工厂审核","jump"=> "FinanceDepartment/factoryAudit"],
//                ["name"=> "get","title"=> "费率管理","icon"=> "layui-icon-rmb", "jump"=> "FinanceDepartment/rate"],
//                ["name"=> "get","title"=> "银行列表","icon"=> "layui-icon-fonts-strong", "jump"=> "FinanceDepartment/bank"],
//            ]],
//
//            /// 广告管理
//            ["name"=> "get","title"=> "广告管理","icon"=> "layui-icon-flag","list"=> [
//                ["name"=> "get","title"=> "启动广告","jump"=> "AD/startad"],
//                ["name"=> "get","title"=> "Banner广告","jump"=> "AD/bannerad"],
//                ["name"=> "get","title"=> "职位广告","jump"=> "AD/jobad"],
//            ]],
//
//            /// 系统设置
//            ["name"=> "get","title"=> "系统设置","icon"=> "layui-icon-set", "list"=> [
//                ["name"=> "get","title"=> "系统使用说明","jump"=> "System/document"],
//                ["name"=> "get","title"=> "后台管理员", "jump"=> "administrators/role"],
//                ["name"=> "get","title"=> "其他设置", "jump"=> "system/set"],
//            ]],
//        ];
//
//        return SBResponse::response($data);
    }

    public function welcome() {

        //用户总数量
        $data["userCount"] = Users::count();
        //入职数量
        $inJobCount= FactoryStaff::where(['status'=>1])->count();
        //离职数量
        $reimburseCount = FactoryStaff::where('status', '=', 0)->count();
        //初级合伙人数量
        $primaryCount = RolesPivot::where(['rid'=>RolesType::junior_partner])->count();
        //高级合伙人数量
        $advancedCount = RolesPivot::where(['rid'=>RolesType::senior_partner])->count();
        //战略合伙公司数量
        $enterpriseCount = StrategicAlliance::count();

        //总工资
        $totalWages = 0.0;
        foreach (EventsPaySlipEpfew::all() as $item) {
            $totalWages = $totalWages + $item->actual_salary;
        }
        foreach (EventsPaySlipHourlyWorker::all() as $item) {
            $totalWages = $totalWages + $item->actual_salary;
        }


        //借款总额
        $totalBorrowMoney = 0.0;
        foreach (EventsStaff::where(['etid'=>EventsType::advance_payments, 'status'=>1])->all() as $item) {
//            $totalBorrowMoney = $totalBorrowMoney + $item->cost;
        }
        $borrows = Borrow::where(["status"=>0])->all();
        foreach ($borrows as $borrow) {
            $totalBorrowMoney = $borrow["money"] + $totalBorrowMoney;
        }



        //还款总额
        $totalRepayment = 0.0;
        foreach (EventsPaySlipHourlyWorker::where(['status' => 1])->all() as $item) {
//            $totalRepayment = $totalRepayment + $item->loan;
        }
        $borrows = Borrow::where(["status"=>1])->all();
        foreach ($borrows as $borrow) {
            $totalRepayment = $borrow["money"] + $totalRepayment;
        }



        foreach (EventsPaySlipEpfew::where(['status' => 1])->all() as $item) {
            $totalRepayment = $totalRepayment + $item->loan;
        }
        foreach (EventsPaySlipAgent::where(['status' => 1])->all() as $item) {
            $totalRepayment = $totalRepayment + $item->loan;
        }
        //蛋蛋收益
        $dandankjEarnings = 0.0;
        foreach (EventsPaySlipEpfew::all() as $item) {
            $dandankjEarnings = $dandankjEarnings + $item->dividend;
        }
        foreach (EventsPaySlipHourlyWorker::all() as $item) {
            $dandankjEarnings = $dandankjEarnings + $item->dividend;
        }
        //涨知识消费
        $dataConsumption = 0.0;
        foreach (WalletVirtualLogs::where(['tid' => WalletType::KnowledgeConsumption])->all() as $item) {
            $dataConsumption = $dataConsumption + $item->amount;
        }
        //总蛋币
        $totalDanGold = 0.0;
        foreach (SignIn::all() as $item) {
            $totalDanGold = $totalDanGold + $item->reward;
        }

        //蛋币总消费
        $totalConsumptionDanGold = 0.0;
        foreach (WalletVirtualLogs::where(['tid' => WalletType::KnowledgeConsumption])->all() as $item) {
            $totalConsumptionDanGold = $totalConsumptionDanGold + $item->egg_coin;
        }
        //驻场老师提成
        $teacherUnit = 0.0;
        foreach (EventsPaySlipEpfew::all() as $item) {
            $teacherUnit = $teacherUnit + $item->resident_teacher_commission;
        }
        foreach (EventsPaySlipHourlyWorker::all() as $item) {
            $teacherUnit = $teacherUnit + $item->resident_teacher_commission;
        }

        //高级合伙人分红
        $advancedUnit = 0.0;
        foreach (EventsPaySlipEpfew::all() as $item) {
            $advancedUnit = $advancedUnit + $item->advanced_dividend;
        }
        foreach (EventsPaySlipHourlyWorker::all() as $item) {
            $advancedUnit = $advancedUnit + $item->advanced_dividend;
        }
        //合伙公司分红
        $enterpriseUnit = 0.0;
        foreach (EventsPaySlipEpfew::all() as $item) {
            $enterpriseUnit = $enterpriseUnit + $item->strategic_dividend;
        }
        foreach (EventsPaySlipHourlyWorker::all() as $item) {
            $enterpriseUnit = $enterpriseUnit + $item->strategic_dividend;
        }

//        foreach ($users as $key=>$user) {
//            //是否在职
//            if (array_search("2", $user->roles)) {
//                $inJobCount ++;
//            }
//            if ($user->inJob == 2) {
//                $reimburseCount ++;
//            }
//            //初级合伙人
//            if (array_search(EventType::primary, $user->roles)){
//                $primaryCount ++;
//            }
//            //高级合伙人
//            if (array_search(EventType::advanced, $user->roles)) {
//                $advancedCount ++;
//            }
//            //战略合人
//            if (array_search(EventType::reimburse, $user->roles)) {
//                $enterpriseCount ++;
//            }
//
//        }



        $data["inJobCount"] = $inJobCount;
        $data["reimburseCount"] = $reimburseCount;
        $data["primaryCount"] = $primaryCount;
        $data["advancedCount"] = $advancedCount;
        $data["enterpriseCount"] = $enterpriseCount;

        //总工资
        $data["totalWages"] = number_format($totalWages, 2);
        //借款总额
        $data["totalBorrowMoney"] = number_format($totalBorrowMoney, 2);
        //还款总额
        $data["totalRepayment"] = number_format($totalRepayment, 2);
        //蛋蛋收益
        $data["dandankjEarnings"] = number_format($dandankjEarnings, 2);
        //涨知识消费
        $data["dataConsumption"] = number_format($dataConsumption, 2);
        //总蛋币
        $data["totalDanGold"] = number_format($totalDanGold, 2);
        //蛋币总消费
        $data["totalConsumptionDanGold"] = number_format($totalConsumptionDanGold, 2);
        //驻场老师提成
        $data["teacherUnit"] = number_format($teacherUnit, 2);
        //高级合伙人分红
        $data["advancedUnit"] = number_format($advancedUnit, 2);
        //合伙公司分红
        $data["enterpriseUnit"] = number_format($enterpriseUnit, 2);

        return SBResponse::response($data);
    }

}
