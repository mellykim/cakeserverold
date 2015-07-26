<div class="roles view">
<h2><?php echo __('Role'); ?></h2>
	<dl>
		<dt><?php echo __('RoleID'); ?></dt>
		<dd>
			<?php echo h($role['Role']['RoleID']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('RoleDescription'); ?></dt>
		<dd>
			<?php echo h($role['Role']['RoleDescription']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Role'), array('action' => 'edit', $role['Role']['RoleID'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Role'), array('action' => 'delete', $role['Role']['RoleID']), null, __('Are you sure you want to delete # %s?', $role['Role']['RoleID'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Roles'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Role'), array('action' => 'add')); ?> </li>
	</ul>
</div>
