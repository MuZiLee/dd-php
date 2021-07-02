<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit57c441062e07adf544213774d7cd1d17
{
    public static $files = array (
        '1cfd2761b63b0a29ed23657ea394cb2d' => __DIR__ . '/..' . '/topthink/think-captcha/src/helper.php',
        '9b552a3cc426e3287cc811caefa3cf53' => __DIR__ . '/..' . '/topthink/think-helper/src/helper.php',
    );

    public static $prefixLengthsPsr4 = array (
        't' => 
        array (
            'think\\composer\\' => 15,
            'think\\captcha\\' => 14,
            'think\\' => 6,
        ),
        'a' => 
        array (
            'app\\' => 4,
        ),
        'J' => 
        array (
            'JPush\\' => 6,
            'JMessage\\' => 9,
        ),
        'G' => 
        array (
            'Grafika\\' => 8,
        ),
        'F' => 
        array (
            'Firebase\\JWT\\' => 13,
        ),
        'E' => 
        array (
            'EasyTask\\' => 9,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'think\\composer\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-installer/src',
        ),
        'think\\captcha\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-captcha/src',
        ),
        'think\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-helper/src',
            1 => __DIR__ . '/..' . '/topthink/think-image/src',
        ),
        'app\\' => 
        array (
            0 => __DIR__ . '/../..' . '/application',
        ),
        'JPush\\' => 
        array (
            0 => __DIR__ . '/..' . '/jpush/jpush/src/JPush',
        ),
        'JMessage\\' => 
        array (
            0 => __DIR__ . '/..' . '/jiguang/jmessage/src/JMessage',
        ),
        'Grafika\\' => 
        array (
            0 => __DIR__ . '/..' . '/kosinix/grafika/src/Grafika',
        ),
        'Firebase\\JWT\\' => 
        array (
            0 => __DIR__ . '/..' . '/firebase/php-jwt/src',
        ),
        'EasyTask\\' => 
        array (
            0 => __DIR__ . '/..' . '/easy-task/easy-task/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit57c441062e07adf544213774d7cd1d17::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit57c441062e07adf544213774d7cd1d17::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit57c441062e07adf544213774d7cd1d17::$classMap;

        }, null, ClassLoader::class);
    }
}
