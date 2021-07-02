<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/13
 * Time: 6:17 AM
 */

namespace app\index\Controller;


use app\_Base\controller\SBResponse;
use app\common\model\Versions;
use think\Controller;

class VersionsManager extends Controller
{
    /**
     * 获取最新版本
     * system: ios android web
     */
    public function update() {
        $system = $this->request->param('system');
        $version = Versions::where(['system'=>$system])->select();
        return SBResponse::response(end($version)[0]);
    }

    /**
     * 获取服务器地址
     */
    public function getServerUrl() {
        return SBResponse::response($_SERVER['SERVER_NAME']);
    }
}