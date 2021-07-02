<?php


namespace app\common\model;


use think\Model;

/**
 * 工厂基本信息(位置信息等)
 * Class FactoryBasicInformation
 * @package app\common\model
 */
class FactoryBasicInformation extends Model
{
    public $autoWriteTimestamp = true;

    /**
     * 更多 more
     */
    public function more() {
        $this->employedUsers;
        $this->environmental;
        $this->information;
        $this->personnel;
        $this->signingInformation;
        $this->teacher;
        $this->images;
        $this->hrs;
        $this->jobs;
        $this->keyboarder;
    }

    /**
     * 多对多查询 获取工厂下所有的驻厂老师
     */
    public function teacher() {
        return $this->belongsToMany('Users', 'FactoryTeacher', 'uid', 'fid');
    }

    /**
     * 多对多查询 获取工厂下所有的工厂HR
     */
    public function hrs() {
        return $this->belongsToMany('Users', 'FactoryHr', 'uid', 'fid');
    }

    /**
     * 多对多查询 已入职职离职用户(员工) employed users
     */
    public function employedUsers()
    {
        return $this->belongsToMany('Users', 'FactoryEmployedUsers', 'uid', 'fid');
    }

    /**
     * 一对一查询 环境与待遇
     */
    public function environmental()
    {
        return $this->hasOne("FactoryEnvironmentAndTreatment", 'fid', 'id');
    }

    /**
     * 一对一查询 厂房信息
     */
    public function information()
    {
        return $this->hasOne("FactoryInformation", 'fid', 'id');
    }

    /**
     * 一对多关联 工厂环境图片
     */
    public function images() {
        return $this->hasMany("FactoryImages", "fid", 'id');
    }

    /**
     * 一对一查询 签单信息
     */
    public function signingInformation()
    {
        return $this->hasOne("FactorySigningInformation", 'fid', 'id');
    }

    /**
     * 一对一查询 工厂相关人员
     */
    public function personnel()
    {
        return $this->hasOne("FactoryPlantRelatedPersonnel", 'fid', 'id');
    }

    /**
     * 一对多关联 工厂职位
     * 一对多查询记得是使用 with() 进行查询
     *
     * 这里有可能需要区分是否已经发布
     */
    public function jobs()
    {
        return $this->hasMany('FactoryJobs', 'fid', 'id');
    }

    /**
     * 录入员
     */
    public function keyboarder() {
        return $this->hasOne("Users", "id", "uid");
    }

    /**
     * 当前工厂下的员工
     */
    public function staff() {

        return $this->hasMany("FactoryStaff", "fid", "id")->with(['user']);
    }
}