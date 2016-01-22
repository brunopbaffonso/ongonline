<?php

/**
 * Agana_Project_Module_Menu
 *
 * @category   Agana
 * @package    Agana_Project
 * @copyright  Copyright (c) 2011-2012 Winponta Software (http://www.winponta.com.br)
 * @author Ademir Mazer Jr (Nuno Mazer) <http://ademir.winponta.com.br>
 */
class Project_Module_Menu extends Zend_Controller_Plugin_Abstract implements Agana_Module_Menu_Interface {

    public function injectGlobalMenu() {
        //TODO ACL

        $globalMenu = Zend_Registry::get('Navigation.GlobalMenu');

        $menuAdm = $globalMenu->findOneBy('id', 'menu-adm');

        if ($menuAdm === null) {
            $menuAdm = new Zend_Navigation_Page_Uri(
                            array(
                                'label' => '{{i class=||icon-cog||}}{{/i}} {{translate}}Administration{{/translate}}',
                                'id' => 'menu-adm',
                                'uri' => '#',
                                'order' => 999,
                    ));
        }

        if (!$globalMenu->findOneBy('id', 'menu-project-adm')) {
            $newPage = new Zend_Navigation_Page_Mvc(
                    array(
                        'label' => '{{i class=||icon-folder-close||}}{{/i}} {{translate}}Projects{{/translate}}',
                        'id' => 'menu-project-adm',
                        'parent' => $menuAdm,
                        'load-in' => 'content-container',
                        'action' => 'index',
                        'controller' => 'gm',
                        'module' => 'aganacore',
                        'params' => array(
                            'id' => 'project',
                        ),
                        //'route' => 'gmRoute',
                    )
            );
        }

        $menuReg = $globalMenu->findOneBy('id', 'menu-registrations');

        if ($menuReg === null) {
            $menuReg = new Zend_Navigation_Page_Uri(
                            array(
                                'label' => '{{i class=||icon-list-alt||}}{{/i}} {{translate}}Registrations{{/translate}}',
                                'id' => 'menu-registrations',
                                'uri' => '#',
                                'order' => 998,
                    ));
        }

//        if (!$globalMenu->findOneBy('id', 'menu-staff-employee')) {
//            $newPage = new Zend_Navigation_Page_Mvc(
//                    array(
//                        'label' => '{{i class=||icon-group||}}{{/i}} {{translate}}Employees{{/translate}}',
//                        'id' => 'menu-staff-employee',
//                        'parent' => $menuReg,
//                        'load-in' => 'content-container',
//                        'action' => 'index',
//                        'controller' => 'employee',
//                        'module' => 'staff',
//                        'route' => 'default',
//                    )
//            );
//        }
//        
//        if (!$globalMenu->findOneBy('id', 'menu-staff-volunteer')) {
//            $newPage = new Zend_Navigation_Page_Mvc(
//                    array(
//                        'label' => '{{i class=||icon-group||}}{{/i}} {{translate}}Volunteers{{/translate}}',
//                        'id' => 'menu-staff-volunteer',
//                        'parent' => $menuReg,
//                        'load-in' => 'content-container',
//                        'action' => 'index',
//                        'controller' => 'volunteer',
//                        'module' => 'staff',
//                        'route' => 'default',
//                    )
//            );
//        }
        
        $globalMenu->addPage($menuAdm);
        $globalMenu->addPage($menuReg);
    }
    
    public function preDispatch(Zend_Controller_Request_Abstract $request) {
        $this->injectGlobalMenu();
    }

}