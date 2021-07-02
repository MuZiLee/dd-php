<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Addres;
use app\common\model\Users;
use think\Controller;

/**
 * 收货地址管理
 * Class AddresManager
 * @package app\index\controller
 */
class AddresManager extends Controller
{
    public function getAddreslist() {
        $user = Users::fromToken();
        $addres = Addres::where(["uid"=>$user->id])->all();
        return SBResponse::response($addres);
    }

    /**
     * 删除地址
     */
    public function delete() {
        $id = $this->request->param("id");
        $addres = Addres::get($id);
        if ($addres) {
            if ($addres->delete($id)) {
                return SBResponse::response();
            } else {
                return SBResponse::error();
            }
        } else {
            return SBResponse::error();
        }
    }

    public function addAddres() {
        $data = $this->request->only([
            "province","city","district","addres",
            "name","phone","isDefault"
        ]);
        $user = Users::fromToken();
        $data["uid"] = $user->id;

        if ($data['isDefault'] == 1) {
            $addreslist = Addres::where(['uid'=>$user->id])->all();
            foreach ($addreslist as $item) {
                if ($item['isDefault'] == 1) {
                    $item->save([
                        "isDefault" => 0
                    ]);
                }
            }
        }

        $addres = Addres::create($data);
        return SBResponse::response($addres);
    }

    /**
     * 设置默认地址
     */
    public function setAddresDefault() {
        $user = Users::fromToken();
        $id = $this->request->param("id");
        if (!$id) {
            return SBResponse::error();
        } else {
            $address = Addres::where(["uid"=>$user->id])->select();
            foreach ($address as $addr) {
                if ($addr['id'] != $id) {
                    $addr->save([
                        "isDefault" => 0
                    ]);
                } else {
                    $addr->save([
                        "isDefault" => 1
                    ]);
                }
            }
            return SBResponse::response();
        }

    }

}