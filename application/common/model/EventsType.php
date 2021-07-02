<?php


namespace app\common\model;


use think\Model;

/**
 * 事件类型表
 * Class EventsType
 * @package app\common\model
 */
class EventsType extends Model
{
    /**工厂录入**/
    const factory_entry = 1;
    /**初级合伙人申请**/
    const junior_partner_application = 2;
    /**高级合伙人申请**/
    const senior_partner_application = 3;
    /**战略联盟申请**/
    const strategic_alliance_application = 4;
    /**业务员申请**/
    const salesman_application = 5;
    /**职位报名申请**/
    const position_application = 6;
    /**请假申请**/
    const leave_application = 7;
    /**报销申请**/
    const claim_for_reimbursement = 8;
    /**工资条确认申请(发工资)**/
    const payslip_confirmation_application = 9;
    /**离职申请**/
    const quit_application = 10;
    /** 打卡 **/
    const punch_the_clock = 11;
    /** 预支申请 **/
    const advance_payments = 12;

}