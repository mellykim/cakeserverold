<div class="users view">
<h2><?php echo __('User'); ?></h2>
	<dl>
		<dt><?php echo __('UserID'); ?></dt>
		<dd>
			<?php echo h($user['User']['UserID']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('PersonID'); ?></dt>
		<dd>
			<?php echo h($user['Person']['FirstName']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('RoleID'); ?></dt>
		<dd>
			<?php echo h($user['Role']['RoleDescription']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Username'); ?></dt>
		<dd>
			<?php echo h($user['User']['Username']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Password'); ?></dt>
		<dd>
			<?php echo h($user['User']['Password']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Active'); ?></dt>
		<dd>
			<?php echo h($user['User']['Active']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit User'), array('action' => 'edit', $user['User']['UserID'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete User'), array('action' => 'delete', $user['User']['UserID']), null, __('Are you sure you want to delete # %s?', $user['User']['UserID'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Users'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New User'), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List People'), array('controller' => 'people', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Person'), array('controller' => 'people', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Roles'), array('controller' => 'roles', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Role'), array('controller' => 'roles', 'action' => 'add')); ?> </li>
	</ul>
</div>
	<div class="related">
		<h3><?php echo __('Related People'); ?></h3>
	<?php if (!empty($user['Person'])): ?>
		<dl>
			<dt><?php echo __('PersonID'); ?></dt>
		<dd>
	<?php echo $user['Person']['PersonID']; ?>
&nbsp;</dd>
		<dt><?php echo __('FirstName'); ?></dt>
		<dd>
	<?php echo $user['Person']['FirstName']; ?>
&nbsp;</dd>
		<dt><?php echo __('LastName'); ?></dt>
		<dd>
	<?php echo $user['Person']['LastName']; ?>
&nbsp;</dd>
		<dt><?php echo __('DoB'); ?></dt>
		<dd>
	<?php echo $user['Person']['DoB']; ?>
&nbsp;</dd>
		<dt><?php echo __('EmailAddress'); ?></dt>
		<dd>
	<?php echo $user['Person']['EmailAddress']; ?>
&nbsp;</dd>
		<dt><?php echo __('Phone'); ?></dt>
		<dd>
	<?php echo $user['Person']['Phone']; ?>
&nbsp;</dd>
		<dt><?php echo __('Mobile'); ?></dt>
		<dd>
	<?php echo $user['Person']['Mobile']; ?>
&nbsp;</dd>
		<dt><?php echo __('Active'); ?></dt>
		<dd>
	<?php echo $user['Person']['Active']; ?>
&nbsp;</dd>
		</dl>
	<?php endif; ?>
		<div class="actions">
			<ul>
				<li><?php echo $this->Html->link(__('Edit Person'), array('controller' => 'people', 'action' => 'edit', $user['Person']['PersonID'])); ?></li>
			</ul>
		</div>
	</div>
		<div class="related">
		<h3><?php echo __('Related Roles'); ?></h3>
	<?php if (!empty($user['Role'])): ?>
		<dl>
			<dt><?php echo __('RoleID'); ?></dt>
		<dd>
	<?php echo $user['Role']['RoleID']; ?>
&nbsp;</dd>
		<dt><?php echo __('RoleDescription'); ?></dt>
		<dd>
	<?php echo $user['Role']['RoleDescription']; ?>
&nbsp;</dd>
		</dl>
	<?php endif; ?>
		<div class="actions">
			<ul>
				<li><?php echo $this->Html->link(__('Edit Role'), array('controller' => 'roles', 'action' => 'edit', $user['Role']['RoleID'])); ?></li>
			</ul>
		</div>
	</div>
	