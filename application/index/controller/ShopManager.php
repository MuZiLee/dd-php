<?php


namespace app\index\controller;

use app\_Base\controller\SBResponse;
use app\common\model\Addres;
use app\common\model\ShopCart;
use app\common\model\ShopCommodity;
use app\common\model\ShopOrder;
use app\common\model\ShopOrderAddres;
use app\common\model\ShopType;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use think\Controller;
use function Sodium\add;

/**
 * 商城管理
 * Class ShopManager
 * @package app\index\controller
 */
class ShopManager extends Controller
{
    /**
     * 我的商品
     */
    public function myProducts() {
        $user = Users::fromToken();
//        $page = $this->request->param("page");
//        $limit = $this->request->param("limit");
        $commditys = ShopCommodity::where(["uid"=>$user->id])->order("update_time", "desc")->all();
        foreach ($commditys as $item) {
            $item->more();
        }
        return SBResponse::response($commditys);
    }

    /**
     * add我的商品
     */
    public function arrProducts() {
        $user = Users::fromToken();
        $data = $this->request->only([
            "name","tid","price","text","images"
        ]);
        $data["uid"] = $user->id;
        $commodity = ShopCommodity::create($data);
        return SBResponse::response($commodity);
    }

    /**
     * 发布商品
     */
    public function push() {
        $id = $this->request->param("id");
        $shop = ShopCommodity::where(["id"=>$id])->find();
        if ($shop) {
            $shop->save([
                "status" => 1
            ]);
            return SBResponse::response();
        } else {
            return SBResponse::error("商品不存在");
        }
    }

    /**
     * 商品列表
     */
    public function productslist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $commodity = ShopCommodity::page($page)->limit($limit)->order("update_time", "desc")->select();
        foreach ($commodity as $item) {
            $item->more();
        }
        return SBResponse::select($commodity, $page, $limit, $commodity->count());
    }

    /**
     * 商品列表 by type
     */
    public function bannerlist() {

        $commodity = ShopCommodity::where(['type'=>1])->order("update_time", "desc")->all();
        foreach ($commodity as $item) {
            $item->more();
        }
        return SBResponse::response($commodity);
    }

    /**
     * 新品推荐
     */
    public function newArrivals() {
        $commodity = ShopCommodity::where(["tid"=>0])->order("update_time", "desc")->all();
        foreach ($commodity as $item) {
            $item->more();
        }
        return SBResponse::response($commodity);
    }

    /**
     * 商品状态设置
     */
    public function setProductsStatus() {
        $id = $this->request->param("id");
        $status = $this->request->param("status");

        $commodity = ShopCommodity::where(["id"=>$id])->find();
        $commodity->save([
            "status" => $status
        ]);
        return SBResponse::response();
    }

    /**
     * 商品位置设置
     */
    public function setProductsPosition() {
        $id = $this->request->param("id");
        $status = $this->request->param("status");
        $type = $this->request->param("type");
        $tid = $this->request->param("tid");

        $commodity = ShopCommodity::where(["id"=>$id])->find();
        $commodity->save([
            "status" => $status,
            "type" => $type,
            "tid" => $tid
        ]);
        return SBResponse::response();
    }

    /**
     * 删除商品
     */
    public function delProducts() {
        $id = $this->request->param("id");
        $commodity = ShopCommodity::get($id);
        if ($commodity) {
            $commodity->delete($id);
            return SBResponse::response($commodity);
        } else {
            return SBResponse::error("商品已不存在");
        }
    }


    /**
     * 商品类型类别列表
     */
    public function categorylist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");

        $types = ShopType::page($page)->limit($limit)->order("update_time", "desc")->select();

        return SBResponse::select($types, $page, $limit, ShopType::count());
    }

    /**
     * save商品类型
     */
    public function saveCategory() {
        $id = $this->request->param("id");
        $name = $this->request->param("name");
        $image = $this->request->param("image");
        if (!$id) {
            $type = ShopType::create([
                "name" => $name,
                "image" => $image
            ]);
            return SBResponse::response($type);
        } else {
            $type = ShopType::get($id);
            $type->save([
                "name"=>$name,
                "image" => $image
            ]);
            return SBResponse::response($type);
        }
    }

    /**
     * del商品类型
     */
    public function delProductsType() {
        $id = $this->request->param("id");
        $type = ShopType::get($id);
        if ($type->delete($id)) {
            return SBResponse::response();
        } else {
            return SBResponse::error();
        }
    }



    /**
     * 添加购物车
     * sid   商家id
     * cid   订单数量
     * count 购买数量
     * TODO: 支付完毕之后，记录添加订单信息
     */
    public function addCard() {
        $user = Users::fromToken();
        $sid  = $this->request->param("sid");//商家id
        $count= $this->request->param("count");
        $cid  = $this->request->param("cid");
        $price  = $this->request->param("price");


        $ocart = ShopCart::where(['uid'=>$user->id, "cid"=>$cid])->find();
        if ($ocart) {
            $ocart->save([
                "count" => $ocart->count + 1
            ]);
        } else {
            ShopCart::create([
                "uid" => $user->id,
                "sid" => $sid,
                "count" => $count,
                "cid" => $cid,
                "price" => $price
            ]);
        }
        return SBResponse::response();
    }

    /**
     * 查看我的购物车
     */
    public function getCardlist() {
        $user = Users::fromToken();
        $carts = ShopCart::where(['uid'=>$user->id])->select();
        foreach ($carts as $cart) {
            $cart->more();
        }
        return SBResponse::response($carts);
    }

    /**
     * 删除购物车
     */
    public function deleteCard() {
        $cid = $this->request->param("cid");
        $cart = ShopCart::get($cid);
        $cart->delete($cid);
        return SBResponse::response();
    }

    /**
     * 添加订单
     * cid 商品id
     * euid 商家id
     * uid 买家id
     * addid 地址id
     * TODO: 支付完毕之后，记录添加订单信息
     */
    public function addOrder() {
        $user = Users::fromToken();
        $cid = $this->request->param("cid");
        $euid = $this->request->param("euid");
        $uid = $user->id;
        $addid = $this->request->param("addid");
        $count = $this->request->param("count");
        $price = $this->request->param("price");
        if ($cid && $euid && $uid && $addid && $count > 0) {

            $wallet = WalletVirtual::where(['uid'=>$user->id])->find();

            // 1:查询用户是否有钱
            $balance = $wallet->balance - $price;
            if ($balance < 0) {
                return SBResponse::error("余额不足!");
            }

            // 2:扣款成功
            $wallet->save([
                "balance" => $balance, //余额
            ]);

            // 3:保存账单流水记录
            WalletVirtualLogs::create([
                'wid' => $wallet->id,
                "uid" => $user->id,
                "tid" => WalletType::Consumption,//流水类型
                "single_number" => md5(time()),
                "amount" => $price,//价格
                "status" => 1,
                "egg_coin" => $wallet->egg_coin,//剩余蛋币
                "balance" => $balance, //余额
                "amount_type" => false,
                "title" => "消费"
            ]);

            // 保存订单
            ShopOrder::create([
                "cid" => $cid,
                "euid" => $euid,
                "uid" => $uid,
                "count" => $count,
                "price" => $price,
                "addid" => $addid
            ]);
            //删除购物车
            $cart = ShopCart::where(["cid"=>$cid, "uid"=>$uid])->find();
            if ($cart) {
                $cart->delete($cart->id);
            }
            return SBResponse::response();
        } else {
            if (!$cid) {
                return SBResponse::error("商品cid");
            }
            if (!$euid) {
                return SBResponse::error("商家cid");
            }
            if (!$uid) {
                return SBResponse::error("token");
            }
            if (!$addid) {
                return SBResponse::error("地址cid");
            }
            if ($count < 1) {
                return SBResponse::error("缺少购买数量");
            }
        }
    }

    /**
     * 订单列表
     */
    public function orderlist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $orderlist= ShopOrder::page($page)->limit($limit)->order("update_time", "desc")->select();
        foreach ($orderlist as $item) {
            $item->more();
        }
        return SBResponse::select($orderlist, $page, $limit, $orderlist->count());
    }

    /**
     * 我的订单
     */
    public function myOrder() {
        $user = Users::fromToken();
        $orderlist = ShopOrder::where(['uid'=>$user->id])->order("update_time", "desc")->all();
        foreach ($orderlist as $item) {
            $item->more();
        }
        return SBResponse::response($orderlist);
    }

    /**
     * navitems
     */
    public function navitems() {
        $items = [];

        for ($x=0; $x<=10; $x++) {
            $items[] = [
                "id" => $x,
                "title" => "-".$x."-",
                "icon" => "/resources/logo.png"
            ];
        }
        return SBResponse::response($items);
    }

    /**
     * 通过类型ID获取商品列表
     */
    public function goodsByType() {
        $tid = $this->request->param("tid");
        $commodity = ShopCommodity::where(["tid"=>$tid])->select();
        foreach ($commodity as $item) {
            $item->more();
        }
        return SBResponse::response($commodity);
    }

    /**
     * 关键字搜索商品
     */
    public function searchGoods() {
        $keyword = $this->request->param("keyword");
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");

        $commodity = ShopCommodity::where("name", 'like', '%'.$keyword.'%')
            ->page($page)
            ->limit($limit)
            ->order('update_time', 'asc')
            ->select();
        foreach ($commodity as $item) {
            $item->more();
        }
        return SBResponse::response($commodity);
    }

    /**
     * 签收
     */
    public function signFor() {
        $oid = $this->request->param("oid");
        if ($oid) {
            $order = ShopOrder::get($oid);
            if ($order) {
                // 添加商家钱包
                $euser = Users::where(['id'=>$order->euid])->find();
                if (!$euser) {
                    return SBResponse::error("商家不存在");
                }
                $wallet = WalletVirtual::where(['uid'=>$euser->id])->find();
                $wallet->save([
                    "balance" => $wallet->balance + $order->price, //余额
                ]);

                // 3:保存账单流水记录
                WalletVirtualLogs::create([
                    'wid' => $wallet->id,
                    "uid" => $euser->id,
                    "tid" => WalletType::Sell,//流水类型
                    "single_number" => md5(time()),
                    "amount" => $order->price,//价格
                    "status" => 1,
                    "egg_coin" => $wallet->egg_coin,//剩余蛋币
                    "balance" => $wallet->balance, //余额
                    "amount_type" => true,
                    "title" => "签到"
                ]);


                $order->save([
                    "status" => 2
                ]);
                return SBResponse::response($order);
            } else {
                return SBResponse::error();
            }
        } else {
            return SBResponse::error();
        }
    }

    /**
     * 销售记录
     */
    public function salesRecord() {
        $user = Users::fromToken();
        $orderlist = ShopOrder::where(['euid'=>$user->id])->order("update_time", "desc")->all();
        foreach ($orderlist as $item) {
            $item->more();
        }
        return SBResponse::response($orderlist);
    }

    /**
     * 发货
     */
    public function deliverGoods() {
        $oid = $this->request->param("oid");
        if ($oid) {
            $order = ShopOrder::where(['id'=>$oid])->find();
            if ($order) {
                $order->save([
                    "status" => 1
                ]);
                return SBResponse::response($order);
            } else {
                return SBResponse::error("订单不存在");
            }
        } else {
            return SBResponse::error("缺少:oid");
        }
    }

}