<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\ResumeBasicInformation;
use app\common\model\ResumeEducationalExperience;
use app\common\model\ResumeWorkExperience;
use app\common\model\Users;
use think\Controller;

class ResumesManager extends Controller
{
    public function get() {
        $phone = $this->request->param("phone");
        $user  = Users::where(["phone"=>$phone])->find();
        if ($user) {
            $resume = ResumeBasicInformation::where(['uid'=>$user->id])->find();
            $resume["work"] = ResumeWorkExperience::where(["uid"=>$user->id])->all();
            $resume['educational'] = ResumeEducationalExperience::where(["uid"=>$user->id])->all();
            return SBResponse::response($resume);
        } else {
            return SBResponse::error("缺少token");
        }
    }

    public function saveBasicInformation() {
        $user = Users::fromToken();
        if ($user) {
            $data = $this->request->only(['origin','marriage','nation','education','speciality','sos_name','sos_phone']);
            $resume = ResumeBasicInformation::where(['uid'=>$user->id])->find();
            if (!$resume) {
                $data['uid'] = $user->id;
                $resume = ResumeBasicInformation::create($data);
            } else {
                $resume->save($data);
            }
            return SBResponse::response($resume);
        } else {
            return SBResponse::error("缺少token");
        }
    }
    public function delBasicInformation() {
        $id = $this->request->param("id");
        $resume = ResumeBasicInformation::where(["id"=>$id])->find();
        if ($resume) {
            if ($resume->delete()) {
                return SBResponse::response();
            } else {
                return  SBResponse::error("删除失败");
            }
        } else {
            return  SBResponse::error("ID不正确");
        }
    }
    public function saveResumeEducationalExperience() {
        $user = Users::fromToken();
        if ($user) {
            $data = $this->request->only(['education','school','major','graduation_time']);
            $data['uid'] = $user->id;
            $resume = ResumeEducationalExperience::create($data);
            return SBResponse::response($resume);
        } else {
            return SBResponse::error("缺少token");
        }
    }
    public function delResumeEducationalExperience() {
        $id = $this->request->param("id");
        $resume = ResumeEducationalExperience::where(["id"=>$id])->find();
        if ($resume) {
            if ($resume->delete()) {
                return SBResponse::response();
            } else {
                return SBResponse::error("删除失败");
            }
        } else {
            return SBResponse::error("ID不正确");
        }
    }
    public function saveResumeWorkExperience() {
        $user = Users::fromToken();
        if ($user) {
            $data = $this->request->only(['company_name','company_address','company_phone','company_job','work_time','dimission_time','work_content']);
            $data['uid'] = $user->id;
            $resume = ResumeWorkExperience::create($data);
            return SBResponse::response($resume);
        } else {
            return SBResponse::error("缺少token");
        }
    }
    public function delResumeWorkExperience() {
        $id = $this->request->param("id");
        $resume = ResumeWorkExperience::where(["id"=>$id])->find();
        if ($resume) {
            if ($resume->delete()) {
                return SBResponse::response();
            } else {
                return SBResponse::error("删除失败");
            }
        } else {
            return SBResponse::error("ID不正确");
        }
    }
}