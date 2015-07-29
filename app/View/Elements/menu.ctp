<div class = "container">
	<div class = "menu">
		<div class = "btn-group btn-group-justified" role = "group" aria-label="...">
			<?php echo $this->Html->link( 'Sign In', '/pages/signin', array ('class' => 'btn'));?>
		        <?php echo $this->Html->link( 'Register', '/pages/register', array ('class' => 'btn'));?>
		</div>
		<br/><br/>
		
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
			<?php echo $this->Html->link( 'Home','/', array('class' => 'btn btn-default'));?>
                	<?php echo $this->Html->link( 'Products', '/pages/products', array ('class' => 'btn btn-default'));?>
                  	<?php echo $this->Html->link( 'Loans', '/pages/loans', array ('class' => 'btn btn-default'));?>
   			<?php echo $this->Html->link( 'Contact Us', '/pages/contactus', array ('class' => 'btn btn-default'));?>
		</div>
	</div>
	<div class = "logo"><?php echo $this->Html->image('logo.png');?> </div></div>

</div>

<div class = "banner"> </div>

