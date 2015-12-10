<?php

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Application;
use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;

try {

    // Register an autoloader
    $loader = new Loader();
    $loader->registerDirs(array(
        '../app/controllers/',
        '../app/models/'
    ))->register();

    // Create a DI
    $di = new FactoryDefault();

    // Setup the view component
    $di->set('view', function () {
        $view = new View();
        $view->setViewsDir('../app/views/');
        $view->registerEngines(array(
            ".volt" => function($view, $di) {
                $volt = new \Phalcon\Mvc\View\Engine\Volt($view, $di);
                $volt->setOptions(array(
                  'compiledPath' => '../app/views/compiled/',
                  'compileAlways' => true  
                ));
                return $volt;
            }
        ));
        return $view;
    });

    // Setup a base URI so that all generated URIs include the "tutorial" folder
    $di->set('url', function () {
        $url = new UrlProvider();
        $url->setBaseUri('/');
        return $url;
    });

    $di->set(
        'router',
        function () {
            require __DIR__.'/../app/config/routes.php';

            return $router;
        }
    );

    // Handle the request
    $application = new Application($di);

    echo $application->handle()->getContent();

} catch (\Exception $e) {
    echo "<h1>PhalconException</h1><br><p>" . $e->getMessage() . "</p>";
}