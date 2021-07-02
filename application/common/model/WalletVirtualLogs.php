<?php


namespace app\common\model;

use think\Model;

/**
 * 钱包流水
 * Class WalletVirtualLogs
 * @package app\common\model

 "wid" => $wallet->id,
"tid" => $tid,
"uid" => $user->id,
"single_number" => md5(time()),
"amount" => $amount,
"balance" => $wallet->balance,
"commission_fee" => $commission_fee,

 */
class WalletVirtualLogs extends Model
{
    public $autoWriteTimestamp = true;

    protected $type = [
      'create_time' => 'timestamp:m月d日 H:i'
    ];

    public function etype() {
        return $this->hasOne("WalletType", "id", "tid");
    }
}