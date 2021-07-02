<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

use \Firebase\JWT\JWT;

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");


/**
 * 文件上传空间名（任何文件）
 */
define('_FILES_SPACE_NAME_', '/uploads/images/');

/**
 * 图片上传空间名（只存图片）
 */
define('_IMAGES_SPACE_NAME_', '/images/');


/**
 * 可访问文件根目录
 */
define('_BASE_FILE_PATH_', '../public/');

/**
 * root public 路径
 * 如："/Users/XXXX/developer/php/dandankj/tp/public"
 */
define("ROOT_PUBLIC_PATH", dirname(__DIR__) . DIRECTORY_SEPARATOR . 'public');

/**
 * route route 路径
 * 如："/Users/XXXX/developer/php/dandankj/tp/route"
 */
define("ROOT_ROUTE_PATH", dirname(__DIR__) . DIRECTORY_SEPARATOR . 'route');


function setAvatar($url)
{
    return $_SERVER['SERVER_NAME'] . $url;
}

function jwt_encode($data, $key = "SANSHENGIT")
{
    return JWT::encode($data, $key);
}

function jwt_uncode($token, $key = "SANSHENGIT")
{
    //    **
//    * 当前时间减去60，把时间留点余地
//    */
    JWT::$leeway = 60;
    /**
     * HS256方式，这里要和签发的时候对应
     */
    $decoded = JWT::decode($token, $key, ['HS256']);
    $data = (array)$decoded;
    return $data[0];
}






/**
 * 计算两点地理坐标之间的距离
 * @param  Decimal $longitude1 起点经度
 * @param  Decimal $latitude1  起点纬度
 * @param  Decimal $longitude2 终点经度
 * @param  Decimal $latitude2  终点纬度
 * @param  Int     $unit       单位 1:米 2:公里
 * @param  Int     $decimal    精度 保留小数位数
 * @return Decimal
 *
 * https://blog.csdn.net/zhao_teng/article/details/80418717
 */
function getDistance($longitude1 = 0, $latitude1 = 0, $longitude2 = 0, $latitude2 = 0, $unit=2, $decimal=2){

    $EARTH_RADIUS = 6370.996; // 地球半径系数
    $PI = 3.1415926;

    $radLat1 = $latitude1 * $PI / 180.0;
    $radLat2 = $latitude2 * $PI / 180.0;

    $radLng1 = $longitude1 * $PI / 180.0;
    $radLng2 = $longitude2 * $PI /180.0;

    $a = $radLat1 - $radLat2;
    $b = $radLng1 - $radLng2;

    $distance = 2 * asin(sqrt(pow(sin($a/2),2) + cos($radLat1) * cos($radLat2) * pow(sin($b/2),2)));
    $distance = $distance * $EARTH_RADIUS * 1000;

    if($unit==2){
        $distance = $distance / 1000;
    }

    return round($distance, $decimal);
}

/**
 * where 查询条件
 * @param $time
 * @return array
 */
function monthWhere($time) {
    $start_time = getThemonth($time)['time'][0];
    $end_time = getThemonth($time)['time'][1];
    $where[] = ['create_time', 'between time', [$start_time, $end_time]];
    return $where;
}


function today() {
    return strtotime(date("Y-m-d"),time());
}

/**
 * @param $time time()
 * @return array[]
 {
  "date": [
       "2020-05-01",
       "2020-05-31"
      ],
  "time": [
       1588262400,
       1590854400
      ]
  }
 */
function getThemonth($time)
{
    $time = strtotime($time);
    $fratday = date('Y-m-01', strtotime("$time 0 month"));
    $fratdaytime = strtotime($fratday);

    $lastday = date('Y-m-d', strtotime("$fratday +1 month +7 day"));
    $lastdaytime = strtotime($lastday);

    $date = [
        "date" => [$fratday, $lastday],
        "time" => [$fratdaytime, $lastdaytime],
    ];
    return $date;
}