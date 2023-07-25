<?php
/**
 * Arquivo de Configuração do WordPress
 *
 * Contém as configurações do banco de dados, chaves de segurança e outras configurações importantes.
 * Você pode obter as informações do banco de dados com seu provedor de hospedagem.
 *
 * @link https://codex.wordpress.org/pt-br:Editando_wp-config.php
 *
 * @package WordPress
 */

// ** Configurações do Banco de Dados ** //
define( 'DB_NAME', getenv("db_database") );
define( 'DB_USER', getenv("db_user") );
define( 'DB_PASSWORD', getenv("db_password") );
define( 'DB_HOST', getenv("db_host") . ":3306" );
define( 'DB_CHARSET', getenv("db_charset") );
define( 'DB_COLLATE', getenv("db_collaction") );

// ** Chaves de Segurança ** //
// Defina as chaves únicas para maior segurança.
// Você pode gerar chaves usando o serviço de gerador de chaves do WordPress: https://api.wordpress.org/secret-key/1.1/salt/
define( 'AUTH_KEY',         getenv("WP_AUTH_KEY") );
define( 'SECURE_AUTH_KEY',  getenv("WP_SECURE_AUTH_KEY") );
define( 'LOGGED_IN_KEY',    getenv("WP_LOGGED_IN_KEY") );
define( 'NONCE_KEY',        getenv("WP_NONCE_KEY") );
define( 'AUTH_SALT',        getenv("WP_AUTH_SALT") );
define( 'SECURE_AUTH_SALT', getenv("WP_SECURE_AUTH_SALT") );
define( 'LOGGED_IN_SALT',   getenv("WP_LOGGED_IN_SALT") );
define( 'NONCE_SALT',       getenv("WP_NONCE_SALT") );

// ** Prefixo da Tabela ** //
// Altere o valor abaixo se você deseja ter várias instalações do WordPress em um único banco de dados.
// Você pode usar números, letras e sublinhados, mas não utilize espaços ou caracteres especiais.
$table_prefix = 'wp_';

// ** Para desenvolvedores: Modo de Depuração ** //
define( 'WP_DEBUG', true ); // Altere para true para ativar o modo de depuração.

// ** Configurações Extras ** //
define( 'WP_AUTO_UPDATE_CORE', 'minor' ); // Permite atualizações automáticas apenas para versões secundárias (ex.: 5.7.1 para 5.7.2).

/* Isso é tudo, pode parar de editar! :) */
define( 'ABSPATH', dirname( __FILE__ ) . '/' );
require_once ABSPATH . 'wp-settings.php';