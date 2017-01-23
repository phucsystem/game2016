<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| File and Directory Modes
|--------------------------------------------------------------------------
|
| These prefs are used when checking and setting modes when working
| with the file system.  The defaults are fine on servers with proper
| security, but you may wish (or even need) to change the values in
| certain environments (Apache running a separate process for each
| user, PHP under CGI with Apache suEXEC, etc.).  Octal values should
| always be used to set the mode correctly.
|
*/
define('FILE_READ_MODE', 0644);
define('FILE_WRITE_MODE', 0666);
define('DIR_READ_MODE', 0755);
define('DIR_WRITE_MODE', 0755);

/*
|--------------------------------------------------------------------------
| File Stream Modes
|--------------------------------------------------------------------------
|
| These modes are used when working with fopen()/popen()
|
*/

define('FOPEN_READ', 'rb');
define('FOPEN_READ_WRITE', 'r+b');
define('FOPEN_WRITE_CREATE_DESTRUCTIVE', 'wb'); // truncates existing file data, use with care
define('FOPEN_READ_WRITE_CREATE_DESTRUCTIVE', 'w+b'); // truncates existing file data, use with care
define('FOPEN_WRITE_CREATE', 'ab');
define('FOPEN_READ_WRITE_CREATE', 'a+b');
define('FOPEN_WRITE_CREATE_STRICT', 'xb');
define('FOPEN_READ_WRITE_CREATE_STRICT', 'x+b');

/*
|--------------------------------------------------------------------------
| Display Debug backtrace
|--------------------------------------------------------------------------
|
| If set to TRUE, a backtrace will be displayed along with php errors. If
| error_reporting is disabled, the backtrace will not display, regardless
| of this setting
|
*/
define('SHOW_DEBUG_BACKTRACE', TRUE);

/*
|--------------------------------------------------------------------------
| Exit Status Codes
|--------------------------------------------------------------------------
|
| Used to indicate the conditions under which the script is exit()ing.
| While there is no universal standard for error codes, there are some
| broad conventions.  Three such conventions are mentioned below, for
| those who wish to make use of them.  The CodeIgniter defaults were
| chosen for the least overlap with these conventions, while still
| leaving room for others to be defined in future versions and user
| applications.
|
| The three main conventions used for determining exit status codes
| are as follows:
|
|    Standard C/C++ Library (stdlibc):
|       http://www.gnu.org/software/libc/manual/html_node/Exit-Status.html
|       (This link also contains other GNU-specific conventions)
|    BSD sysexits.h:
|       http://www.gsp.com/cgi-bin/man.cgi?section=3&topic=sysexits
|    Bash scripting:
|       http://tldp.org/LDP/abs/html/exitcodes.html
|
*/
define('EXIT_SUCCESS', 0); // no errors
define('EXIT_ERROR', 1); // generic error
define('EXIT_CONFIG', 3); // configuration error
define('EXIT_UNKNOWN_FILE', 4); // file not found
define('EXIT_UNKNOWN_CLASS', 5); // unknown class
define('EXIT_UNKNOWN_METHOD', 6); // unknown class member
define('EXIT_USER_INPUT', 7); // invalid user input
define('EXIT_DATABASE', 8); // database error
define('EXIT__AUTO_MIN', 9); // lowest automatically-assigned error code
define('EXIT__AUTO_MAX', 125); // highest automatically-assigned error code


/**
 * GAME CONSTANTS
 */

define('STEP_DASHBOARD', 1);
define('STEP_DEVELOPMENT', 2);
define('STEP_COMPONENTS', 3);
define('STEP_RECYCLING', 4);
define('STEP_PRODUCTION', 5);
define('STEP_TRANSPORT', 6);
define('STEP_SALE', 7);
define('STEP_INFORMATION', 8);

/**
 * INFORMATION SUB STEPS
 */
define('STEP_INFORMATION_COMPONENT', 9);
define('STEP_INFORMATION_REGION', 10);
define('STEP_INFORMATION_EVENT', 11);
define('STEP_INFORMATION_RECYCLE', 12);
define('STEP_INFORMATION_EVALUATIONS', 13);
define('STEP_INFORMATION_CUSTOMER', 14);
define('STEP_INFORMATION_STORAGE', 15);


/**
 * GAME MASTER CONSTANTS
 */

define('STEP_MASTER_DASHBOARD', 1);
define('STEP_MASTER_GAME', 2);
define('STEP_MASTER_TEAM', 3);
define('STEP_MASTER_PLAYER', 4);

/**
 * Game Status Constants
 */
define('GAME_DEACTIVE', 0);
define('GAME_ACTIVE', 1);
define('GAME_ROUND_FINISH', 2);
define('GAME_ROUND_FINISH_EVALUATION', 3);



/*
 * Region Constants
 */
define('REGION_DEVELOPMENT_COUNTRY', 1);
define('REGION_EMERGING_COUNTRY_1', 2);
define('REGION_EMERGING_COUNTRY_2', 3);
define('REGION_INDUSTRIAL_COUNTRY', 4);

/**
 * Round status
 */
define('ROUND_START', 0);
define('ROUND_IN_PROGRESS', 1);
define('ROUND_WAIT_FOR_EVALUATE', 2);
define('ROUND_DONE', 3);

/***
 *  USER TYPE
 */
define('USER_TYPE_MASTER', 1);
define('USER_TYPE_PLAYER', 2);

/***
 * PLAYER ROLE
 */
define('PLAYER_LEADER', 1);
define('PLAYER_MEMBER', 2);


/**
 * GAME SETTING TYPE
 */
define('SETTING_REGION', 1);
define('SETTING_MANUFACTURING', 2);

/**
 * REGION SETTING KEY
 */
// Cost factor for development and production
define('REGION_COST_FACTOR', 1);
define('REGION_QUALITY_FACTOR_1', 2);
define('REGION_QUALITY_FACTOR_2', 3);
define('REGION_MARKET_VOLUME', 4);
define('REGION_EMPLOYEE_QUALIFICATION', 5);
define('REGION_LABOR_COST', 6);
define('REGION_OSH_COST', 7);
define('REGION_OSH_QUALITY', 8);
define('REGION_ENVIRONMENT_REGULATION', 9);
define('REGION_RETURN_RATE', 10);
define('REGION_TRANSPORT_COST_IC', 11);
define('REGION_TRANSPORT_COST_EC1', 12);
define('REGION_TRANSPORT_COST_EC2', 13);
define('REGION_TRANSPORT_COST_DC', 14);
define('REGION_ECO_CREDIT_TRANSPORT', 15);
define('REGION_RECYCLING_QUALITY_FACTOR_1', 16);
//Cost factor for recycle
define('REGION_COST_FACTOR_RECYCLE', 17);
//Cost factor for transport
define('REGION_COST_FACTOR_TRANSPORT', 18);
define('REGION_ECO_CREDIT_PRODUCTION', 19);
define('REGION_ECO_CREDIT_SALE', 20);
define('REGION_SO_CREDIT_SALE', 21);


/**
 * CUSTOMER FACTOR SETTING KEY
 */
define('CUSTOMER_MARKET_SHARE', 1);
define('CUSTOMER_PRICE', 2);
define('CUSTOMER_RELIABILITY', 3);
define('CUSTOMER_RANGE', 4);
define('CUSTOMER_DESIGN', 5);
define('CUSTOMER_IMAGE', 6);

/*
 * Customer Constants
 */
define('CUSTOMER_TYPE_POOR_STUDENT', 1);
define('CUSTOMER_TYPE_HEAVY_USER', 2);
define('CUSTOMER_TYPE_ECO_HIPSTER', 3);


/**
 * MANUFACTURING SETTING KEY
 */
define('MANUFACTURING_DEVELOPMENT_COST', 1);
define('MANUFACTURING_INHOUSE_MANUF_COST', 2);
define('MANUFACTURING_FIXED_COST', 3);

/**
 * RECYCLE METHOD FACTOR
 */
define('RECYCLE_METHOD_NAME', 1);
define('RECYCLE_METHOD_COST', 2);
define('RECYCLE_METHOD_RETURN_MONEY', 3);
define('RECYCLE_METHOD_COMPONENT', 4);
define('RECYCLE_METHOD_COMPONENT1', 41);
define('RECYCLE_METHOD_COMPONENT2', 42);
define('RECYCLE_METHOD_COMPONENT3', 43);
define('RECYCLE_METHOD_RECYCLE_RATE', 5);
define('RECYCLE_METHOD_ECO_CREDIT', 6);
define('RECYCLE_METHOD_SO_CREDIT', 7);
define('RECYCLE_METHOD_ME_CREDIT', 8);

/**
 * COMPONENT REQUIRE CONST
 */
define('COMPONENT_REQUIRED', 1);
define('COMPONENT_OPTIONAL', 0);

/**
 * TEAM FACTORS
 */
define('TEAM_MONEY', 1);
define('TEAM_ECO_CREDIT', 2);
define('TEAM_SO_CREDIT', 3);
define('TEAM_ME_CREDIT', 4);
define('TEAM_FACTORY_CAPACITY', 5);
define('TEAM_STORAGE_CAPACITY_IC', 6);
define('TEAM_STORAGE_CAPACITY_EC1', 7);
define('TEAM_STORAGE_CAPACITY_EC2', 8);
define('TEAM_STORAGE_CAPACITY_DC', 9);
define('TEAM_DEVELOPMENT_COST', 10);
define('TEAM_INHOUSE_MANUFACTURING_COST', 11);
define('TEAM_FIXED_COST', 12);

/*
 * STORAGE TYPE
 */
define('ITEM_STORE_TYPE_MATERIAL', 1);
define('ITEM_STORE_TYPE_PRODUCT', 2);

/*
 * RECORD TYPE
 */
define('RECORD_TYPE_MONEY', 1);
define('RECORD_TYPE_ECO', 2);
define('RECORD_TYPE_SO', 3);
define('RECORD_TYPE_ME', 4);
define('RECORD_TYPE_FACTORY_CAPACITY', 5);

define('PRODUCT_STATUS_NEW', 1);
define('PRODUCT_STATUS_USED', 2);


/*
 * Setting Value
 */
define('COST_OVER_CAPACITY_WAREHOUSE', 100);

define('RECYCLE_STATUS_OFFER', 1);
define('RECYCLE_STATUS_APPROVE', 2);
define('RECYCLE_STATUS_REJECT', 3);

define('ECO_IMPACT_FOR_PRODUCT', 0.1);
define('ECO_IMPACT_FOR_TRANSPORT', 0.05);