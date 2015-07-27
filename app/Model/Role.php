<?php
App::uses('AppModel', 'Model');
/**
 * Role Model
 *
 */
class Role extends AppModel {
/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'roles';

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

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'RoleID' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'RoleDescription' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);
        
}
