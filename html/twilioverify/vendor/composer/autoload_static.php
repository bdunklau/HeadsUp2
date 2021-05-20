<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitdb2625331fb640c038388f13e121a1e9
{
    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Twilio\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Twilio\\' => 
        array (
            0 => __DIR__ . '/..' . '/twilio/sdk/src/Twilio',
        ),
    );

    public static $prefixesPsr0 = array (
        'M' => 
        array (
            'Monolog' => 
            array (
                0 => __DIR__ . '/..' . '/monolog/monolog/src',
            ),
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitdb2625331fb640c038388f13e121a1e9::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitdb2625331fb640c038388f13e121a1e9::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInitdb2625331fb640c038388f13e121a1e9::$prefixesPsr0;
            $loader->classMap = ComposerStaticInitdb2625331fb640c038388f13e121a1e9::$classMap;

        }, null, ClassLoader::class);
    }
}
