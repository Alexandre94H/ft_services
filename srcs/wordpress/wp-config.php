<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'ft_services' );

/** MySQL database username */
define( 'DB_USER', 'username' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '4<@@Hb^= GPYt3~#=RcSW2Lq&>NksFgLqWQZM2ZgnWj&{ZuFNL/0b`v*JAHpjEZ4' );
define( 'SECURE_AUTH_KEY',  '%,!lHLT%*H*Hfj} <:Q;6XlbnHG/B~n>09]_/+m.+WjjZZUK^XaWT~aN}s5rF(O]' );
define( 'LOGGED_IN_KEY',    'qQ%|Nz+YW2|FU0r1g&;is55;W<rO( qg3BXKw1s&HSKO~t,]i<#!s1]{~TDQbc5l' );
define( 'NONCE_KEY',        '=>ZFu!8cH+e8s<lNSa9/={tL7Ee@1D>m)wj*Pc4qyBw74CS@g.u/xR{e4b7;wJw~' );
define( 'AUTH_SALT',        '*hnM=Mqq?YuxQ==rIHf4#4!s{iL[_]`:U6E[6<h8PHCt|LG2N>5Dzcu@9Ip7;Vfq' );
define( 'SECURE_AUTH_SALT', '4>fWhy>fVv(cf1,9)!bMD,$RC!CKF77M)8<g8[OU 95[1.IK`sZZGwJ($Cp3>I/t' );
define( 'LOGGED_IN_SALT',   'Q!0eLvnV?8-Gcfm3$d=*y@9L0|6/G,X;#mTs4.s8F%wOUs9c1q?_-iLHhJ:?J!BJ' );
define( 'NONCE_SALT',       'N:4:Xd`VJG=dQUBSpR+!bV`4KK$2*4w90Aw-SQ.~q_{pVn9~A]n^M+zwUc6ht^-C' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';