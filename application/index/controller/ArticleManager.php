<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Articles;
use app\common\model\Favorites;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use think\Controller;

/**
 * 涨知识 公告管理
 * Class ArticleManager
 * @package app\index\controller
 */
class ArticleManager extends Controller
{
    /**
     * 文章列表
     */
    public function getList() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $articles = Articles::page($page)->limit($limit)->select();

        return json(["data"=>$articles, "page"=>$page, 'limit'=>$limit, 'code' => 0, 'count'=>Articles::count()]);
    }

    /**
     * 获取涨知识列表 or 获取公告列表
     * 1: 获取涨知识列表
     * 2: 获取公告列表
     */
    public function getArticlelist() {

        $type = $this->request->param("type");
        $articles = Articles::where(["type"=>$type])->all();
        $user = Users::fromToken();
        $user->more();
        if (!$user) {
            return SBResponse::error("缺少token");
        }

        return  SBResponse::response($articles);
    }

    /**
     * add
     */
    public function add() {
        $data = $this->request->param();


        $data["pay_count"] = 0;
        $article = Articles::create($data);
        return SBResponse::response($article);
    }

    /**
     * del
     */
    public function del() {
        $id = $this->request->only(["id"]);
        $article = Articles::get($id);
        if ($article) {
            $article->delete();
        }
        return SBResponse::response($article);
    }

    /**
     * save
     */
    public function save() {
        $id = $this->request->param("id");
        $data = $this->request->param();
        $article = Articles::get($id);
        if ($article) {
            $article->save($data);
        }
        return SBResponse::response($article);
    }

    /**
     * details
     * id 文章ID
     */
    public function details() {
        $id = $this->request->param("id");
        $data = Articles::get($id);
        return SBResponse::response($data);
    }

    /**
     * 消费
     */
    public function buy() {
        $user = Users::fromToken();
//        $price = $this->request->param("much_money"); //价格
//        $dcost = $this->request->param("dandan_cost"); //蛋币
//        $subtitle = $this->request->param("subtitle"); //商品名称
        $id = $this->request->param("id"); //文章ID
        // 取出文章
        $article = Articles::get($id);
        if (!$article) {
            return SBResponse::error("文章已不存在");
        }

        if (Favorites::where(['cid'=>$id, 'type'=>1, 'uid'=>$user->id])->find()) {
            return SBResponse::error("你已经购买过了,请到'我的收藏'查看");
        }

        $wallet = WalletVirtual::where(['uid'=>$user->id])->find();
        // 1:查询用户是否有钱
        $balance = $wallet->balance - $article->much_money;
        if ($balance < 0) {
            return SBResponse::error("余额不足!");
        }
        $total_egg = $wallet->egg_coin - $article->dandan_cost;
        if ($total_egg < 0) {
            return SBResponse::error("蛋币个数不够!");
        }
        // 2:扣款成功
        $wallet->save([
            "balance" => $balance, //余额
            "egg_coin" => $total_egg //剩余蛋币
        ]);

        // 3:保存账单流水记录
        WalletVirtualLogs::create([
            'wid' => $wallet->id,   //钱包ID
            "uid" => $user->id,     //用户ID
            "tid" => WalletType::KnowledgeConsumption,  //流水类型
            "single_number" => md5(time()),     //单号
            "amount" => $article->much_money,   //支付金额
            "egg_coin" => $article->dandan_cost, //支付蛋币
            "amount_type" => false,
            "deduction" => "0.00", //其他扣除费用，如手续费
            "status" => 1,
            "balance" => $balance, //支付后的余额
            "total_egg" => $total_egg, //支付后的蛋币
            "commission_fee" => "0.00",
            "title" => "消费"
        ]);

        // 4: 保存到收藏
        Favorites::create([
            "type" => 1,
            "uid" => $user->id,
            "title" => $article->title,
            "subtitle" => $article->desn,
            "cid" => $article->id,
            "image" => $article->image,
        ]);

        //添加一次购买记录
        $article->save([
            "pay_count" => $article->pay_count + 1
        ]);
        return SBResponse::response();
    }
}