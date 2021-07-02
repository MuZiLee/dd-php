<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/6
 * Time: 12:43 AM
 */

namespace app\index\Controller;


use app\_Base\controller\SBResponse;
use app\common\model\Borrow;
use app\common\model\Dividend;
use app\common\model\Events;
use app\common\model\EventsLogs;
use app\common\model\EventsPaySlip;
use app\common\model\EventsStaff;
use app\common\model\EventsStaffLogs;
use app\common\model\EventsType;
use app\common\model\FactoryBasicInformation;
use app\common\model\FactoryEnvironmentAndTreatment;
use app\common\model\FactoryHr;
use app\common\model\FactoryImages;
use app\common\model\FactoryInformation;
use app\common\model\FactoryJobs;
use app\common\model\FactoryJobType;
use app\common\model\FactoryPlantRelatedPersonnel;
use app\common\model\FactorySigningInformation;
use app\common\model\FactoryStaff;
use app\common\model\FactoryTeacher;
use app\common\model\PartnerPivot;
use app\common\model\RolesPivot;
use app\common\model\RolesType;
use app\common\model\Users;
use app\common\model\WalletType;
use app\common\model\WalletVirtual;
use app\common\model\WalletVirtualLogs;
use think\Controller;
use think\Db;
use think\db\Connection;


class FactorysManager extends Controller
{
    /**
     * 获取渲染数据
     */
    public function getCondition()
    {
        $data = [
            //合作方式
            "cooperation_mode" => [
                ["id"=>"小时工", "title"=>"小时工"]
                ,["id"=>"同工同酬", "title"=>"同工同酬"]
                ,["id"=>"代理招聘", "title"=>"代理招聘"]
            ],
            //发放工资方式
            "salary_payment_method" => [
                ['id'=>"蛋蛋发放", "title"=>"蛋蛋发放"]
                ,['id'=>"其他", "title"=>"其他"]
            ],
            //厂房性质
            "nature_of_plant" => [
                ["id"=>"自建","title"=>"自建"]
                ,["id"=>"租赁","title"=>"租赁"]
                ,["id"=>"借用","title"=>"借用"]
            ],
            //企业性质
            "nature_of_enterprise" => [
                ["id"=>"国营企业", "title"=>"国营企业"]
                ,["id"=>"私营企业", "title"=>"私营企业"]
                ,["id"=>"中外合资企业", "title"=>"中外合资企业"]
                ,["id"=>"国私合资企业", "title"=>"国私合资企业"]
            ],
            //工种
            "type_of_work" => [
                ["id"=>"小时工","title"=>"小时工"]
                ,["id"=>"社会工","title"=>"社会工"]
                ,["id"=>"学生工","title"=>"学生工"]
                ,["id"=>"同工同酬","title"=>"同工同酬"]
                ,["id"=>"代理招聘","title"=>"代理招聘"]
            ],
            //月份
            "month" => [
                ["id" => 1, "title"=>"1月份"]
                ,["id" => 2, "title"=>"2月份"]
                ,["id" => 3, "title"=>"3月份"]
                ,["id" => 4, "title"=>"4月份"]
                ,["id" => 5, "title"=>"5月份"]
                ,["id" => 6, "title"=>"6月份"]
                ,["id" => 7, "title"=>"7月份"]
                ,["id" => 8, "title"=>"8月份"]
                ,["id" => 9, "title"=>"9月份"]
                ,["id" => 10, "title"=>"10月份"]
                ,["id" => 11, "title"=>"11月份"]
                ,["id" => 12, "title"=>"12月份"]
            ]
        ];
        return SBResponse::response($data);
    }

    /**
     * 创建工厂
     * TODO : 创建工厂是否需要给业务员处理提成等???
     */
    public function input()
    {
        $user = Users::fromToken();

        if (!$user) {
            return SBResponse::error("缺少token");
        }

        //基本信息
        $basic = $this->request->param();
        $id = $this->request->param("id");

        $basic['uid'] = $user->id;
        $factory = FactoryBasicInformation::get($id);
        if ($factory) {
            unset($basic['id']);
            $factory->save($basic);
        } else {
            $factory = FactoryBasicInformation::create($basic);
        }
        $basic["fid"] = $factory->id;


        if ($factory) {
            /**
             * 业务员录入工厂事件比较简单,只记录uid , fid, etid
             */
            /// TODO: 添加录入工厂事件
            $salesman["uid"] = $user->id;
            $salesman["etid"] = EventsType::factory_entry;
            $salesman["fid"] = $factory->id;
            if (!Events::where($salesman)->find()) {
                Events::create($salesman);
            }

            //图片
            foreach ($basic['images'] as $image) {
                if ($image) {
                    FactoryImages::create([
                        "url" => $image,
                        "fid" => $basic['fid']
                    ]);
                }
            }

            //签单信息
            $basic['signed_unit_price'] = $basic['signed_unit_price']+0;
            if (is_int($basic['signed_unit_price'])) {
                $basic['signed_unit_price'] = $basic['signed_unit_price'].".0";
            }

            $basic['employee_unit_price'] = $basic['employee_unit_price']+0;
            if (is_int($basic['employee_unit_price'])) {
                $basic['employee_unit_price'] = $basic['employee_unit_price'].".0";
            }
            $basic['commission_for_teacher'] = $basic['commission_for_teacher']+0;
            if (is_int($basic['commission_for_teacher'])) {
                $basic['commission_for_teacher'] = $basic['commission_for_teacher'].".0";
            }
            $basic['commission_for_salesman'] = $basic['commission_for_salesman']+0;
            if (is_int($basic['commission_for_salesman'])) {
                $basic['commission_for_salesman'] = $basic['commission_for_salesman'].".0";
            }
//        if (!$basic['insurance_premium']) {
//            $basic['insurance_premium'] = "0.0";
//        }
//        if (!$basic['income_tax']) {
//            $basic['income_tax'] = "0.0";
//        }

            $factory->signingInformation()->save($basic);
            //厂房信息
            $factory->information()->save($basic);
            //工厂相关人员
            $factory->personnel()->save($basic);
            //环境与待遇
            $factory->environmental()->save($basic);

        }

        return SBResponse::response($factory);
    }

    /**
     * 获取工厂录入事件
     */
    public function getInputEvent() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(["etid"=>EventsType::factory_entry])->page($page)->limit($limit)->order('create_time desc')->select();
//        $factorys = FactoryBasicInformation::all();
//
//        foreach ($factorys as $factory) {
//            $factory->more();
//
//        }

        foreach ($events as $event) {
            $event->more();
            $event->factory->more();
            $event->factory["count"] = FactoryTeacher::where(['fid'=>$event->fid])->count();
            $event->factory["hrcount"] = FactoryHr::where(['fid'=>$event->fid])->count();
            $event->factory["jobcount"] = FactoryJobs::where(['fid'=>$event->fid])->count();
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where(["etid"=>EventsType::factory_entry])->count()]);
    }

    /**
     * 删除工厂 及 事件记录
     */
    public function dele()
    {
        $data = $this->request->param('id');
        if (!$data) {
            return SBResponse::error("缺少ID");
        }
        $factory = FactoryBasicInformation::where(['id'=>$data])->find();


        if (!$factory) {
            return SBResponse::error("工厂不存在或已被删除,请刷新页面");
        } else {
            $factory->delete($factory->id);
        }

        $tcount = FactoryTeacher::where(['fid'=>$data])->count();
        $hrs = FactoryHr::where(["fid"=>$data])->count();
        $jobs = FactoryJobs::where(["fid"=>$data])->count();
        $staff = FactoryStaff::where(["fid"=>$data, 'status'=>1])->count();
        if ($tcount > 0 || $hrs > 0 || $jobs > 0 || $staff > 0) {
            return SBResponse::error("存在多个条件:\n".$tcount."个工厂HR"."\n".$hrs."个驻场老师"."\n".$jobs."个职位"."\n".$staff."个工人");
        }



        /// TODO: 续条删除
        // 删除事件以及历史
        $event = Events::where(["fid"=>$data,"etid"=>EventsType::factory_entry])->find();
        if ($event) {
            $logs = EventsLogs::where(["eid"=>$event->id])->all();
            foreach ($logs as $log) {
                $log->delete($log->id);
            }
            $event->delete($event->id);
        }

        // 删除工厂信息
        $information = FactoryInformation::where(['fid'=>$data])->find();
        if ($information) {
            $information->delete($information->id);
        }

        // 删除工厂签单信息
        $signingInformation = FactorySigningInformation::where(["fid"=>$data])->find();
        if ($signingInformation) {
            $signingInformation->delete($signingInformation->id);
        }

        // 删除工厂环境图片
        $images = FactoryImages::where(["fid"=>$data])->all();
        foreach ($images as $image) {
            $image->delete($image->id);
        }

        // 删除工厂环境信息
        $environment = FactoryEnvironmentAndTreatment::where(["fid"=>$data])->find();
        if ($environment) {
            $environment->delete($environment->id);
        }

        // 删除工厂相关人员信息
        $personnel = FactoryPlantRelatedPersonnel::where(["fid"=>$data])->find();
        if ($personnel) {
            $personnel->delete($personnel->id);
        }


        return SBResponse::response();


    }

    /**
     * 获取工厂信息
     */
        public function getInfo()
    {
        $data = $this->request->param('id');
        $factory = FactoryBasicInformation::get($data);
        if ($factory) {
            $factory->more();
        }

        return SBResponse::response($factory);
    }

    /**
     * 获取工厂图片
     */
    public function getImages() {
        $fid = $this->request->param("fid");
        $images = FactoryImages::where(['fid'=>$fid])->select();
        return SBResponse::response($images);
    }


    /**
     * 获取工厂列表
     *
     */
    public function getlist()
    {

        $data = $this->request->param();
        $page = $data['page'];
        $limit = $data['limit'];
        $factorylist = FactoryBasicInformation::page($page)->limit($limit)->order('id desc')->select();
        foreach ($factorylist as $factory) {
            $factory->more();
        }
        return json(["data" => $factorylist, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => FactoryBasicInformation::count()]);
    }



    /**
     * 获取已审核通过的工厂列表
     */
    public function getOkList()
    {
        $datas = Factorys::with('signInfo')->where(['status'=>1])->order('id desc')->all();

        return SBResponse::response($datas);
    }




    /**
     * TODO: 审核工厂
     */
    public function dispose() {
        $user = Users::fromToken();
        if (!$user) {
            return SBResponse::error("缺少token");
        }
        $data = $this->request->only(['eid', 'status', 'remark', 'fid']);
        if (!$data['eid']) {
            return SBResponse::error("缺少eid");
        }

        /// TODO: 工厂审核完后,对业务的提成应该怎么处理?
        /// TODO: 业务员录入的工厂哪个角色来审核?

        $data['rid'] = RolesType::resident_teacher;
        $data["uid"] = $user->id;
        EventsLogs::create($data);

        $factory = FactoryBasicInformation::where(["id"=>$data['fid']])->find();
        if ($factory) {
            $factory->save([
                "status" => $data['status'],
            ]);
        }

        return SBResponse::response();
    }


    /**
     * 获取某工厂下的驻场老师列表
     */
    public function getTeacherList()
    {
        $id = $this->request->param('id');
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $teachers = FactoryTeacher::where(['fid' => $id])->all();

        foreach ($teachers as $teacher) {
            $teacher->info;
        }
        return json(["data" => $teachers, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => FactoryTeacher::where(['fid'=>$id])->count()]);
    }

    /**
     * 可用的驻场老师分配信息 未分配该工厂的用户
     */
    public function getAvailableTeacher()
    {
        $fid = $this->request->param("fid");
        $users = Users::all();

        $teachers = [];
        foreach ($users as $user) {
            if (!FactoryTeacher::where(['uid'=>$user->id, "fid"=>$fid])->find()) {
                $teachers[] = $user;
            }
        }
        return SBResponse::response($teachers);

    }


    /**
     * 分配驻场老师
     */
    public function allotTeacher()
    {
        $data = $this->request->only(['fid', 'uid']);
        if (!FactoryTeacher::where($data)->find()) {
            $teacher = FactoryTeacher::create($data);
        } else {
            return SBResponse::error("TA已经分配到该工厂了");
        }

        $user = Users::where(['id'=>$data['uid']])->find();
        $pivot = RolesPivot::where(['rid'=> RolesType::resident_teacher, "uid"=>$user->id])->find();
        if (!$pivot) {
            RolesPivot::create([
                "rid" => RolesType::resident_teacher,
                "uid" => $user->id,
                "title" => "驻场老师"
            ]);
        }
        return SBResponse::response($teacher);
    }

    /**
     * 某工厂下的某个删除驻场老师
     */
    public function delTacher()
    {
        $data = $this->request->only(['fid', 'uid']);
        $teacher = FactoryTeacher::where(['uid'=>$data['uid'], 'fid'=>$data['fid']])->find();
        if ($teacher) {
            $teacher->delete($teacher->id);
            if (FactoryTeacher::where(['uid'=>$data['uid']])->count() < 1) {
                $pivot = RolesPivot::where(['rid'=> RolesType::resident_teacher, "uid"=>$data['uid']])->find();
                if ($pivot) {
                    $pivot->delete($pivot->id);
                }
            }
        }
        return SBResponse::response($data);
    }


    /**
     * 获取某工厂下的工厂HR列表
     */
    public function getFactoryHRList()
    {
        $id = $this->request->param('id');
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $hrs = FactoryHr::with("info")->where(['fid' => $id])->page($page)->limit($limit)->select();
        foreach ($hrs as $hr) {
            $hr->info;
        }
        return json(["data" => $hrs, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => FactoryHr::where(['fid'=>$id])->count()]);

    }


    /**
     * 分配工厂HR
     */
    public function allotFactoryHR()
    {
        $data = $this->request->only(['fid', 'uid']);

        if (!FactoryHr::where($data)->find()) {
            $hr = FactoryHr::create($data);
        } else {
            return SBResponse::error("TA已经分配到该工厂了");
        }
        $user = Users::where(['id'=>$data['uid']])->find();
        $pivot = RolesPivot::where(['rid'=> RolesType::factory_hr, "uid"=>$data['uid']])->find();
        if (!$pivot) {
            RolesPivot::create([
                "rid" => RolesType::factory_hr,
                "uid" => $user->id,
                "title" => "工厂HR"
            ]);
        }
        return SBResponse::response($hr);
    }

    /**
     * 某工厂下的某个删除工厂HR
     */
    public function delFactoryHR()
    {
        $data = $this->request->only(['fid', 'uid']);
        $hr = FactoryHr::where(['uid'=>$data['uid'], 'fid'=>$data['fid']])->find();
        if ($hr) {
            $hr->delete();
            if (FactoryHr::where(['uid'=>$data['uid']])->count() < 1) {
                $pivot = RolesPivot::where(['rid'=> RolesType::factory_hr, "uid"=>$data['uid']])->find();
                if ($pivot) {
                    $pivot->delete();
                }
            }
        }
        return SBResponse::response($data);
    }




    /**
     * 可用的工厂HR分配信息 未分配的用户 已分配的用户
     */
    public function getAvailableFactoryHR()
    {
        $fid = $this->request->param("fid");
        $factory = FactoryBasicInformation::where(['id' => $fid])->find();
        $hrs = $factory->hrs;

        $users = Users::all();
        $u = [];
        if (count($hrs)) {
            foreach ($users as $user) {
                foreach ($hrs as $hr) {
                    if ($user['id'] != $hr['id']) {
                        $u[] = $user;
                    }
                }
            }
            return SBResponse::response($u);
        } else {
            return SBResponse::response($users);
        }
    }




    /**
     * 添加/更新税金
     */
    public function addTax() {
        $data = $this->request->param();
        $signInfo = FactorySigningInformation::where(['id'=>$data['id']])->find();
        $signInfo->save([
            "income_tax" => $data['income_tax']
        ]);
        return SBResponse::response($signInfo);
    }


    /**
     * 添加/更新保险费
     */
    public function addTnsurance() {
        $data = $this->request->param();
        $signInfo = FactorySigningInformation::where(['id'=>$data['id']])->find();
        $signInfo->save([
            "insurance_premium" => $data['insurance_premium']
        ]);
        return SBResponse::response($signInfo);
    }

    /**
     * 修改签单信息
     */
    public function setSigningInfo() {
        $data = $this->request->only([
            "cooperation_mode",
            "salary_payment_method",
            "signed_unit_price",
            "employee_unit_price",
            "commission_for_teacher",
            "commission_for_salesman",
            "settlement_date",
            "startTime",
            "endTime",
            "fid",
            "id",
            "income_tax",
            "insurance_premium",
            "management_expense"
        ]);

        $signingInfo = FactorySigningInformation::get($data['id']);
        if ($signingInfo) {
            $signingInfo->save($data);
        }
        return SBResponse::response($signingInfo);
    }


    /**
     * ---------------------------------------------------------
     *  职位
     * ---------------------------------------------------------
     */
    public function getJobTypes() {
        //职位类型
        return SBResponse::response(FactoryJobType::all());
    }

    /**
     * 添加工厂职位
     */
    public function addJob() {
        $data = $this->request->param();
        $fid = $this->request->param("fid");
        $info = FactoryBasicInformation::where(["id"=>$fid])->find();
        $data["city"] = $info["city"];
        $job = FactoryJobs::create($data);
        return SBResponse::response($job);
    }

    /**
     * 审核通过的工厂列表
     */
    public function getAvailableTactorylist() {
        $factorys = FactoryBasicInformation::where(['status'=>1])->all();
        return SBResponse::response($factorys);
    }

    /**
     * 工厂职位列表
     */
    public function jobList() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $jobs = FactoryJobs::with(["factory", 'jobType'])->page($page)->limit($limit)->select();
        foreach ($jobs as $job) {
            $job->factory['signingInformation'] = FactorySigningInformation::where(["fid"=>$job->factory->id])->find();
        }
        return json(["data" => $jobs, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => FactoryJobs::count()]);
    }

    /**
     * usableJobList
     * 获取可用的职位列表
     */
    public function usableJobList($latitude = 0, $longitude = 0) {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $jtid = $this->request->param("jtid");
        $isHot = $this->request->param("isHot");
        $city = $this->request->param("city");
//        $latitude = $this->request->param("latitude");
//        $longitude = $this->request->param("longitude");
        $minimum_search_range = $this->request->param("minimum_search_range");
        $maximum_salary_range = $this->request->param("maximum_salary_range");

        if ($isHot == 1) {
            $jobs = FactoryJobs::with(["factory", 'jobType'])
                ->where("status", '=', 1)
                ->where(["isHot" => $isHot, "city"=>$city])
                ->where("minimum_search_range" , ">" , $minimum_search_range)
                ->where("maximum_salary_range" , "<" , $maximum_salary_range)
                ->page($page)
                ->limit($limit)
                ->select();
        } else if ($jtid == 1){
            $jobs = FactoryJobs::with(["factory", 'jobType'])
                ->where("status", '=', 1)
                ->where(["city"=>$city])
                ->where("minimum_search_range" , ">" , $minimum_search_range)
                ->where("maximum_salary_range" , "<" , $maximum_salary_range)
                ->page($page)
                ->limit($limit)
                ->select();
        } else {
            $jobs = FactoryJobs::with(["factory", 'jobType'])
                ->where("status", '=', 1)
                ->where(["job_type" => $jtid, "city"=>$city])
                ->where("minimum_search_range" , ">" , $minimum_search_range)
                ->where("maximum_salary_range" , "<" , $maximum_salary_range)
                ->page($page)
                ->limit($limit)
                ->select();
        }


        foreach ($jobs as $job) {
            $job->distance = getDistance($longitude, $latitude, $job->factory->longitude, $job->factory->latitude).'km';
        }
        return json(["data" => $jobs, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => FactoryJobs::where(["status"=>1])->count()]);

    }

    /**
     * 设置是否热招
     */
    public function isHotJob() {
        $jid = $this->request->param("id");
        $job = FactoryJobs::get($jid);
        $job->save([
            "isHot" => !$job->isHot
        ]);
        return SBResponse::response($job);
    }
    /**
     * 删除职位
     */
    public function delJob() {
        $jid = $this->request->param("id");
        $job = FactoryJobs::get($jid);
        if ($job) {
            $job->delete();
        }
        return SBResponse::response($job);
    }

    /**
     * 发布职位
     */
    public function pushJob() {
        $jid = $this->request->param("id");
        $status = $this->request->param("status");
        if ($status == 1) {
            return SBResponse::error("职位已经发布");
        }
        $job = FactoryJobs::get($jid);
        if ($job) {
            $job->save([
                "status" => 1
            ]);
        }
        return SBResponse::response($job);
    }

    /**
     * 下架职位
     */
    public function soldOutJob() {
        $jid = $this->request->param("id");
        $status = $this->request->param("status");
        if ($status == 2) {
            return SBResponse::error("职位未发布");
        }
        $job = FactoryJobs::get($jid);
        if ($job) {
            $job->save([
                "status" => 2
            ]);
        }
        return SBResponse::response($job);
    }

    /**
     * 查看单个职位信息
     */
    public function jobInfo() {
        $jid = $this->request->param("id");

        $job = FactoryJobs::with(["factory", 'jobType'])->get($jid);
        $job['types'] = FactoryJobType::all();
        $job['factorys'] = FactoryBasicInformation::where(['status'=>1])->all();
        return SBResponse::response($job);
    }

    /**
     * 更新职位
     */
    public function updateJob() {
        $data = $this->request->param();

        $job = FactoryJobs::get($data['id']);
        $job->save($data);

        return SBResponse::response($job);
    }


    /**
     * 工厂职位详情
     */
    public function detailJob() {
        $jid = $this->request->param("jid");
        $job = FactoryJobs::get($jid);
        $job->factory->images;
        $job->factory->information;
        $job->factory->environmental;
        $job->jobType;
        return SBResponse::response($job);
    }

    /**
     * 关键字搜索职位
     */
    public function jobSearch() {
        $keyword = $this->request->param("keyword");
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $latitude = $this->request->param("latitude");
        $longitude = $this->request->param("longitude");
        //是否是纯数字
        //is_numeric($keyword)

        $jobs = FactoryJobs::where("job_name", 'like', '%'.$keyword.'%')
            ->page($page)
            ->limit($limit)
            ->order('update_time', 'asc')
            ->select();
        foreach ($jobs as $job) {
            $job->distance = getDistance($longitude, $latitude, $job->factory->longitude, $job->factory->latitude).'km';
        }
        return SBResponse::response($jobs);
    }


    /**
     * 获取签单信息
     * @return \think\response\Json
     */
    public function getSigningInfo() {
        $fid = $this->request->param("fid");
        if ($fid) {
             $info = FactorySigningInformation::where(["fid"=>$fid])->find();
             //业务员ID
             $personnel = FactoryPlantRelatedPersonnel::where(["fid"=>$fid])->find();
             $phone = $personnel["follow_up_person_phone"];
             $user = Users::where(["phone"=>$phone])->find();
             $info["salesmanId"] = $user["id"];

             return SBResponse::response($info);
        } else {
            return SBResponse::error();
        }

    }


    /**
     * 获取工工厂中的老师
     */
    public function getTeacherByFid() {
        $fid = $this->request->param("fid");
        $teacher = FactoryTeacher::where(["fid"=>$fid])->find();
        return SBResponse::response($teacher);
    }




    /**
     * --------------------------------------
     * --------------------------------------
     * 以下为会员事件
     * EventsType 使用
     * Events
     * EventsLogs
     * --------------------------------------
     * --------------------------------------
     */

    /**
     * TODO: 添加 职位报名申请
     */
    public function apply() {
        $user = Users::fromToken();
        $fid = $this->request->param("fid");
        $jid = $this->request->param("jid");

        $event = Events::where(["uid"=>$user->id, "fid"=>$fid, "jid"=>$jid, 'etid'=>EventsType::position_application, "status"=>0])->find();
        if (!$event) {
            Events::create([
                "uid" => $user->id,
                "etid" => EventsType::position_application,
                "fid" => $fid,
                "pid" => $user->partner->pid,
                "jid" => $jid
            ]);
            return SBResponse::response($event);
        } else {
            return SBResponse::error("你已经申请过了");
        }
    }

    /**
     * TODO: 获取 职位报名申请 列表
     */
    public function getApplylist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where(['etid'=>EventsType::position_application])->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
            unset($event);
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where(['etid'=>EventsType::position_application])->count()]);
    }

    /**
     * TODO: 查询职位是否已经报名
     */
    public function isApply() {
        $jid = $this->request->param("jid");
        $user = Users::fromToken();
        $event = Events::where(['jid'=>$jid, "uid"=>$user->id, "etid"=>EventsType::position_application])->find();
        return SBResponse::response($event);
    }


    /**
     * TODO: 驻场老师的审核事件--入职事件列表
     */
    public function auditPATeacher() {

        $data = [];

        $data["fid"] = $this->request->param("fid");
        $data['etid'] = EventsType::position_application; //职位报名事件
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = Events::where($data)->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
//            $event["user"]['company'] = StrategicAlliance::where(['uid'=>$event->uid])->find();
        }
        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where($data)->count()]);
    }

    /**
     * TODO: 驻场老师的审核事件--入职确认
     */
    public function inJobReview() {
        $data = $this->request->only(['status', 'remark','eid']);
        if (!$data['remark']) {
            return SBResponse::error("缺少备注");
        }
        $event = Events::get($data['eid']);
        if ($event) {
            $user = Users::fromToken();
            if (!$user) {
                return SBResponse::error("缺少token");
            }
            $data['rid'] = RolesType::resident_teacher;
            $data['uid'] = $user->id;
            $logs = EventsLogs::create($data);
            if ($logs && $logs->status == 1) {
                $staff['fid'] = $event->fid;
                $staff['uid'] = $event->uid;
                $staff['jid'] = $event->jid;
                $staff['pid'] = $event->pid;

                if (!FactoryStaff::where($staff)->find()) {
                    FactoryStaff::create($staff);// 添加员工
                    if (!RolesPivot::where(['rid'=>RolesType::worker, "uid"=>$event->uid])->find()) {
                        /// TODO:添加员工角色
                        RolesPivot::create([
                            "uid" => $event->uid,
                            "rid" => RolesType::worker,
                            "title" => "工人"
                        ]);
                    }
                    $information = FactoryInformation::where(["fid"=>$event->fid])->find();
                    if ($information) {
                        $information->expected_demand = $information->expected_demand - 1;
                        if ($information->expected_demand) {
                            // 工厂预算招聘人数 expected_demand
                            // TODO: 暂需求不明确
                        }
                        // TODO: 职位已经招聘人数+1 number_of_people_recruited
                        $job = FactoryJobs::where(["id"=>$event->jid])->find();
                        if ($job) {
                            $job->save([
                                "number_of_people_recruited" => $job->number_of_people_recruited + 1
                            ]);
                        }
                    }
                }
//                $euser = Users::where(['id'=>$event->uid])->find();
//                $jpush = new JPushServers();
//                $jpush->pushOne($euser->phone, "【入职报名】", "你的入职状态已更新");
            }
            $event->more();
            return SBResponse::response($event);
        } else {
            return SBResponse::error("事件不存在");
        }
    }



















    /**
     * --------------------------------------
     * --------------------------------------
     * 以下为员工事件
     * EventsType 不变
     * Events => EventsStaff
     * EventsLogs => EventsStaffLogs
     * --------------------------------------
     * 提交事件参照 StaffManager员工管理类
     * --------------------------------------
     */



    /**
     * 按工厂分类
     * TODO : 获取--请假事件列表
     * TODO : 获取--报销事件列表
     * TODO : 获取--离职事件列表
     * EventsStaff
     */
    public function getStafflist() {

        $data = $this->request->only(["etid", "fid"]);
        EventsType::leave_application;
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = EventsStaff::where($data)->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
        }

        return json(["data" => $events, "page" => $page, 'limit' => $limit, 'code' => 0, 'count' => Events::where($data)->count()]);
    }

    /**
     * TODO : 驻场老师审核--请假事件审核
     * TODO : 驻场老师审核--报销事件审核
     * TODO : 驻场老师审核--离职事件审核
     * EventsStaff
     * EventsStaffLogs
     */
    public function staffAudit() {
        $data = $this->request->only(['status', 'remark','eid']);
        if (!$data['remark']) {
            return SBResponse::error("缺少备注");
        }
        $event = EventsStaff::get($data['eid']);
        if ($event) {
            $user = Users::fromToken();
            if (!$user) {
                return SBResponse::error("缺少token");
            }
            $data['rid'] = RolesType::resident_teacher;
            $data['uid'] = $user->id;
            $log = EventsStaffLogs::create($data);
            return SBResponse::response($log);
        } else {
            return SBResponse::error("事件不存在");
        }
    }

    /**
     * TODO: 获取某工厂下所有员工
     */
    public function getStaffInfolist() {
        $fid = $this->request->param("fid");
        $staffs = FactoryStaff::where(['fid'=>$fid, 'status'=>1])->all();
        foreach ($staffs as $staff) {
            $staff->sigingInformation;
            $staff->factory;
            $staff->user;
            $staff->job;
            $staff->envAndTreat;
            $staff['punchIn'] = EventsStaff::where(monthWhere(time()))->where(['uid'=>$staff->user['id'], 'etid'=>EventsType::punch_the_clock, 'status'=>1])->all();
            $staff['advance'] = EventsStaff::where(monthWhere(time()))->where(['uid'=>$staff->user['id'], 'etid'=>EventsType::advance_payments, 'status'=>1])->find();
            $staff['partenerPvivot'] = PartnerPivot::with('strategic')->where(['uid'=>$staff->uid])->find();
            $slips = EventsPaySlip::where(monthWhere(time()))->where(['uid'=>$staff->uid])->select();
            $staff['isSlip'] = count($slips) > 0 ? 1 : 0;
        }
        return SBResponse::response($staffs);
    }

    /**
     * TODO : 人事部 获取 请假事件列表
     */
    public function getLeavelist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = EventsStaff::where(['etid'=>EventsType::leave_application])->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
        }
        return SBResponse::select($events, $page, $limit, EventsStaff::where(['etid'=>EventsType::leave_application])->count());
    }

    /**
     * TODO : 人事部 & 财务部 获取 所有报销事件列表
     */
    public function getReimbursementlist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = EventsStaff::where(['etid'=>EventsType::claim_for_reimbursement])->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
        }
        return SBResponse::select($events, $page, $limit, EventsStaff::where(['etid'=>EventsType::claim_for_reimbursement])->count());
    }

    /**
     * TODO : 人事部 & 财务部 获取 所有离职事件列表
     */
    public function getQuitlist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = EventsStaff::where(['etid'=>EventsType::quit_application])->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
            $staff = FactoryStaff::where(["uid"=>$event->user['id'], "fid"=>$event->factory['id'], "jid"=>$event->job['id']])->find();
            if ($staff) {
                $event['injob_time'] = $staff->create_time;
            }
        }
        return SBResponse::select($events, $page, $limit, EventsStaff::where(['etid'=>EventsType::quit_application])->count());
    }

    /**
     * TODO : 人事部审核--请假事件审核
     * TODO : 人事部审核--报销事件审核
     * TODO : 人事部审核--离职事件审核
     * EventsStaff
     * EventsStaffLogs
     */
    public function personnelAudit() {
        $data = $this->request->only(['status', 'remark','eid']);
        if (!$data['remark']) {
            return SBResponse::error("缺少备注");
        }
        $event = EventsStaff::get($data['eid']);
        if ($event) {

            if ($data['eid'] == EventsType::leave_application) {
                /// 只有请假时才设置事件状态
                $event->save([
                    "status" => $data['status']
                ]);
            }

            $user = Users::fromToken();
            if (!$user) {
                return SBResponse::error("缺少token");
            }
            $data['rid'] = RolesType::ministry_of_personnel;
            $data['uid'] = $user->id;
            $log = EventsStaffLogs::create($data);

            if ($data['status'] == 1) {
//                if ($event->etid == EventsType::leave_application) {
//                    $euser = Users::where(['id'=>$event->uid])->find();
//                    $jpush = new JPushServers();
//                    $jpush->pushOne($euser->phone, "【请假申请】", "你的请假申请已审批");
//                }
                if ($event->etid == EventsType::quit_application) {
                    $pivot = RolesPivot::where(['uid'=>$event->uid, 'rid'=>RolesType::worker])->find();
                    if ($pivot) {
                        $pivot->delete($pivot->id);
                    }
                    $staff = FactoryStaff::where(['uid'=>$event->uid])->find();
                    if ($staff) {
//                        $staff->save([
//                            'status' => 0
//                        ]);
                        $staff->delete();
                    }


//                    $euser = Users::where(['id'=>$staff->uid])->find();
//                    $jpush = new JPushServers();
//                    $jpush->pushOne($euser->phone, "【离职申请】", "你的离职申请已审批");

                }
            }

            return SBResponse::response($log);
        } else {
            return SBResponse::error("事件不存在");
        }
    }

    /**
     * TODO : 人事部 & 财务部 获取 所有预支事件列表
     */
    public function getAdvancelist() {
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $events = EventsStaff::where(['etid'=>EventsType::advance_payments])->page($page)->limit($limit)->select();
        foreach ($events as $event) {
            $event->more();
            $staff = FactoryStaff::where(["uid"=>$event->user['id'], "fid"=>$event->factory['id'], "jid"=>$event->job['id']])->find();
//            $event['advancel_time'] = $staff->create_time;
            $event['sigingInfo'] = FactorySigningInformation::where(["fid"=>$event->fid])->find();
        }
        return SBResponse::select($events, $page, $limit, EventsStaff::where(['etid'=>EventsType::advance_payments])->count());
    }


    /**
     * TODO : 财务部审核
     * EventsStaff
     * EventsStaffLogs
     */
    public function businessAudit() {
        $data = $this->request->only(['status', 'remark','eid','etid']);

        if (!$data['remark']) {
            return SBResponse::error("缺少备注");
        }
        $event = EventsStaff::get($data['eid']);
        if ($event) {
            $user = Users::fromToken();
            if (!$user) {
                return SBResponse::error("缺少token");
            }

            $data['rid'] = RolesType::finance_department; //财务部审核
            $data['uid'] = $user->id;

            if ($data['etid'] == EventsType::claim_for_reimbursement) {
                /// TODO : 报销审核
                /**
                 * 1:驻场老师在工资条中需要加上报销金额
                 */
                $event->save([
                    "status" => $data['status']
                ]);
                if ($event->status == 1) {
//                    $euser = Users::where(['id'=>$event->uid])->find();
//                    $jpush = new JPushServers();
//                    $jpush->pushOne($euser->phone, "【报销申请】", "你的报销申请已审批");
                }
            }


            if ($data['etid'] == EventsType::quit_application) {
                /// TODO : 离职审核
                /// 需要删除员工角色
                $euid = $event->uid;
                $event->save([
                    "status" => $data['status']
                ]);
                if ($data['status'] == 1) {
                    $pivot = RolesPivot::where(['uid'=>$event->uid, 'rid'=>RolesType::worker])->find();
                    if ($pivot) {
                        $pivot->delete($pivot->id);
                    }
                    $staff = FactoryStaff::where(['uid'=>$event->uid])->find();
                    if ($staff) {
                        $staff->save([
                            'status' => 0
                        ]);
                    }

                }
            }
            if ($data['etid'] == EventsType::advance_payments) {
                /// TODO : 预支审核
                if ($data['status'] == 1) {

                    if ($event->status == 0) {
                        // 添加钱包
                        $wallet = WalletVirtual::where(['uid'=>$event->uid])->find();

                        $wallet->save([
                            "balance" => $wallet->balance + $event->cost
                        ]);
                        WalletVirtualLogs::create([
                            "wid" => $wallet->id,
                            "tid" => WalletType::Advance,
                            "uid" => $event->uid,
                            "single_number" => md5(time()),
                            "amount" => $event->cost,
                            "egg_coin" => $wallet->egg_coin,
                            "amount_type" => true,
                            "balance" => $wallet->balance,
                            "status" => 1,
                            "title" => "预支"
                        ]);
                    }
                    $evns = EventsStaff::where(["etid"=>EventsType::punch_the_clock, 'uid'=>$event->uid])->select();
                    foreach ($evns as $evn) {
                        $evn->save([
                            "xstatus"=>1
                        ]);
                    }
                    $event->save([
                        "status" => $data['status']
                    ]);
                    if ($event->status == 1) {
//                        $euser = Users::where(['id'=>$event->uid])->find();
//                        $jpush = new JPushServers();
//                        $jpush->pushOne($euser->phone, "【预支申请】", "你的预支申请已审批");


                        Borrow::create([
                            "uid"=> $event->uid,
                            "money"=> $event->cost
                        ]);
                    }

                }
            }



            $log = EventsStaffLogs::create($data);
            return SBResponse::response($log);
        } else {
            return SBResponse::error("事件不存在");
        }
    }

    /**
     * 通过事件ID 获取事件处理日志
     * 1工厂录入
     * 2初级合伙人申请
     * 3高级合伙人申请
     * 4战略联盟申请
     * 5业务员申请
     * 6职位报名申请
     * 11打卡
     */
    public function logs() {
        $eid = $this->request->param("eid");
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");
        $logs = EventsLogs::where(['eid' => $eid])->page($page)->limit($limit)->order('create_time desc')->all();
        $event = Events::get($eid);
        foreach ($logs as $log) {
            $log->more();
            $log['etid'] = $event->etid;
            $log["etype"] = EventsType::where(["id"=>$event->etid])->find();
        }
        return SBResponse::response($logs);
    }

    /**
     * 通过事件ID 获取事件处理日志
     * 7请假
     * 8报销
     * 9工资条
     * 10离职
     */
    public function staffLogs() {
        $eid = $this->request->param("eid");
        $page = $this->request->param("page");
        $limit = $this->request->param("limit");

        $staffLogs = EventsStaffLogs::where(['eid'=>$eid])->page($page)->limit($limit)->order('create_time desc')->all();
        $event = EventsStaff::get($eid);
        foreach ($staffLogs as $logs) {
            $logs->more();
            $log['etid'] = $event->etid;
            $logs["etype"] = EventsType::where(["id"=>$event->etid])->find();
        }
        return SBResponse::response($staffLogs);
    }

    /**
     * 获取某工厂下的考勤记录
     */
    public function getAttendancelist() {
        $fid = $this->request->param("fid");
        $events = EventsStaff::where(['fid'=>$fid, 'etid'=>EventsType::punch_the_clock])->order('create_time', 'desc')->all();
        foreach ($events as $event) {
            $event->more();
        }
        return SBResponse::response($events);
    }

    /**
     * 审核打卡
     */
    public function setAttendance() {

        $data = $this->request->only(['status', 'remark','eid']);
        if (!$data['remark']) {
            return SBResponse::error("缺少备注");
        }
        $event = EventsStaff::get($data['eid']);
        if ($event) {
            $event->save([
                "status" => $data['status']
            ]);




            $user = Users::fromToken();
            if (!$user) {
                return SBResponse::error("缺少token");
            }
            $data['rid'] = RolesType::resident_teacher;
            $data['uid'] = $user->id;
            $log = EventsStaffLogs::create($data);
            return SBResponse::response($log);
        } else {
            return SBResponse::error("事件不存在");
        }

    }

    /**
     * 删除考勤
     */
    public function delAttendance() {
        $eid = $this->request->param("eid");
        $event = EventsStaff::where(['id'=>$eid])->find();
        $event->delete($eid);
        $logs = EventsStaffLogs::where(['eid'=>$eid])->all();
        foreach ($logs as $log) {
            $log->delete($log['id']);
        }
        return SBResponse::response();
    }

    /**
     * 工厂HR所在的工厂招聘信息
     */
    public function getFactroyHRInfo() {
        $fid = $this->request->param("fid");
        //入职数量
        $injobCount = FactoryStaff::where(['fid'=>$fid, 'status'=>1])->count();
        //离职数量
        $quitCount = FactoryStaff::where(['fid'=>$fid, 'status'=>0])->count();
        //计划招聘数量
        $factory["baseicInfo"] = FactoryBasicInformation::where(['id'=>$fid])->find();
        $factory["information"] = FactoryInformation::where(['fid'=>$fid])->find();
        $factory["injobCount"] = $injobCount;
        $factory["quitCount"] = $quitCount;

        return SBResponse::response($factory);
    }

}
