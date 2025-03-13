<?php

//session_start();

/*
 * CKFinder Configuration File
 *
 * For the official documentation visit https://docs.ckeditor.com/ckfinder/ckfinder3-php/
 */

/*============================ PHP Error Reporting ====================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/debugging.html

// Production
//error_reporting(E_ALL & ~E_DEPRECATED & ~E_STRICT);
ini_set('display_errors', 0);

// Development
// error_reporting(E_ALL);
// ini_set('display_errors', 1);

/*============================ General Settings =======================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html

$config = array();

/*============================ Enable PHP Connector HERE ==============================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_authentication


session_start();

$config['authentication'] = function() {
    return true;
};



/*============================ License Key ============================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_licenseKey

$config['licenseName'] = 'tenmienchamcom';
$config['licenseKey']  = 'LBTBHS68KT7V8L631L7LQVH9P5VF2';

/*============================ CKFinder Internal Directory ============================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_privateDir

$config['privateDir'] = array(
    'backend' => 'default',
    'tags'   => '.ckfinder/tags',
    'logs'   => '.ckfinder/logs',
    'cache'  => '.ckfinder/cache',
    'thumbs' => '.ckfinder/cache/thumbs',
);

/*============================ Images and Thumbnails ==================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_images

$config['images'] = array(
    'maxWidth'  => 2560,
    'maxHeight' => 5000,
    'quality'   => 80,
    'sizes' => array(
        'small'  => array('width' => 480, 'height' => 320, 'quality' => 80),
        'medium' => array('width' => 600, 'height' => 480, 'quality' => 80),
        'large'  => array('width' => 800, 'height' => 600, 'quality' => 80)
    )
);

/*=================================== Backends ========================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_backends

$config['backends'][] = array(
    'name'         => 'default',
    'adapter'      => 'local',
    'baseUrl'      => '/uploaded/',
//  'root'         => '', // Can be used to explicitly set the CKFinder user files directory.
    'chmodFiles'   => 0777,
    'chmodFolders' => 0755,
    'filesystemEncoding' => 'UTF-8',
);

/*================================ Resource Types =====================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_resourceTypes

$config['defaultResourceTypes'] = 'All_Files';

$config['resourceTypes'][] = array(
    'name'              => 'All_Files', // Single quotes not allowed.
    'directory'         => '',
    'maxSize'           => 0,
    'allowedExtensions' => 'csv,doc,docx,gif,jpeg,jpg,webp,mov,mp3,mp4,mpeg,mpg,pdf,png,ppt,pptx,txt,wav,wma,wmv,xls,xlsx,zip',
    'deniedExtensions'  => '',
    'backend'           => 'default'
);


/*================================ Access Control =====================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_roleSessionVar

$config['roleSessionVar'] = 'CKFinder_UserRole';

// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_accessControl
$config['accessControl'][] = array(
    'role'                => '*',
    'resourceType'        => '*',
    'folder'              => '/',

    'FOLDER_VIEW'         => true,
    'FOLDER_CREATE'       => true,
    'FOLDER_RENAME'       => true,
    'FOLDER_DELETE'       => true,

    'FILE_VIEW'           => true,
    'FILE_CREATE'         => true,
    'FILE_RENAME'         => true,
    'FILE_DELETE'         => true,

    'IMAGE_RESIZE'        => true,
    'IMAGE_RESIZE_CUSTOM' => true
);


/*================================ Other Settings =====================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html

$config['overwriteOnUpload'] = false;
$config['checkDoubleExtension'] = true;
$config['disallowUnsafeCharacters'] = false;
$config['secureImageUploads'] = true;
$config['checkSizeAfterScaling'] = true;
$config['htmlExtensions'] = array('html', 'htm', 'xml', 'js');
$config['hideFolders'] = array('.*', 'CVS', '__thumbs', '_thumbs');
$config['hideFiles'] = array('.*');
$config['forceAscii'] = false;
$config['xSendfile'] = false;

// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_debug
$config['debug'] = false;

/*==================================== Plugins ========================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_plugins

$config['pluginsDirectory'] = __DIR__ . '/plugins';
$config['plugins'] = array();

/*================================ Cache settings =====================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_cache

$config['cache'] = array(
    'imagePreview' => 24 * 3600,
    'thumbnails'   => 24 * 3600 * 365,
    'proxyCommand' => 0
);

/*============================ Temp Directory settings ================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_tempDirectory

$config['tempDirectory'] = sys_get_temp_dir();

/*============================ Session Cause Performance Issues =======================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_sessionWriteClose

$config['sessionWriteClose'] = true;

/*================================= CSRF protection ===================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_csrfProtection

$config['csrfProtection'] = true;

/*===================================== Headers =======================================*/
// https://docs.ckeditor.com/ckfinder/ckfinder3-php/configuration.html#configuration_options_headers

$config['headers'] = array();

/*============================== End of Configuration =================================*/

// Config must be returned - do not change it.
return $config;
