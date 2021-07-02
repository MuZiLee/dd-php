<?php

namespace app\index\Controller;

use app\_Base\controller\SBResponse;
use app\common\model\BankList;
use app\common\model\MyBank;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use app\http\middleware\PHPTools;
use think\Controller;

class DDPayController extends Controller
{
    /**
     *
     * 单笔实时接口
     * TRX_CODE:100014--单笔实时代付
     * TRX_CODE:100011--单笔实时代收
     *
     */
    public function singleCash() {
        $user = Users::fromToken();
        if (!$user) {
            return SBResponse::response("", 201, "缺少参数");
        }

        $amount = 0.1;

        $bid = $this->request->param("bid");
        $bankCard = MyBank::where(["uid"=>$user->id, "id"=>$bid])->find();
        if (!$bankCard) {
            return SBResponse::error("银行卡不存在");
        }

        $wallet = WalletVirtual::where(["uid"=>$user->id])->find();
        if (!$wallet) {
            return SBResponse::error("钱包不存在");
        }
        if (($wallet->balance - $amount) > 0) {
            $wallet->save([
                "balance" => $wallet->balance - $amount
            ]);
            WalletVirtualLogs::create([
                "wid" => $wallet->id,
                "uid" => $user->id,
                "tid" => WalletType::ToBankCard,
                "single_number" => md5(time()),
                "amount" => $amount,    // 提现金额
                "balance" => $wallet->balance,//余额
                "commission_fee" => 0.0,// 费率
                "amount_type" => false,
                "title" => "提现"
            ]);
        } else {
            return  SBResponse::error("余额不足");
        }



        header('Content-Type:text/html; Charset=UTF-8');
        $tools = new PHPTools();

        // 源数组

        //发起请求
        // amount 测试金额 一角

        $result = $tools->send($this->params($bankCard->uid, $bankCard->name, $bankCard->number, $amount * 100));
        if ($result != FALSE) {
//            echo  '验签通过，请对返回信息进行处理';
//            //下面商户自定义处理逻辑，此处返回一个数组
//            echo "<br/><br/><font color=blue>-------------华丽丽的分割线--------------------</font><br/><br/>";
//            echo json_encode($result);
//            echo "<br/>";
//            echo "INFO:".json_encode($result["AIPG"]["INFO"]);
//            echo "<br/>";
//            echo "ERR_MSG:".$result["AIPG"]["INFO"]["ERR_MSG"];
            return SBResponse::response($result);
        } else {
            return SBResponse::error("验签结果：验签失败，请检查通联公钥证书是否正确");
        }
    }


    /**
     * 数据源
     * $uid
     * $username
     * $bank_no 收款的银行卡号
     * $amount 金额--单位为分
     */
    private function params($uid, $username, $bank_no, $amount) {
        $time = time() . mt_rand(1000,9999);
        $MERCHANT_ID = '200604000001064'; //商户号
        $USER_NAME = '20060400000106404'; //系统对接用户号
        return array(
            'INFO' => array(
                //交易代码--用于区分交易接口
                'TRX_CODE' => '100014',
                //版本号
                'VERSION' => '05',
                //数据格式
                'DATA_TYPE' => '2',
                //处理级别
                'LEVEL' => '6',
                //系统对接用户号
                'USER_NAME' => $USER_NAME,
                //私钥密码
                'USER_PASS' => '111111',
                //请求流水号
                'REQ_SN' => $time,
            ),
            'TRANS' => array(
                //用户编号--客户编号,开发人员可当作备注字段使用
                'E_USER_CODE' => $uid,
                //银行代码
                'BANK_CODE' => '0308',
                //账号--银行卡或存折号码
                'ACCOUNT_NO' => $bank_no,
                //账号名--银行卡或存折上的所有人姓名。
                'ACCOUNT_NAME' => $username,
                //自定义用户号--商户自定义的用户号，开发人员可省略该字段，也可以当作备注字段使用,该字段会在对账文件中原样返回
                'CUST_USERID' => $uid,
                //交易附言--填入网银的交易备注,可以在网银明细中查询到该字段信息，但部分银行可能不支持
                'SUMMARY' => '提现',
                //备注--供商户填入参考信息。若为信用卡，填有效期, 开发人员可省略该字段，也可以当作备注字段使用
                'REMARK' => '提现',

                //业务代码--在商户入网时由通联分配，商户报文只能上送指定的业务代码。05100:代发佣金  05101:代发工资
                'BUSINESS_CODE' => '09900',
                //商户号
                'MERCHANT_ID' => $MERCHANT_ID,
                //提交时间
                'SUBMIT_TIME' => $time,
                //账号类型--00银行卡，01存折，02信用卡。不填默认为银行卡00。
                'ACCOUNT_TYPE' => '00',
                //账号属性--0私人，1公司。不填时，默认为私人0。
                'ACCOUNT_PROP' => '0',
                //金额--单位为分
                'AMOUNT' => $amount,
                //货币类型--人民币：CNY, 港元：HKD，美元：USD。不填时，默认为人民币。
                'CURRENCY' => 'CNY',
                //开户证件类型--参考A.1证件类型(看具体渠道，有些必须上送，联系客户经理)0:身份证
                'ID_TYPE' => '0',
            ),
        );

    }
}
