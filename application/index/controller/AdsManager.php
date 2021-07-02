<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/27
 * Time: 4:22 PM
 */

namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Ads;
use think\Controller;

class AdsManager extends Controller
{
    /**
     * 添加启动广告
     */
    public function add() {
        $data = $this->request->only(['type', 'image', 'url', 'title', 'subtitle', 'time']);
        $ad = Ads::create($data);
        return SBResponse::response($ad);
    }

    /**
     * 删除广告
     */
    public function del() {
        $aid = $this->request->param("id");
        $ad = Ads::where(['id'=>$aid])->find();
        $ad->delete();
        return SBResponse::response($ad);
    }

    /**
     * 获取广告列表
     * type: 0 启动广告 1:banner广告 2:职位广告
     */
    public function getAdList() {

        $page = $this->request->param("page");
        if (!$page) {
            $page = 1;
        }
        $limit = $this->request->param("limit");
        if (!$limit) {
            $limit = 15;
        }
        $type = $this->request->param("type");
        if (!$type) {
            $type = 0;
        }
        $ads = Ads::where(['type'=>$type])->page($page)->limit($limit)->select();
        if ($type != 0) {
            foreach ($ads as $ad) {
                $ad->hidden(['time']);
            }
        }
        return json(["data"=>$ads, "page"=>$page, 'limit'=>$limit, 'code' => 0, 'count'=>Ads::where(['type'=>$type])->count()]);
    }

    /**
     * 更新
     */
    public function update() {
        $aid = $this->request->param("id");
        $ad = Ads::where(['id'=>$aid])->find();
        if ($ad) {
            $data = $this->request->only(['title', 'subtitle', 'image', 'url', 'time', 'type']);
            $ad->save($data);
            return SBResponse::response($ad);
        } else {
            return SBResponse::error("广告不存在");
        }

    }


}