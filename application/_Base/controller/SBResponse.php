<?php

namespace app\_Base\controller;

use think\Controller;
use think\facade\Request;


class SBResponse
{
    /**
     *
     * 响应休封装
     * @param $data
     * @param $code
     * @param $msg
     * @return \think\response\Json
     */
    static public function response($data = "", $code = 0, $msg = "成功") {
        $res["code"] = $code;
        $res["msg"] = $msg;
        $res["data"] = $data;
        return json($res);
    }

    /**
     *
     * 响应休封装
     * @param $data
     * @param $code
     * @param $msg
     * @return \think\response\Json
     */
    static public function error($msg = "error", $data = "", $code = 201) {
        $res["code"] = $code;
        $res["msg"] = $msg;
        $res["data"] = $data;
        return json($res);
    }

    /**
     * 返回查询
     * @param $data
     * @param $page
     * @param $limit
     * @param $count
     * @return \think\response\Json
     */
    static public function select($data, $page, $limit, $count) {
        return json(["data" => $data, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => $count]);

    }

}
