<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/3
 * Time: 7:18 AM
 */

namespace app\index\Controller;


use app\_Base\controller\SBResponse;
use app\common\model\EnterpriseCommission;
use app\common\model\FactorySigningInformation;
use app\common\model\StrategicAlliance;
use think\Controller;

class AbonusManager extends Controller
{
    public function get() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");

        $enterprises = EnterpriseCommission::page($page)->limit($limit)->order('id desc')->select();
        foreach ($enterprises as $enterpris) {
            $strategic = StrategicAlliance::where(["uid"=>$enterpris["strategicId"]])->find();
            $enterpris["strategic"] = $strategic;
            $enterpris["factory"] = FactorySigningInformation::where(["id"=>$enterpris["fid"]])->find();
        }
        return json(["data"=>$enterprises, "page"=>$page, 'limit'=>$limit, 'code' => 0, 'count'=>$enterprises->count()]);
    }

    public function setAbonus() {
        $id = $this->request->param("id");
        $status = $this->request->param("status");
        $remark = $this->request->param("remark");
        $enterprise = EnterpriseCommission::find($id);
        $enterprise->save([
            "status" => $status
            ,"remark" => $remark
        ]);
//        foreach ($enterprise as $ent) {
//            $ent["status"] = 1;
//        }
        return SBResponse::response($enterprise);
    }

}