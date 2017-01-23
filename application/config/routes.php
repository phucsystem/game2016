<?php

$route['default_controller'] = 'home';

/**
 * FROND END ROUTES
 */
$route['account'] = 'frontend/account/index';
$route['account/login'] = 'frontend/account/login';
$route['account/logout'] = 'frontend/account/logout';
$route['account/forget'] = 'frontend/account/forget';
$route['account/profile'] = 'frontend/account/profile';
$route['account/profile/success/(:any)'] = 'frontend/account/profile/success/$1';


$route['game'] = 'frontend/game/dashboard';
$route['game/dashboard'] = 'frontend/game/dashboard';
$route['game/products'] = 'frontend/game/products';
$route['game/development'] = 'frontend/game/development';
$route['game/products/success/(:any)'] = 'frontend/game/products/success/$1';
$route['game/getproduct/(:any)'] = 'frontend/game/getproduct/$1';
$route['game/components'] = 'frontend/game/components';
$route['game/components/success/(:any)'] = 'frontend/game/components/success/$1';
$route['game/recycling'] = 'frontend/game/recycling/success/$1';
$route['game/recycling/success/(:any)'] = 'frontend/game/recycling';
$route['game/checkrecycle/(:any)'] = 'frontend/game/checkrecycle/$1';
$route['game/rejectrecycle/(:any)'] = 'frontend/game/rejectrecycle/$1';
$route['game/approverecycle/(:any)'] = 'frontend/game/approverecycle/$1';
$route['game/receiveproduct'] = 'frontend/game/receiveproduct';
$route['game/production'] = 'frontend/game/production';
$route['game/production/success/(:any)'] = 'frontend/game/production/success/$1';
$route['game/transport'] = 'frontend/game/transport';
$route['game/transport/success/(:any)'] = 'frontend/game/transport/success/$1';
$route['game/sales'] = 'frontend/game/sales';
$route['game/sales/success/(:any)'] = 'frontend/game/sales/success/$1';

$route['game/information'] = 'frontend/game/information';
$route['game/startround'] = 'frontend/game/startround';
$route['game/endround'] = 'frontend/game/endround';
$route['game/nextstep'] = 'frontend/game/nextstep';
$route['game/nextstep/(:any)'] = 'frontend/game/nextstep/$1';

$route['record/detail/(:any)'] = 'frontend/record/detail/$1';

$route['information/component'] = 'frontend/information/component';
$route['information/region'] = 'frontend/information/region';
$route['information/event'] = 'frontend/information/event';
$route['information/recycle'] = 'frontend/information/recycle';
$route['information/evaluations'] = 'frontend/information/evaluations';
$route['information/customer'] = 'frontend/information/customer';
$route['information/storage'] = 'frontend/information/storage';

/**
 * BACK END ROUTES
 */
$route['master'] = 'backend/game/index';
$route['master/dashboard'] = 'backend/dashboard/index';
$route['master/login'] = 'backend/account/login';
$route['master/logout'] = 'backend/account/logout';
$route['master/forget'] = 'backend/account/forget';

$route['master/account/profile'] = 'backend/account/profile';
$route['master/account/profile/success/(:any)'] = 'backend/account/profile/success/$1';

$route['master/game'] = 'backend/game/index';
$route['master/game/add'] = 'backend/game/add';
$route['master/game/add_round/gameid/(:any)'] = 'backend/game/add_round/gameid/$1';
$route['master/game/success/(:any)'] = 'backend/game/index/success/$1';
$route['master/game/edit/(:any)'] = 'backend/game/edit/$1';
$route['master/game/edit_default'] = 'backend/game/edit_default';
$route['master/game/edit_round/gameid/(:any)'] = 'backend/game/edit_round/gameid/$1';
$route['master/game/remove/(:any)'] = 'backend/game/remove/id/$1';
$route['master/game/round/(:any)'] = 'backend/game/round/round-index/$1';

$route['master/round/index/(:any)'] = 'backend/round/index/$1';
$route['master/round/index/(:any)/(:any)'] = 'backend/round/index/$1/$2';
$route['master/round/sale/(:any)'] = 'backend/round/sale/$1';
$route['master/round/startround/(:any)'] = 'backend/round/startround/$1';
$route['master/round/stopround/(:any)'] = 'backend/round/stopround/$1';
$route['master/round/filtersale/(:any)/(:any)/(:any)'] = 'backend/round/filtersale/$1/$2';
$route['master/round/improvement/(:any)/(:any)'] = 'backend/round/improvement/$1/$2';
$route['master/round/finishround/(:any)'] = 'backend/round/finishround/$1';
$route['master/round/startnew/(:any)'] = 'backend/round/startnew/$1';
$route['master/round/getusedproduct/(:any)'] = 'backend/round/getusedproduct/$1';
$route['master/round/returnproduct/(:any)'] = 'backend/round/returnproduct/$1';
$route['master/round/getrecyclehistory/(:any)'] = 'backend/round/getrecyclehistory/$1';
$route['master/round/report/(:any)'] = 'backend/round/report/$1';

$route['master/team'] = 'backend/team/index';
$route['master/team/add'] = 'backend/team/add';
$route['master/team/add_round/(:any)'] = 'backend/team/add_round/$1';
$route['master/team/success/(:any)'] = 'backend/team/index/success/$1';
$route['master/team/edit/(:any)'] = 'backend/team/edit/id/$1';
$route['master/team/edit_round/(:any)'] = 'backend/team/edit_round/$1';
$route['master/team/edit_default'] = 'backend/team/edit_default';
$route['master/team/remove/(:any)'] = 'backend/team/remove/id/$1';
$route['master/team/round/(:any)'] = 'backend/team/round/round-index/$1';


$route['master/player'] = 'backend/player/index';
$route['master/player/add'] = 'backend/player/add';
$route['master/player/success/(:any)'] = 'backend/player/index/success/$1';
$route['master/player/edit/(:any)'] = 'backend/player/edit/id/$1';
$route['master/player/remove/(:any)'] = 'backend/player/remove/id/$1';
$route['master/player/checkuser/(:any)'] = 'backend/player/checkuser/$1';


