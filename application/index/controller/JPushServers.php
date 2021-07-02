<?php


namespace app\index\controller;


use app\_Base\controller\SBResponse;
use app\common\model\Users;
use JPush\Exceptions\APIConnectionException;
use think\Controller;
use JPush\Client as JPush;




/**
 * 极光推送
 * Class JPushServers
 * @package app\_Base\controller
 */
class JPushServers extends Controller
{

    public function push() {
        // $phone = $this->request->param("phone");
        // $title = $this->request->param("title");
        // $message = $this->request->param("message");
        // if (!$phone) {
        //     return SBResponse::error("缺少phone");
        // }
        // // $auser = Users::where(['phone'=>$phone])->find();
        // // $client = new Jpush("f78b35c18acfa39733e6492d", "41a1cd26fea0837294224773", "..\\../runtime/push_logo_"+time());

        // // if (!$auser->registrationID) {
        //     return SBResponse::error();
        // }


        // // 完整的推送示例
        // try {
        //     $response = $client->push()
        //         ->setPlatform(array('ios', 'android'))
        //         ->addRegistrationId($auser->registrationID)
        //         ->setNotificationAlert($title)
        //         ->iosNotification($message, array(
        //             'sound' => 'sound.caf',
        //             'category' => 'jiguang',
        //         ))
        //         ->androidNotification($message, array(
        //             'title' => $title,
        //         ))
        //         ->message($message, array(
        //             'title' => $title,
        //         ))
        //         ->options(array(
        //             'apns_production' => false,
        //             'big_push_duration' => 0
        //         ))
        //         ->setSmsMessage(array(
        //             'delay_time' => 120,
        //             'signid' => 154,
        //             'temp_id' => 1,
        //             'temp_para' => array(
        //                 'code' => 357
        //             ),
        //             'active_filter' => false
        //         ))
        //         ->send();
        //     return SBResponse::response($response);
        // } catch (APIConnectionException $e) {
        //     print SBResponse::error($e);
        // } catch (APIConnectionException $e) {
        //     print SBResponse::error($e);
        // }
    }


    public function pushOne($phone, $title = "", $message = "") {

        // if (!$phone) {
        //     return "缺少phone";
        // }
        // $auser = Users::where(['phone'=>$phone])->find();
        // $client = new Jpush("f78b35c18acfa39733e6492d", "41a1cd26fea0837294224773", "../runtime/log_path");

        // if (!$auser->registrationID) {
        //     return "该用户已经很长时间没有登录了";
        // }


        // // 完整的推送示例
        // try {
        //     $response = $client->push()
        //         ->setPlatform(array('ios', 'android'))
        //         ->addRegistrationId($auser->registrationID)
        //         ->setNotificationAlert($title)
        //         ->iosNotification($message, array(
        //             'sound' => 'sound.caf',
        //             'category' => 'jiguang',
        //         ))
        //         ->androidNotification($message, array(
        //             'title' => $title,
        //         ))
        //         ->message($message, array(
        //             'title' => $title,
        //         ))
        //         ->options(array(
        //             'apns_production' => false,
        //             'big_push_duration' => 0
        //         ))
        //         ->setSmsMessage(array(
        //             'delay_time' => 120,
        //             'signid' => 154,
        //             'temp_id' => 1,
        //             'temp_para' => array(
        //                 'code' => 357
        //             ),
        //             'active_filter' => false
        //         ))
        //         ->send();
        //     return $response;
        // } catch (APIConnectionException $e) {
        //     print $e;
        // } catch (APIConnectionException $e) {
        //     print $e;
        // }
    }


    public function pushAll() {

        // //registrationID => "120c83f760ae3bb5926"
        // $client = new Jpush("f78b35c18acfa39733e6492d", "41a1cd26fea0837294224773");
        // $client->push()
        //     ->setPlatform('all')
        //     ->addAllAudience()
        //     ->setNotificationAlert('Hello, JPush')
        //     ->send();
        // return SBResponse::response($client);
    }
}