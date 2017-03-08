<?php
/*
Plugin Name: МРОТ
Plugin URI:
Description: Плагин МРОТ
Version: 0.1
Author: r0ma
Author URI: http://r0ma.ru
License: Only for me
*/

add_action( 'init', 'create_post_type_mrot' );
function create_post_type_mrot() {
	$labels = array(
	'name' => 'МРОТ', // Основное название типа записи
	'singular_name' => 'МРОТ', // отдельное название записи типа Book
	'add_new' => 'Добавить МРОТ',
	'add_new_item' => 'Добавить новый МРОТ',
	'edit_item' => 'Редактировать МРОТ',
	'new_item' => 'Новый МРОТ',
	'view_item' => 'Посмотреть МРОТ',
	'search_items' => 'Найти МРОТ',
	'not_found' =>  'МРОТ не найден',
	'not_found_in_trash' => 'МРОТ в корзине не найден',
	'parent_item_colon' => '',
	'menu_name' => 'МРОТ по регионам РФ'

  );
  $args = array(
	'labels' => $labels,
	'public' => true,
	'publicly_queryable' => true,
	'show_ui' => true,
	'show_in_menu' => true,
	'query_var' => true,
	'rewrite' => true,
    // 'rewrite'   => array( 'slug' => false, 'with_front' => false ),
	'capability_type' => 'post',
	'has_archive' => true,
	'hierarchical' => false,
	// 'taxonomies' => array('pochta-bank-region', 'pochta-bank-letters'),
	'menu_position' => 101,
	'supports' => array('title','editor', 'thumbnail','excerpt')
  );
  register_post_type('mrot',$args);
}



/**
 * Remove the custom post type slug from URL
 */
 /*
function ett_remove_cpt_slug( $post_link, $post, $leavename ) {

    if ( ! in_array( $post->post_type, array( 'mrot' ) ) || 'publish' != $post->post_status )
        return $post_link;

    $post_link = str_replace( '/' . $post->post_type . '/', '/', $post_link );

    return $post_link;
}
add_filter( 'post_type_link', 'ett_remove_cpt_slug', 10, 3 );

function ett_parse_request_tricksy( $query ) {

    // Only noop the main query
    if ( ! $query->is_main_query() )
        return;

    // Only noop our very specific rewrite rule match
    if ( 2 != count( $query->query )
        || ! isset( $query->query['page'] ) )
        return;

    // 'name' will be set if post permalinks are just post_name, otherwise the page rule will match
    if ( ! empty( $query->query['name'] ) )
        $query->set( 'post_type', array( 'post', 'your_post_type', 'page' ) );
}
add_action( 'pre_get_posts', 'ett_parse_request_tricksy' );
*/



// Действия при активации плагина
register_activation_hook( __FILE__, 'mrot_activate' );

function mrot_activate() {

    // СОЗДАЕМ ТАБЛИЦЫ В БД
    global $wpdb;
	$sql_dir = array('wp_mrot_regions.sql', 'wp_mrot_info.sql');
	foreach ( $sql_dir as $table_name ) {
	    $res = $wpdb->get_results( "SELECT * FROM `$table_name`", ARRAY_A);
	    if ( count($res) == 0) {
	        $sql_create_table = file_get_contents( plugins_url('mrot/sql/' . $table_name) );
	        require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
	    	dbDelta( $sql_create_table );
	    }
	}

    // СОЗДАЕМ СТРУКТУРУ ПАПОК ДЛЯ ХРАНЕНИЯ ДАННЫХ
	$upload = wp_upload_dir();
	$upload_dir = $upload['basedir'];

    // Создаем общую папку `bik` в wp-content/uploads
    $upload_dir = $upload_dir . '/mrot';

	if ( ! wp_mkdir_p( $upload_dir ) ) {
		echo "Не удалось создать директорию <pre>mrot</pre>";
	}

	// Создаем пустой файл index.php чтобы исключить просмотр директории
	file_put_contents( $upload_dir.'/index.php', '<?php // Silence is golden.' );

    // Создаем директорию для *dbf файлов
    $img_dir = $upload_dir . '/images';
    wp_mkdir_p( $img_dir );

}

function get_last_date() {
    global $wpdb;
    $results = $wpdb->get_row( "SELECT DISTINCT `frontend_date`, `backend_date` FROM `wp_mrot_info` ORDER BY `backend_date` DESC", ARRAY_A, 0 );
    return $results['frontend_date'];
}

function get_mrot_info ( $slug ) {
    global $wpdb;
    $results = $wpdb->get_results( "SELECT * FROM `wp_mrot_regions`, `wp_mrot_info` WHERE (wp_mrot_regions.alias = '$slug') AND (wp_mrot_regions.region_id = wp_mrot_info.region_id) ORDER BY wp_mrot_info.backend_date DESC
", ARRAY_A );
    return $results;
}

// Создаем страницу настроек плагина
add_action( 'admin_menu', 'mrot_create_main_menu' );
function mrot_create_main_menu() {
	add_menu_page( "МРОТ", "МРОТ Плагин", 'manage_options', 'mrot-plugin-main-menu', 'mrot_settings_menu');
}

// Функция отображения страницы настроек
function mrot_settings_menu() {
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);

	set_time_limit(0);
    echo "<div><strong>В базе уже имеются данные о МРОТ на " . get_last_date() . "</strong></div>";
    echo "<h1>Настройка плагина МРОТ</h1><p>Данные для добавления/обновления постов должны лежать в файле data.CSV (в папке плагина).</p>Формат: <pre>id_региона, МРОТ для бюджетников, МРОТ для НЕ бюджетников, Дата для frontend'a, Дата для backend'a</pre>";
    echo "<h2>Добавить</h2>";
    echo "
	<form action='' method='POST'>
		<p><input type='submit' name='add' value='добавление'></p>
	</form>";

    echo "<hr>";

    echo "<h2>Обновить</h2>";
    echo "";
	echo "
	<form action='' method='POST'>
		<p><input type='submit' name='update' value='обновление'></p>
	</form>";

	define( "PLUGIN_ROOT_DIR", __DIR__ );


    if ( !empty( $_POST['add'] ) ) {
        if ( ($handle = fopen( PLUGIN_ROOT_DIR ."/data.csv", "r") ) !== FALSE) {

            global $wpdb;

            $max_id = $wpdb->get_var("SELECT MAX(`id`) FROM `wp_mrot_info`") ;
            if ($max_id == NULL) {
                $max_id = (int)1;
            } else $max_id++;

            $wpdb->show_errors();

            while (($arr = fgetcsv($handle, 1000, ",")) !== FALSE) {

                $wpdb->insert( 'wp_mrot_info',
                    array(
                        'id' => $max_id,
                        'region_id' => $arr[0],
                        'budget' => $arr[1],
                        'vne_budget' => $arr[2],
                        'frontend_date' => $arr[3],
                        'backend_date' => $arr[4],
                        'comment' => $arr[5],
                    ),
                    array ( '%d', '%d', '%s', '%s', '%s', '%s', '%s' )
                );
                $max_id++;

                // Проверяем наличие каталога для картинок
                $upload = wp_upload_dir();
            	$mrot_img_dir = $upload['basedir'];

                // Создаем папку в wp-content/uploads
                $mrot_img_dir = $mrot_img_dir . '/mrot/images/' . $arr[4];

                if ( ! file_exists($mrot_img_dir) ) {

					if ( wp_mkdir_p( $mrot_img_dir ) ) {
						echo "<p><strong>Создан каталог " . $mrot_img_dir . "</strong></p>";
						// Создаем пустой файл index.php чтобы исключить просмотр директории
	                	file_put_contents( $mrot_img_dir . '/index.php', '<?php // Silence is golden.' );
					}

                }

				// ПРОВЕРЯЕМ НАЛИЧИЕ КАРТИНКИ, ЕСЛИ ЕЕ НЕТ - СОЗДАЕМ.
				if ( ! file_exists($mrot_img_dir . "/" . $arr[0] . ".jpeg") ) {
					echo "Картинка для региона: $arr[6] не существует. Создаем в $mrot_img_dir...<br>";
					// Подключаем класс для работы с изображением
					include_once ( 'imageGenerator/LImageHandler.php' );
					// Подключаем выбранный шрифт текста
					$fontPath = PLUGIN_ROOT_DIR . '/imageGenerator/font/HelveticaRegular.ttf';
					// Указываем размер шрифта
					$fontSize = 25;
					// Задаем цвет
					$color = array(0, 0, 0);
					// Создаем экземпляр класса LImageHandler
					$ih = new LImageHandler;

					// Удаляем пустые элементы массива
			        $arr = array_filter($arr);

			        $counter = count($arr);

					// Если есть два вида МРОТ - для работников бюджетной и вне бюджетной сферы
			        if ( $counter == 6 ) {
			            $imgObj = $ih->load(PLUGIN_ROOT_DIR . '/imageGenerator/img_template/mrot.jpeg');
			            $imgObj->text('Минимальный размер оплаты труда', $fontPath, 20, $color, LImageHandler::CORNER_CENTER_TOP, 0, 10);
			            $imgObj->text($arr[6], $fontPath, 20, $color, LImageHandler::CORNER_CENTER_TOP, 0, 50);
			            $imgObj->text('с ' . $arr[3], $fontPath, 20, $color, LImageHandler::CORNER_CENTER_TOP, 0, 80);
			            $imgObj->text($arr[1], $fontPath, 35, array(34,116,135), LImageHandler::CORNER_LEFT_TOP, 210, 145);
			            $imgObj->text($arr[2], $fontPath, 35, array(34,116,135), LImageHandler::CORNER_LEFT_TOP, 210, 225);
			            $imgObj->save( $mrot_img_dir . "/$arr[6].jpeg", 2, 100 );
			        }

			        // Если есть только один вид МРОТ
			        if ( $counter == 5) {
			            $imgObj = $ih->load(PLUGIN_ROOT_DIR . '/imageGenerator/img_template/mrot_one_value.jpeg');
			            $imgObj->text('Минимальный размер оплаты труда', $fontPath, 20, $color, LImageHandler::CORNER_CENTER_TOP, 0, 10);
			            $imgObj->text($arr[6], $fontPath, 20, $color, LImageHandler::CORNER_CENTER_TOP, 0, 50);
			            $imgObj->text('в 2017 году', $fontPath, 20, $color, LImageHandler::CORNER_CENTER_TOP, 0, 80);
			            $imgObj->text($arr[1], $fontPath, 35, array(34,116,135), LImageHandler::CORNER_LEFT_TOP, 295, 155);
			            $imgObj->save( $mrot_img_dir . "/$arr[6].jpeg", 2, 100 );
			        }

				} else echo "<p><strong>Картинка для $arr[6] существует</strong></p>";


            }
			fclose($handle);

            $wpdb->print_error();
        }

    }
}
