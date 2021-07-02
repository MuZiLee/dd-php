<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Friends;
use app\common\model\Users;
use think\Controller;

/**
 * 好友管理
 * Class FriendsManager
 * @package app\index\controller
 */
class FriendsManager extends Controller
{
    /**
     * 发起好友申请
     */
    public function friendRequests() {
        $user = Users::fromToken();
        $tuid = $this->request->param("tuid");
        $friend = Friends::where(['fuid'=>$tuid])->find();
        if (!$friend) {
            $friend = Friends::create([
                'tuid' => $tuid,
                'fuid' => $user->id
            ]);
            return SBResponse::response($friend);
        } else {
            if ($friend->status == 1) {
                return SBResponse::error("");
            } else {
                return SBResponse::response();
            }
        }
    }

    /**
     * 我的好友
     */
    public function myFriends() {
        $user = Users::fromToken();
        foreach (Friends::where(['fuid'=>$user])->all() as $item) {

        }
    }
}