<?php

use \think\facade\Route;

Route::group(["name" => "api"], function () {

    /**
     * 后台专用
     */
    Route::group('/admin', function () {
        Route::any('/menu', 'index/Index/menu');
        Route::any('/welcome', 'index/Index/welcome');
    });

    /**
     * 版本控制
     */
    Route::group('/versions', function () {
        Route::any('/update', 'index/VersionsManager/update');
        Route::any('/getServerUrl', 'index/VersionsManager/getServerUrl');
    });

    /**
     * 用户
     */
    Route::group('/account', function () {
        Route::any('/createAccount', 'index/Account/createAccount');
        Route::any('/get', 'index/Account/get');
        Route::any('/addFriend', 'index/Account/addFriend');
        Route::any('/acceptInvitation', 'index/Account/acceptInvitation');
        Route::any('/declineInvitation', 'index/Account/declineInvitation');
        Route::any('/getFriends', 'index/Account/getFriends');
        Route::any('/getInfo', 'index/Account/getInfo');
        Route::any('/getInfoByCode', 'index/Account/getInfoByCode');
        Route::any('/getInfoByPhone', 'index/Account/getInfoByPhone');
        Route::any('/login', 'index/Account/login');
        Route::any('/admin', 'index/Account/admin');
        Route::any('/getInfoByToken', 'index/Account/getInfoByToken');
        Route::any('/bindInvitationCode', 'index/Account/bindInvitationCode');
        Route::any('/getWhitelist', 'index/Account/getWhitelist');
        Route::any('/getRoles', 'index/Account/getRoles');
        Route::any('/makeWhitelist', 'index/Account/makeWhitelist');
        Route::any('/getBlacklist', 'index/Account/getBlacklist');
        Route::any('/makeBlacklist', 'index/Account/makeBlacklist');
        Route::any('/makeAdmin', 'index/Account/makeAdmin');
        Route::any('/unmakeAdmin', 'index/Account/unmakeAdmin');
        Route::any('/setUserName', 'index/Account/setUserName');
        Route::any('/setUserSex', 'index/Account/setUserSex');
        Route::any('/setBirthday', 'index/Account/setBirthday');
        Route::any('/setAvatar', 'index/Account/setAvatar');
        Route::any('/getRoleslist', 'index/Account/getRoleslist');
        Route::any('/setAdmin', 'index/Account/setAdmin');
        Route::any('/setPassword', 'index/Account/setPassword');
        Route::any('/searchKeyword', 'index/Account/searchKeyword'); // 搜索用户 page limi
        Route::any('/searchuser', 'index/Account/searchuser'); // 搜索用户
        Route::any("/registrationID","index/Account/registrationID");
        Route::any("/useradmin","index/Account/useradmin");
        Route::any("/getResidentManager","index/Account/getResidentManager");
        Route::any("/getUnresidentManager","index/Account/getUnresidentManager");
        /// TODO: 添加驻场经理
        Route::any("/addResidentManager","index/Account/addResidentManager");
        /// TODO: 删除驻场经理
        Route::any("/delResidentManager","index/Account/delResidentManager");
        /// TODO: 不是后台管理员用户
        Route::any("/getUnadminlist","index/Account/getUnadminlist");
        /// TODO: 设置后台角色
        Route::any("/setAdminroles","index/Account/setAdminroles");
        // 查询上级公司信息
        Route::any("/getStrategicInfo","index/Account/getStrategicInfo");
        // 获取上级信息
        Route::any("/getPrimaryId","index/Account/getPrimaryId");



    });

    /**
     * 广告
     */
    Route::group('/ad', function () {
        //添加广告
        Route::any('/add', 'index/AdsManager/add');
        Route::any('/del', 'index/AdsManager/del');
        Route::any('/update', 'index/AdsManager/update');
        Route::any('/getAdList', 'index/AdsManager/getAdList');
    });

    /**
     * 简历
     */
    Route::group('/resumes', function () {
        Route::any('/get', 'index/ResumesManager/get');
        Route::any('/saveBasicInformation', 'index/ResumesManager/saveBasicInformation');
        Route::any('/delBasicInformation', 'index/ResumesManager/delBasicInformation');
        Route::any('/saveResumeEducationalExperience', 'index/ResumesManager/saveResumeEducationalExperience');
        Route::any('/delResumeEducationalExperience', 'index/ResumesManager/delResumeEducationalExperience');
        Route::any('/saveResumeWorkExperience', 'index/ResumesManager/saveResumeWorkExperience');
        Route::any('/delResumeWorkExperience', 'index/ResumesManager/delResumeWorkExperience');
    });

    /**
     * 验证码
     */
    Route::group('/captcha', function () {
        Route::any('/getCaptcha', 'index/captcha/getCaptcha');
    });
    /**
     * 统计
     */
    Route::group('/welcome', function () {
        Route::any('/get', 'index/Welcome/get');
    });

    /**
     * 上传
     */
    Route::group('/upload', function () {
        Route::any('/one', 'index/Upload/one');
    });

    /**
     * 工厂
     */
    Route::group('/factory', function () {
        // 录入工厂信息
        Route::any('/input', 'index/FactorysManager/input');
        // 获取签单信息
        Route::any('/getSigningInfo', 'index/FactorysManager/getSigningInfo');

        // 获取录入工厂事件
        Route::any('/getInputEvent', 'index/FactorysManager/getInputEvent');

        //删除工厂
        Route::any('/dele', 'index/FactorysManager/dele');

        //审核工厂
        Route::any('/dispose', 'index/FactorysManager/dispose');

        //工厂列表
        Route::any('/getlist', 'index/FactorysManager/getlist');
        //工厂信息
        Route::any('/getInfo', 'index/FactorysManager/getInfo');
        // 获取工厂图片
        Route::any('/getImages', 'index/FactorysManager/getImages');
        // 获取某工厂的驻场老师
        Route::any('/getTeacherByFid', 'index/FactorysManager/getTeacherByFid');


        //驻场老师列表
        Route::any('/getTeacherList', 'index/FactorysManager/getTeacherList');
        //可用的分配信息 未分配的用户 已分配的用户
        Route::any('/getAvailableTeacher', 'index/FactorysManager/getAvailableTeacher');
        //添加驻场老师
        Route::any('/allotTeacher', 'index/FactorysManager/allotTeacher');
        //删除
        Route::any('/delTacher', 'index/FactorysManager/delTacher');

        //工厂HR列表
        Route::any('/getFactoryHRList', 'index/FactorysManager/getFactoryHRList');
        //可用的工厂HR分配信息 未分配的用户 已分配的用户
        Route::any('/getAvailableFactoryHR', 'index/FactorysManager/getAvailableFactoryHR');
        //添加工厂HR
        Route::any('/allotFactoryHR', 'index/FactorysManager/allotFactoryHR');
        //删除
        Route::any('/delFactoryHR', 'index/FactorysManager/delFactoryHR');

        //获取渲染数据
        Route::any('/getCondition', 'index/FactorysManager/getCondition');

        // 添加税金
        Route::any('/addTax', 'index/FactorysManager/addTax');
        // 添加保险
        Route::any('/addTnsurance', 'index/FactorysManager/addTnsurance');
        // 修改签单信息
        Route::any('/setSigningInfo', 'index/FactorysManager/setSigningInfo');

        //职位类型
        Route::any('/getJobTypes', 'index/FactorysManager/getJobTypes');

        // 添加工厂职位
        Route::any('/addJob', 'index/FactorysManager/addJob');
        // 审核通过的工厂列表
        Route::any('/getAvailableTactorylist', 'index/FactorysManager/getAvailableTactorylist');
        // 工厂职位列表
        Route::any('/jobList', 'index/FactorysManager/jobList');
        // 审核通过的职位列表
        Route::any('/usableJobList', 'index/FactorysManager/usableJobList');
        // 设置是否热招
        Route::any('/isHotJob', 'index/FactorysManager/isHotJob');
        // 删除职位
        Route::any('/delJob', 'index/FactorysManager/delJob');
        // 发布职位
        Route::any('/pushJob', 'index/FactorysManager/pushJob');
        // 下架职位
        Route::any('/soldOutJob', 'index/FactorysManager/soldOutJob');
        // 查看单个职位信息
        Route::any('/jobInfo', 'index/FactorysManager/jobInfo');
        // 更新职位
        Route::any('/updateJob', 'index/FactorysManager/updateJob');
        // 工厂职位详情
        Route::any('/detailJob', 'index/FactorysManager/detailJob');
        // 添加 职位报名申请
        Route::any('/apply', 'index/FactorysManager/apply');
        // 获取 职位报名申请 列表
        Route::any('/getApplylist', 'index/FactorysManager/getApplylist');
        // 获取职位是否已经报过名
        Route::any('/isApply', 'index/FactorysManager/isApply');
        // 关键字搜索职位
        Route::any('/jobSearch', 'index/FactorysManager/jobSearch');
        // 获取工厂HR所在工厂的招聘信息
        Route::any('/getFactroyHRInfo', 'index/FactorysManager/getFactroyHRInfo');

        /**
         * TODO : 人事部审核--请假事件审核
         * TODO : 人事部审核--报销事件审核
         * TODO : 人事部审核--离职事件审核
         * EventsStaff
         * EventsStaffLogs
         */
        Route::any('/personnelAudit', 'index/FactorysManager/personnelAudit');
        /**
         * TODO : 人事部 -- 请假事件列表
         */
        Route::any('/getLeavelist', 'index/FactorysManager/getLeavelist');
        /**
         * TODO: 人事部入职审核
         */
        Route::any('/auditPATeacher', 'index/FactorysManager/auditPATeacher');

        /**
         * TODO : 人事部 财务部 -- 报销事件列表
         */
        Route::any('/getReimbursementlist', 'index/FactorysManager/getReimbursementlist');
        /**
         * TODO : 人事部 财务部 -- 离职事件列表
         */
        Route::any('/getQuitlist', 'index/FactorysManager/getQuitlist');
        /**
         * TODO : 财务部审核
         */
        Route::any('/businessAudit', 'index/FactorysManager/businessAudit');


        /**
         * TODO : 驻场老师 -- 报名事件列表
         */
        Route::any('/auditPATeacher', 'index/FactorysManager/auditPATeacher');
        /**
         * TODO : 驻场老师的审核事件--入职确认
         */
        Route::any('/inJobReview', 'index/FactorysManager/inJobReview');
        /**
         * TODO : 驻场老师 获取--请假事件列表
         * TODO : 驻场老师 获取--报销事件列表
         * TODO : 驻场老师 获取--离职事件列表
         */
        Route::any('/getStafflist', 'index/FactorysManager/getStafflist');
        /**
         * TODO : 驻场老师审核--请假事件审核
         * TODO : 驻场老师审核--报销事件审核
         * TODO : 驻场老师审核--离职事件审核
         */
        Route::any('/staffAudit', 'index/FactorysManager/staffAudit');

        /**
         * 获取某工厂下所有员工
         */
        Route::any('/getStaffInfolist', 'index/FactorysManager/getStaffInfolist');


        /**
         * TODO : 获取审核日志
         * 通过事件ID 获取事件处理日志
         * 1工厂录入
         * 2初级合伙人申请
         * 3高级合伙人申请
         * 4战略联盟申请
         * 5业务员申请
         * 6职位报名申请
         * 11打卡
         */
        Route::any('/logs', 'index/FactorysManager/logs');
        /**
         * TODO : 获取审核日志
         * 通过事件ID 获取事件处理日志
         * 7请假
         * 8报销
         * 9工资条
         * 10离职
         */
        Route::any('/staffLogs', 'index/FactorysManager/staffLogs');

        /**
         * TODO : 人事部 & 财务部 获取 所有预支事件列表
         */
        Route::any('/getAdvancelist', 'index/FactorysManager/getAdvancelist');

        /**
         * 获取某工厂下的考勤
         */
        Route::any('/getAttendancelist', 'index/FactorysManager/getAttendancelist');
        /**
         * 考勤审核
         */
        Route::any('/setAttendance', 'index/FactorysManager/setAttendance');
        /**
         * 删除考勤
         */
        Route::any('/delAttendance', 'index/FactorysManager/delAttendance');



    });

    /**
     * 银行管理
     */
    Route::group('/bank', function () {
        Route::any('/get', 'index/BankManager/get');
        Route::any('/isWorkers', 'index/BankManager/isWorkers');
    });

    /**
     * 系统一些设置
     */
    Route::group('/system', function () {
        Route::any('/get', 'index/SystemSetManager/get');
        Route::any('/updatejobsearch', 'index/SystemSetManager/updatejobsearch');
        Route::any('/updatesignin', 'index/SystemSetManager/updatesignin');
        Route::any('/updateshare', 'index/SystemSetManager/updateshare');
    });


    /**
     * 钱包
     */
    Route::group("/wallet", function () {
        // 手续费
        Route::any("/getServiceCharge", "index/WalletManager/getServiceCharge");
        // 一般手续费
        Route::any("/generalHandlingCharges", "index/WalletManager/generalHandlingCharges");
        // 提成手续费
        Route::any("/updateCommissionFee", "index/WalletManager/updateCommissionFee");
        // 获取我的钱包
        Route::any("/getMyWallet", "index/WalletManager/getMyWallet");
        // TODO : 可预支金额
        Route::any("/availableAmount", "index/WalletManager/availableAmount");
        // TODO : 预支申请
        Route::any("/applyForAdvance", "index/WalletManager/applyForAdvance");
        // TODO : 查询是否申请过
        Route::any("/isAdvance", "index/WalletManager/isAdvance");
        // TODO : 账单明细
        Route::any("/billingDetailslist", "index/WalletManager/billingDetailslist");
        // TODO : 支持提现的银行卡
        Route::any("/getBanklist", "index/WalletManager/getBanklist");
        // TODO : 我的银行卡
        Route::any("/getMyCardList", "index/WalletManager/getMyCardList");
        // TODO : 添加银行卡
        Route::any("/addCard", "index/WalletManager/addCard");
        // TODO : 可提现工资
        Route::any("/withdrawableSalary", "index/WalletManager/withdrawableSalary");
        // TODO : 转出工资到钱包
        Route::any("/rolloutWageToWallet", "index/WalletManager/rolloutWageToWallet");

    });


    /**
     * 意见反馈
     */
    Route::group('/feedbackes', function () {
        Route::any('/getList', 'index/FeedbackesManager/getList');
        Route::any('/create', 'index/FeedbackesManager/create');
    });


    /**
     * 事件处理
     */
    Route::group('/events', function () {
        // 事件记录
        Route::any('/getEventList', 'index/EventsManager/getEventList');
        // 事件历史操作记录
        Route::any('/getEventLogsList', 'index/EventsManager/getEventLogsList');
        // 添加角色申请事件
        Route::any('/addRolesApple', 'index/EventsManager/addRolesApple');
        //后台创建战略联盟合伙人
        Route::any('/adminCreateStrategic', 'index/EventsManager/adminCreateStrategic');
        // 添加战略联盟合伙人申请
        Route::any('/addRolesSAApple', 'index/EventsManager/addRolesSAApple');
        // 事件审核
        Route::any('/eventAudit', 'index/EventsManager/eventAudit');
        // 获取业务员申请事件
        Route::any('/getSalesmanApplylist', 'index/EventsManager/getSalesmanApplylist');
        // 获取我的申请事件
        Route::any('/eventsListByMe', 'index/EventsManager/eventsListByMe');
        // 获取初级合伙人申请事件
        Route::any('/getJuniorPartnerApplylist', 'index/EventsManager/getJuniorPartnerApplylist');
        // 获取高级合伙人申请事件
        Route::any('/getSeniorPartnerApplylist', 'index/EventsManager/getSeniorPartnerApplylist');
        // 获取战略合伙人申请事件
        Route::any('/getStrategicAllianceApplylist', 'index/EventsManager/getStrategicAllianceApplylist');
        // 更新战略合伙人公司信息
        Route::any('/updateCompanyInfo', 'index/EventsManager/updateCompanyInfo');
        // 删除事件
        Route::any('/dele', 'index/EventsManager/dele');
        // 获取战略联盟合伙人申请事件
        Route::any('/getStrategiclist', 'index/EventsManager/getStrategiclist');
        // 创建邀请码
        Route::any('/createCode', 'index/EventsManager/createCode');
        // 获取职位申请事件记录
        Route::any('/getJobEvents', 'index/EventsManager/getJobEvents');
//        Route::any('/getSignUp', 'index/EventManager/getSignUp');
//        Route::any('/punchCard', 'index/EventManager/punchCard');
//        Route::any('/writeOff', 'index/EventManager/writeOff');
//        Route::any('/askForLeave', 'index/EventManager/askForLeave');
//        Route::any('/resign', 'index/EventManager/resign');
//        Route::any('/cashIn', 'index/EventManager/cashIn');
//        Route::any('/advance', 'index/EventManager/advance');
//        Route::any('/factory', 'index/EventManager/factory');
//
//        //已处理事件
//        Route::any('/getEventRolesProcessed', 'index/EventManager/getEventRolesProcessed');
//        Route::any('/getSignUpProcessed', 'index/EventManager/getSignUpProcessed');
//        Route::any('/punchCardProcessed', 'index/EventManager/punchCardProcessed');
//        Route::any('/writeOffProcessed', 'index/EventManager/writeOffProcessed');
//        Route::any('/askForLeaveProcessed', 'index/EventManager/askForLeaveProcessed');
//        Route::any('/resignProcessed', 'index/EventManager/resignProcessed');
//        Route::any('/cashInProcessed', 'index/EventManager/cashInProcessed');
//        Route::any('/advanceProcessed', 'index/EventManager/advanceProcessed');
//
//        //已驳回事件
//        Route::any('/getEventRolesClosed', 'index/EventManager/getEventRolesClosed');
//        Route::any('/getSignUpClosed', 'index/EventManager/getSignUpClosed');
//        Route::any('/punchCardClosed', 'index/EventManager/punchCardClosed');
//        Route::any('/writeOffClosed', 'index/EventManager/writeOffClosed');
//        Route::any('/askForLeaveClosed', 'index/EventManager/askForLeaveClosed');
//        Route::any('/resignClosed', 'index/EventManager/resignClosed');
//        Route::any('/cashInClosed', 'index/EventManager/cashInClosed');
//        Route::any('/advanceClosed', 'index/EventManager/advanceClosed');
//
//
//        //添加
//        Route::any('/addApplyEvent', 'index/EventManager/addApplyEvent');
//
//        //处理
//        Route::any('/dispose', 'index/EventManager/dispose');
//        //
//        Route::any('/getMyEvents', 'index/EventManager/getMyEvents');
//
//        ///报名事件(初级合伙人使用)

//
//        /// 获取驻场老师的报名审核
//        Route::any('/getTeacher400Event', 'index/EventManager/getTeacher400Event');
//        /// 驻场老师审核
//        Route::any('/teacherDispose', 'index/EventManager/teacherDispose');
    });

    /**
     * 文章管理
     **/
    Route::group('/articles', function () {
        Route::any('/getList', 'index/ArticleManager/getList');
        //获取涨知识列表 or 获取公告列表
        Route::any('/getArticlelist', 'index/ArticleManager/getArticlelist');
        // 添加
        Route::any('/add', 'index/ArticleManager/add');
        // 删除
        Route::any('/del', 'index/ArticleManager/del');
        // 更新
        Route::any('/save', 'index/ArticleManager/save');
        // 详情
        Route::any('/details', 'index/ArticleManager/details');


        // 购买
        Route::any('/buy', 'index/ArticleManager/buy');

//        Route::any('/add', 'index/ArticleManager/add');
//        Route::any('/update', 'index/ArticleManager/update');

//        Route::any('/save', 'index/ArticleManager/save');
//        Route::any('/delete', 'index/ArticleManager/delete');
//        Route::any('/edit', 'index/ArticleManager/edit');
//
//        Route::any('/getFlowedList', 'index/ArticleManager/getFlowedList');
//        Route::any('/getAnnouncementList', 'index/ArticleManager/getAnnouncementList');


    });



    /**
     * 签到
     */
    Route::group("/signin", function () {
        Route::any("/add", "index/SignInManager/add");
        Route::any("/getList", "index/SignInManager/getList");
    });

    /**
     * 收藏
     */
    Route::group('/favorites', function () {
        // 添加收藏
        Route::any('/add', 'index/FavoritesManager/add');
        // 查询是否收藏过
        Route::any('/isFavorites', 'index/FavoritesManager/isFavorites');
        // 删除收藏
        Route::any('/del', 'index/FavoritesManager/del');
        // 获取我的收藏
        Route::any('/getList', 'index/FavoritesManager/getList');
    });

    /**
     * 合伙人
     */
    Route::group('/partner', function () {

        // 初级合伙人审核事件
        Route::any('/auditAuniorPartner', 'index/PartnerManager/auditAuniorPartner');
        /// 初级报名审核
        Route::any('/registrationReview', 'index/PartnerManager/registrationReview');

        Route::any('/getList', 'index/PartnerManager/getList');
        // 获取我的初级合伙人
        Route::any('/getMyJuniorPartnerlist', 'index/PartnerManager/getMyJuniorPartnerlist');
        // 获取我的高级合伙人
        Route::any('/getMySeniorPartner', 'index/PartnerManager/getMySeniorPartner');
        // 获取我的准高级合伙人
        Route::any('/getMyASPartnerlist', 'index/PartnerManager/getMyASPartnerlist');
        // 我的工人
        Route::any('/getMyStafflist', 'index/PartnerManager/getMyStafflist');
        // 删除事件
        Route::any('/delete', 'index/PartnerManager/delete');
//        Route::any('/saveRate', 'index/PartnerManager/saveRate');
//        Route::any('/getRate', 'index/PartnerManager/getRate');
//        Route::any('/saveEnterprise', 'index/PartnerManager/saveEnterprise');
//        //我的初级
//        Route::any('/getPGUserList', 'index/PartnerManager/getPGUserList');
//        //我的高级
//        Route::any('/getAGUserList', 'index/PartnerManager/getAGUserList');
//        //我的准高级
//        Route::any('/getTAGUserList', 'index/PartnerManager/getTAGUserList');
        /**
         * TODO : 我的准工人
         */
        Route::any("/getMyPWorkerlist", "index/PartnerManager/getMyPWorkerlist");

        /**
         * TODO : 设置战略联盟信息
         * 初级分红 高级分红 战略分红 蛋蛋分红
         */
        Route::any("/setStrategicInfo", "index/PartnerManager/setStrategicInfo");
        /**
         * 战略联盟合伙人列表
         */
        Route::any("/getStrategiclist", "index/PartnerManager/getStrategiclist");

        /**
         * 获取战略信息
         */
        Route::any("/getStrategicInfor", "index/PartnerManager/getStrategicInfor");


    });

    /**
     * 员工服务
     */
    Route::group('/staff', function () {
        // TODO: 请假 报销 离职
        Route::any('/addFlow', 'index/StaffManager/addFlow');
        // TODO: 获取打卡事件 来预算工资
        Route::any('/getPunchTheClocklist', 'index/StaffManager/getPunchTheClocklist');
        // TODO: 工作流 历史记录
        Route::any('/workflowHistory', 'index/StaffManager/workflowHistory');
        // TODO: 获取当月的打卡事件 （预支工资）
        Route::any('/getSameMonthClocklist', 'index/StaffManager/getSameMonthClocklist');
        // TODO : 预支申请
        Route::any('/advancePayments', 'index/StaffManager/advancePayments');
        // TODO : 获取当月的预支
        Route::any('/getSameMontcAdvancePayments', 'index/StaffManager/getSameMontcAdvancePayments');
    });

    /**
     * 收货地址管理
     */
    Route::group('/addres', function () {
            Route::any('/getAddreslist', 'index/AddresManager/getAddreslist');
            Route::any('/delete', 'index/AddresManager/delete');
            Route::any('/addAddres', 'index/AddresManager/addAddres');
            Route::any('/setAddresDefault', 'index/AddresManager/setAddresDefault');

    });

    // 手续费
    Route::group('/rate', function () {
        Route::any('/getRate', 'index/RateManager/getRate');
        Route::any('/updateRate', 'index/RateManager/updateRate');
    });


    //商城管理
    Route::group('/shop', function () {
        Route::any('/categorylist', 'index/ShopManager/categorylist');
        Route::any('/saveCategory', 'index/ShopManager/saveCategory');
        Route::any('/delProductsType', 'index/ShopManager/delProductsType');
        Route::any('/productslist', 'index/ShopManager/productslist');


        Route::any('/navitems', 'index/ShopManager/navitems');
        // 添加商品
        Route::any('/arrProducts', 'index/ShopManager/arrProducts');
        // 发布商品（上架）
        Route::any('/push', 'index/ShopManager/push');
        // 我的商品列表
        Route::any('/myProducts', 'index/ShopManager/myProducts');
        // 设置商品位置
        Route::any('/setProductsPosition', 'index/ShopManager/setProductsPosition');
        // banner
        Route::any('/bannerlist', 'index/ShopManager/bannerlist');
        // 新品推荐
        Route::any('/newArrivals', 'index/ShopManager/newArrivals');
        // 通过类型ID获取商品列表
        Route::any('/goodsByType', 'index/ShopManager/goodsByType');
        Route::any('/searchGoods', 'index/ShopManager/searchGoods');
        // 添加购物车
        Route::any('/addCard', 'index/ShopManager/addCard');
        // 查看我的购物车
        Route::any('/getCardlist', 'index/ShopManager/getCardlist');
        // 删除购物车
        Route::any('/deleteCard', 'index/ShopManager/deleteCard');
        // 添加订单
        Route::any('/addOrder', 'index/ShopManager/addOrder');
        // 我的订单
        Route::any('/myOrder', 'index/ShopManager/myOrder');
        // 签收
        Route::any('/signFor', 'index/ShopManager/signFor');
        // 销售记录
        Route::any('/salesRecord', 'index/ShopManager/salesRecord');
        // 发货
        Route::any('/deliverGoods', 'index/ShopManager/deliverGoods');
        // 查看所有订单列表（后台用）
        Route::any('/orderlist', 'index/ShopManager/orderlist');

    });


    /// TODO : 创建工资条
    Route::group('/paySlip', function () {
        Route::any('/addPaySlip', 'index/PaySlipManager/addPaySlip');
        /// TODO : 我的工资条
        Route::any('/myPaySliplist', 'index/PaySlipManager/myPaySliplist');
        /// TODO : 确认工资条
        Route::any('/confirmPaySlip', 'index/PaySlipManager/confirmPaySlip');
        /// TODO : 获取所有工资条事件
        Route::any('/getPaySliplist', 'index/PaySlipManager/getPaySliplist');
        /// TODO : 删除工资条
        Route::any('/deleteSlip', 'index/PaySlipManager/deleteSlip');
        /// TODO : 发工资 （后台用）
        Route::any('/payWage', 'index/PaySlipManager/payWage');
        Route::any('/getMoney', 'index/PaySlipManager/getMoney');
        /// TODO : 企业佣金
        Route::any('/getEnterpriseCommission', 'index/PaySlipManager/getEnterpriseCommission');
        /// TODO: 查询某员工工时
        Route::any('/findHour', 'index/WageManager/findHour');
    });

    /**
     * 佣金
     * 获取佣金
     * 驻场老师
     * 业务员
     * 初级合伙人
     * 高级合伙人
     * 战略
     * 蛋蛋 id = 0
     */
    Route::group('/dividend', function () {
        Route::any('/getEnterpriseCommission', 'index/DividendManager/getEnterpriseCommission');
        // 可提现的提成 或 分红
        Route::any('/getCashableCommission', 'index/DividendManager/getCashableCommission');
        // 转出到钱包
        Route::any('/withdrawToLooseChange', 'index/DividendManager/withdrawToLooseChange');
        // 获取预算佣金
        Route::any('/getBudgetEnterpriseCommission', 'index/DividendManager/getBudgetEnterpriseCommission');
    });

    /**
     * 分红
     */
    Route::group("/abonus", function () {
        Route::any("/get", "index/AbonusManager/get");
        Route::any("/setAbonus", "index/AbonusManager/setAbonus");

    });

    Route::group('/pay', function () {
        Route::any('/singleCash', 'index/DDPayController/singleCash');
    });
    Route::group('/jpush', function () {
        Route::any('/push', 'index/JPushServers/push');
        Route::any('/pushAll', 'index/JPushServers/pushAll');
    });


    Route::group('/test', function () {
        Route::any('/index', 'index/Test/index');
        Route::any('/userRolesById', 'index/Test/userRolesById');
    });

});