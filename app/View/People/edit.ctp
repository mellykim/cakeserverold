<div class="people form">
<?php echo $this->Form->create('Person'); ?>
	<fieldset>
		<legend><?php echo __('Edit Person'); ?></legend>
	<?php
		echo $this->Form->input('PersonID');
		echo $this->Form->input('FirstName');
		echo $this->Form->input('LastName');
		echo $this->Form->input('DoB');
		echo $this->Form->input('EmailAddress');
		echo $this->Form->input('Phone');
		echo $this->Form->input('Mobile');
		echo $this->Form->input('Active');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Person.PersonID')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Person.PersonID'))); ?></li>
		<li><?php echo $this->Html->link(__('List People'), array('action' => 'index')); ?></li>
	</ul>
</div>
