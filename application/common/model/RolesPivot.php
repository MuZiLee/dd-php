<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2020/4/9
 * Time: 10:55 PM
 */

namespace app\common\model;


use think\model\Pivot;

/**
 * 用户角色表
 * 用户角色将添加在此表中 角色类型参照RolesType表
 * Class RolesPivot
 * @package app\common\model
 */
class RolesPivot extends Pivot
{

    protected $autoWriteTimestamp = true;

    public function more() {
        $this->user;
        $this->role;
        $this->teacher;
    }

    public function user() {
        return $this->hasOne('Users', 'id', 'uid');
    }

    public function teacher() {
        return $this->hasOne('FactoryTeacher', "uid", "uid");
    }

    public function role() {
        return $this->hasOne("RolesType", 'id', 'rid');
    }

}