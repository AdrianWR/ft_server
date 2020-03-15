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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'cadet' );

/** MySQL database password */
define( 'DB_PASSWORD', '42saopaulo' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

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
define( 'AUTH_KEY',         'iRh$6/xB{XRwh#Ucod[}v(I-a{sy)ZPT?=dWRXo&&2rz&C6]<`CsfZ>*EvX/7wJX' );
define( 'SECURE_AUTH_KEY',  'FBbTA;pt@+:a}l1,C~8i#C~Y@PsFd8P9QC]5s[tiyYPepBEoKh.$,DJk1uP}&S3K' );
define( 'LOGGED_IN_KEY',    'rAE6-):<!}M;=!UdQ</]!n3@Uz2,3vSS?Kwio2UiWR}dnE[O2us73R}=y3M$qYoX' );
define( 'NONCE_KEY',        'PQS`35Rx<<Iy0$C>ZC8sOkz#OZ:i5;6%bDi|-4!K47j!++E>!e-6(HT]7W9dHGcD' );
define( 'AUTH_SALT',        '2J!%&{##B@c%E1;MHS_e()}z3z$j~_b*z.Wr+K!jmF=`w,k^WR#XRw| .!]dm*nm' );
define( 'SECURE_AUTH_SALT', '6K56NU!YS^=UX!)J`f4~-,FY^pJx(KM|^-=A-G`1TA],B9j_6$_(FgArG_H>nQa6' );
define( 'LOGGED_IN_SALT',   '(r W)45w[R ay&)o#~=H)994!c:ePZkAxq,D5fJ(]/-{;zI/aYk_wwWFxDRB_Ml>' );
define( 'NONCE_SALT',       '$Ryz(2=;s1gU;F/{pq%I@Jo x+4(ox{bY5!$OK!Xzp90`-{8BS,nP*s-`3*$h.)I' );

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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
