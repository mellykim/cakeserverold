<?php
App::uses('AppController', 'Controller');
/**
 * Users Controller
 *
 * @property User $User
 * @property PaginatorComponent $Paginator
 * @property sessionComponent $session
 */
class UsersController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

// added for the auth tute
    public function beforeFilter(){
        parent::beforeFilter();
        // we just add all the action names we want guests to use
        // rename add to register later
        $this->Auth->allow('add', 'logout');
    }
        
/**
 * index method
 *
 * @return void
 */
    public function index() {
            $this->User->recursive = 0;
            $this->set('users', $this->Paginator->paginate());
    }
// login method
    public function login(){
        if ($this->request->is('post')) {
            if ($this->Auth->login()) {
                return $this->redirect($this->Auth->redirectUrl());
            }
            $this->Session->setFlash(__('Invalid username or password, try again'));
        } 
    }
 // logout method   
    public function logout(){
        return $this->redirect($this->Auth->logout());
    }
    
/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
    public function view($id = null) {
            if (!$this->User->exists($id)) {
                    throw new NotFoundException(__('Invalid user'));
            }
    //	$options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
    //	$this->set('user', $this->User->find('first', $options));
    // added for the auth tute
            $this->set('user', $this->User->findById($id));
    }

/**
 * add method
 *
 * @return void
 */
    public function add() {
        if ($this->request->is('post')) {
                $this->User->create();
                if ($this->User->save($this->request->data)) {
                        $this->Session->setFlash(__('The user has been saved.'));
                        return $this->redirect(array('action' => 'index'));
                } else {
                        $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
                }
        }
        // not required now i fixed the model relationships
        //$userRoles = $this->User->Role->find('list');
        //$this->set(compact('userRoles'));
        //$userPeople = $this->User->Person->find('list');
        //$this->set(compact('userPeople'));
    }

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
    public function edit($id = null) {
        if (!$this->User->exists($id)) {
                throw new NotFoundException(__('Invalid user'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
                if ($this->User->save($this->request->data)) {
                        $this->Session->setFlash(__('The user has been saved.'));
                        return $this->redirect(array('action' => 'index'));
                } else {
                        $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
                }
        } else {
        //        $options = array('conditions' => array('User.' . $this->User->primaryKey => $id));
        //        $this->request->data = $this->User->find('first', $options);
        // the tutes code  may need to change Password      
                $this->request->data = $this->User->findById($id);
                unset($this->request->data['User']['password']);
        }
    }

/**
 * delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
    public function delete($id = null) {
        $this->request->onlyAllow('post', 'delete');
        $this->User->id = $id;
        if (!$this->User->exists()) {
                throw new NotFoundException(__('Invalid user'));
        }
        //$this->request->onlyAllow('post', 'delete');
        if ($this->User->delete()) {
                $this->Session->setFlash(__('The user has been deleted.'));
        } else {
                $this->Session->setFlash(__('The user could not be deleted. Please, try again.'));
        }
        return $this->redirect(array('action' => 'index'));
    }

    
}