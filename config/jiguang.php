<?php


use JMessage\JMessage;
use JPush\Client as JPush;

$appKey = '79778172c79dd53e94bb6ae5';

$masterSecret = '12b1d5eeb2f5f0d349576d31';

/// 极光推送
$push = new JPush($appKey, $masterSecret);
/// 极光IM
$jm = new JMessage($appKey, $masterSecret);