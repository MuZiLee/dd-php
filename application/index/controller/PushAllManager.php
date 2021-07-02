<?php


namespace app\index\controller;


$servers = new JPushServers();
$servers->pushAll();