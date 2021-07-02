<?php

namespace app\index\controller;

use app\_Base\controller\SBResponse;
use app\common\model\FileUpload;
use app\common\model\Images;
use app\common\model\Users;
use think\Controller;
use think\Image;

class Upload extends Controller
{

    /**
     * 单文件上传
     * @return Upload
     */
    public function one()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');
        // 移动到框架应用根目录/uploads/ 目录下

        $info = $file->rule('md5')->move('../public'._FILES_SPACE_NAME_);
        if ($info) {
            // 成功上传后 获取上传信息
//             输出 jpg
//            echo $info->getExtension();
//            echo '<br>';
//             输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
//            echo $info->getSaveName();
//            echo '<br>';
//             输出 42a79759f284b767dfcb2a0197904287.jpg
//            echo $info->getFilename();

            $data["url"] = _FILES_SPACE_NAME_.$info->getSaveName();
            $images = Images::create($data);
            return SBResponse::response($images);
        } else {
            // 上传失败获取错误信息
            echo $file->getError();
            return SBResponse::error($file->getError());
        }
    }

//    /**
//     * 多文件上传
//     * @return \think\response\Json
//     */
//    public function more()
//    {
//        $user = Users::fromToken();
//
//        // 获取表单上传文件
//        $files = request()->file('file');
//
//        foreach ($files as $file) {
//            // 移动到框架应用根目录/uploads/ 目录下
//            $image = Image::open($file);
//
//            $info = $image->move(_BASE_FILE_PATH_._FILES_SPACE_NAME_)->rule('md5');
//            if ($info) {
//                // 成功上传后 获取上传信息
//                $data["filesuffix"] = $info->getExtension();
//                $data["filepath"] = $info->getSaveName();
//                $data["spacename"] = _FILES_SPACE_NAME_;
//                $data["filename"] = $info->getFilename();
//                $data["uid"] = $user->id;
//
//                $obj = Upload::where(['spacename' => $data["spacename"], 'uid'=>$user->id])->find();
//                if ($obj) {
//                    $obj->save($data);
//                    $fs[] = $data;
//                } else {
//                    $fs[] = Upload::create($data);
//                }
//
//            } else {
//                // 上传失败获取错误信息
//                echo $file->getError();
//            }
//        }
//
//        return json([
//            "files" => $fs,
//            "spacename" => $fs[0]['spacename']
//        ]);
//
//    }
//
//
//    public function save() {
//        $user = Users::fromToken();
//
//        $file = $this->request->file("file");
//        if (!$file) {
//            return null;
//        }
//
//        $info = $file->rule('md5')->move(_BASE_FILE_PATH_._FILES_SPACE_NAME_);
//        if ($info) {
//            // 成功上传后 获取上传信息
////             输出 jpg
////            echo $info->getExtension();
////            echo '<br>';
////             输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
////            echo $info->getSaveName();
////            echo '<br>';
////             输出 42a79759f284b767dfcb2a0197904287.jpg
////            echo $info->getFilename();
//
//            $data["suffix"] = $info->getExtension();
//            $data["path"] = $info->getSaveName();
//            $data["spacename"] = _FILES_SPACE_NAME_;
//            $data["name"] = $info->getFilename();
//            $data["url"] = $data["spacename"].$data["path"];
//            $data["uid"] = $user->id;
//
//            $fileupload = FileUpload::create($data);
//
//            return $fileupload;
//        } else {
//            // 上传失败获取错误信息
//            return $file->getError();
//        }
//
//    }


}
