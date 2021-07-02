<?php


namespace app\common\model;

use think\Model;

/**
 * 账单流水类型
 * Class WalletBillFlowType
 * @package app\common\model
 */
class WalletType extends Model
{
    public $autoWriteTimestamp = true;


    # id, title
    /** '0', '创建钱包' **/
    const CreateaWallet = 0;
    /** '1', '发工资' **/
    const Pay = 1;
    /** '2', '预支' **/
    const Advance = 2;
    /** '3', '业务提成' **/
    const BusinessCommission = 3;
    /** '4', '驻场提成' **/
    const ResidentCommission = 4;
    /** '5', '初级分红' **/
    const PrimaryDividend = 5;
    /** '6', '高级分红' **/
    const AdvancedDividend = 6;
    /** '7', '战略联盟分红' **/
    const StrategicAllianceDividend = 7;
    /** '8', '蛋蛋分红' **/
    const Dividend = 8;
    /** '9', '卖出' **/
    const Sell = 9;
    /** '10', '消费' **/
    const Consumption = 10;
    /** '11', 签到 **/
    const SignIn = 11;
    /** '12', 分享 **/
    const Share = 12;
    /** '13', 工资 **/
    const wage = 13;
    /** '18', 提现到银行卡 **/
    const ToBankCard = 18;
    /** '19', 涨知识消费 **/
    const KnowledgeConsumption = 19;




}