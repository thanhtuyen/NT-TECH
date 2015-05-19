<?php 
	$cols = 4;
	$span = 12/$cols;
?>
<div class="box box-product special">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>  	
	<div class="box-content">
		<div class="product-grid">
			<?php foreach ($products as $i => $product) { $i=$i+1; ?>
			<?php if( $i%$cols == 1 && $cols > 1 ) { ?>
			<div class="row">
			<?php } ?> 
				<div class="col-lg-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12">
					<div class="product-block">
						<?php if ($product['thumb']) { ?>
							<div class="image">
								<?php if( $product['special'] ) {   ?>				
								<span class="product-label-special"><span><?php echo $this->language->get( 'text_sale' ); ?></span></span>
								<?php } ?>
								<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
								<div class="img-overlay"></div>
							</div>
						<?php } ?>
						
						<div class="product-meta">
							<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
							<?php if ($product['rating']) { ?>
							<div class="rating">
								<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
							</div>
							<?php } ?>
							<?php if( isset($product['description']) ) { ?>
							<p class="description"><?php echo utf8_substr( strip_tags($product['description']),0,160);?>...</p>
							<?php } ?>
							
							<?php if ($product['price']) { ?>
							<div class="price">
								<?php if (!$product['special']) { ?>
									<?php echo $product['price']; ?>
								<?php } else { ?>
									<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
								<?php } ?>
							</div>
							<?php } ?>
							
							<div class="action">
								<div class="cart">
									<input type="button" value="&#xf07a;" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="product-icon fa fa-shopping-cart shopping-cart " data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_cart; ?>" />
								</div>
								<div class="wishlist"> 
									<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>" class="fa fa-heart product-icon" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_wishlist"); ?>">
										<?php //echo $this->language->get("button_wishlist"); ?>
									</a>
								</div>
								<div class="compare">
									<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_compare"); ?>" class="fa fa-exchange product-icon" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_compare"); ?>">
										<?php //echo $this->language->get("button_compare"); ?>
									</a>
								</div>
							</div>
						</div>		
					</div>
				</div>
			  
			<?php if( ($i%$cols == 0 || $i==count($products) ) && $cols > 1 ) { ?>
			</div>
			<?php } ?>			
			<?php } ?>
		</div>
	</div>	
	
</div>
