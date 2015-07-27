<?php
App::uses('AppModel', 'Model');
/**
 * User Model
 *
 */
class User extends AppModel {

/**
 * Primary key field
 *
 * @var string
 */
	public $primaryKey = 'UserID';

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'Login';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
                'UserID' => array(
			'blank' => array(
				'rule' => array('blank'),
				'on' => 'create', // Limit validation to 'create' ie the userid is blank on a create call
			),
		),
                'PersonID' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'Role' => array(
			'numeric' => array(
				'rule' => array('numeric'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
			'notempty' => array(
				'rule' => array('notempty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'Login' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				'message' => 'The Login must not be empty.',
				'required' => true,
                        ),
			'maxlength' => array(
				'rule' => array('maxlength', 200),
                        	'message' => 'Your Login must not be longer than 200 characters.',
			),
                        'isUnique' => array(
				'rule' => 'isUnique',
				'message' => 'That Login Name already exists.',
				
                        ),
		),
		'Password' => array(
			'notempty' => array(
				'rule' => array('notempty'),
				'message' => 'Password is required',
			),
		),
		'Active' => array(
			'boolean' => array(
				'rule' => array('boolean'),
				//'message' => 'Your custom message here',
			),
		),
	);
/** 
* associations 
*/        
    public $belongsTo = array(
        'Person' => array(
            'className' => 'Person',
            'foreignKey' => 'PersonID',
            'conditions' => array('User.PersonID = Person.PersonID'),
            'dependent' => true // the perons details are deleted when the user is deleted
        ),
        'Role' => array(
            'className' => 'Role',
            'foreignKey' => 'Role',
            'conditions' => array('User.Role = Role.RoleID')
        )
    );      
}

