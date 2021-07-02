<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\SystemModel;
use think\Controller;

class SystemSetManager extends Controller
{
    public function get() {
        return SBResponse::response(SystemModel::get(1));
    }

    public function updateshare() {
        $system = SystemModel::get(1);
        $system->save([
            "share_rewards" => $this->request->param("share_rewards")
        ]);
        return SBResponse::response($system);
    }

    public function updatesignin() {
        $system = SystemModel::get(1);
        $system->save([
            "sign_in_reward" => $this->request->param("sign_in_reward")
        ]);
        return SBResponse::response($system);
    }


    public function updatejobsearch() {
        $system = SystemModel::get(1);
        $system->save([
            "distance" => $this->request->param("distance")
        ]);
        return SBResponse::response($system);
    }
}