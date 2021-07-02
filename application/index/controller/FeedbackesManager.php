<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Feedbackes;
use app\common\model\Users;
use think\Controller;

/**
 * 意见反馈
 * Class FeedbackesManager
 * @package app\index\controller
 */
class FeedbackesManager extends Controller
{
    public function getList() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $feedbackes = Feedbackes::with("user")->page($page)->limit($limit)->select();

        return json(["data" => $feedbackes, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Feedbackes::count()]);
    }

    /**
     * 创建意见反馈
     *
     * @return \think\Response
     */
    public function create()
    {
        $user = Users::fromToken();
        if (!$user) {
            return SBResponse::response("", 201, "缺少参数");
        }
        $title = $this->request->param("title");
        $content = $this->request->param("content");
        $data["title"] = $title;
        $data["content"] = $content;
        $data["uid"] = $user->id;
        $model = Feedbackes::create($data);
        if ($model) {
            return  SBResponse::response([],200);
        } else {
            return  SBResponse::error();
        }


    }


}