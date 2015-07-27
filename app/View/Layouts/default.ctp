<?php /**
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link http://cakephp.org CakePHP(tm) Project
 * @package app.View.Layouts
 * @since CakePHP(tm) v 0.10.0.1076
 * @license http://www.opensource.org/licenses/mit-license.php MIT License
 */ $cakeDescription = __d('cake_dev', 'CakePHP: the rapid development php framework'); ?> <!DOCTYPE html> <html> <head>

	<?php echo $this->Html->charset(); ?>
	<title>
		<?php echo $cakeDescription ?>:
		<?php echo $title_for_layout; ?>
	</title>

	<?php
		echo $this->Html->meta('', null, array('name' => 'viewport', 'content' => 'width=device-width, initial-scale=1.0'));		
		echo $this->Html->css('bootstrap');
		echo $this->Html->script ('http://code.jquery.com/jquery.js');
		echo $this->Html->script('bootstrap');
		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
		
	?> </head>  


<body>
	<div id="container">

		<div id="header">
			<?php echo $this->element('menu'); ?>

		</div>
		<div class="contentarea">
			<?php echo $this->Session->flash(); ?>
			<?php echo $this->fetch('content'); ?>

		</div>

		<div id="footer">
                <div id = "footertext">
	                <p> Footer </p>
                </div>
        </div>
