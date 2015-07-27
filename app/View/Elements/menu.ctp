<div class = "container">
<div class = "menuarea">
	<div class = "menu">
		<ul class="nav navbar-nav navbar-right">		
			<br/>
			<?php echo $this->Html->link( 'Sign In', '/pages/signin', array ('class' => 'btn btn-large'));?>
			<?php echo $this->Html->link( 'Register', '/pages/register', array ('class' => 'btn btn-large'));?>
		</ul>
		


		<ul class="nav navbar-nav navbar-right">
			<?php echo $this->Html->link( 'Home','/', array('class' => 'btn btn-large'));?>
			<?php echo $this->Html->link( 'Products', '/pages/products', array ('class' => 'btn btn-large'));?>
			<?php echo $this->Html->link( 'Loans', '/pages/loans', array ('class' => 'btn btn-large'));?>
			<?php echo $this->Html->link( 'Contact Us', '/pages/contactus', array ('class' => 'btn btn-large'));?>
		</ul>
	</div>
	<div class = "logo"><?php echo $this->Html->image('logo.png');?> </div></div>
</div>
</div>
<div class = "banner"> </div>

