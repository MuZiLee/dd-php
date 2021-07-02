<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Favorites;
use app\common\model\Users;
use think\Controller;

/**
 * 收藏
 * Class FavoritesManager
 * @package app\index\controller
 */
class FavoritesManager extends Controller
{

    /**
     * 添加收藏
     */
    public function add() {
        $data = $this->request->only(["type", "title", "subtitle", "cid", "image"]);
        $user = Users::fromToken();
        $data['uid'] = $user->id;
        if (!Favorites::where($data)->find()) {
            Favorites::create($data);
            return SBResponse::response();
        } else {
            return SBResponse::error("已经收藏过了");
        }
    }

    /**
     * 查询是否收藏过
     */
    public function isFavorites() {
        $user = Users::fromToken();
        $data = $this->request->only(['type', "cid"]);
        $data['uid'] = $user->id;
        if (!Favorites::where($data)->find()) {
            return SBResponse::response();
        } else {
            return SBResponse::error();
        }

    }

    /**
     * 删除
     */
    public function del() {
        $user = Users::fromToken();
        $data = $this->request->only(['type', "cid"]);
        $data['uid'] = $user->id;
        $favorites = Favorites::where($data)->find();
        if ($favorites) {
            $favorites->delete();
            return SBResponse::response();
        } else {
            return SBResponse::error();
        }
    }

    /**
     * 获取我的收藏
     */
    public function getList() {
        $user = Users::fromToken();
        $favorites = Favorites::where(['uid'=>$user->id])->select();
        return SBResponse::response($favorites);
    }

}