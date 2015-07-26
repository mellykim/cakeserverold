<?php
App::uses('AppModel', 'Model');
/**
 * Role Model
 *
 */
class Role extends AppModel {

/**
 * Primary key field
 *
 * @var string
 */
	public $primaryKey = 'RoleID';

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'RoleDescription';

}
