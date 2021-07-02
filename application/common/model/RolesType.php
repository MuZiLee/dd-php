<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/9
 * Time: 10:53 PM
 */

namespace app\common\model;


use think\Model;

class RolesType extends Model
{

    protected $autoWriteTimestamp = true;


    protected $type = [
        "create_time" => 'datetime'
    ];

    protected $hidden = [
        'pivot'
    ];


    /**普通的用户**/
    const ordinary_users = 1;
    /**准工人**/
    const member = 2;
    /**工人**/
    const worker = 3;
    /**初级合伙人**/
    const junior_partner = 4;
    /**高级合伙人**/
    const senior_partner = 5;
    /**准高级合伙人**/
    const associate_senior_partner = 6;
    /**战略联盟**/
    const strategic_alliance = 7;

    /**驻厂老师*/
    const resident_teacher = 8;
    /**驻场经理**/
    const resident_manager = 9;
    /**工厂HR**/
    const factory_hr = 10;
    /**业务员**/
    const salesman = 11;
    /**人事部**/
    const ministry_of_personnel = 12;
    /**财务部**/
    const finance_department = 13;
    /**总经理**/
    const ceo = 14;
    /**蛋蛋**/
    const dandankj = 15;
    /** 后台管理员 */
    const admin = 100;

}