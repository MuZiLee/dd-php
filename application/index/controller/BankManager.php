<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\BankList;
use app\common\model\MyBank;
use app\common\model\Users;
use think\Controller;

class BankManager extends Controller
{
    public function get() {
        return SBResponse::response(BankList::all());
    }

    /**
     * 是否添加有银行卡
     */
    public function isWorkers() {
        $user = Users::fromToken();
        if (count(MyBank::where(['uid'=>$user->id])->select()) > 0) {
            return SBResponse::response();
        } else {
            return SBResponse::error();
        }
    }
}