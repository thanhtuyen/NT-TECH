<?php 
	$span = 12/$cols; 
	$active = 'latest';
	$id = rand(1,9);	
?>
<div id="productdeals" class="<?php echo $prefix;?>box productdeals box-highlight">
	<div class="box-heading">
		<span><?php echo $heading_title; ?></span>
	</div>
	<div class="box-content">
 		<div class="box-products slide" id="pavdeals<?php echo $id;?>">
			<?php if( trim($message) ) { ?>
			<div class="box-description wrapper"><?php echo $message;?></div>
			<?php } ?>
			<?php if( count($products) > $itemsperpage ) { ?>
			<div class="carousel-controls">
				<a class="carousel-control left fa fa-angle-left" href="#pavdeals<?php echo $id;?>"   data-slide="prev">&lsaquo;</a>
				<a class="carousel-control right fa fa-angle-right" href="#pavdeals<?php echo $id;?>"  data-slide="next">&rsaquo;</a>
			</div>
			<?php } ?>
			<div class="carousel-inner">	
			<div class="product-grid">
			<?php
				$pages = array_chunk( $products, $itemsperpage);
			?>

			 <?php foreach ($pages as  $k => $tproducts ) {   ?>
					<div class="item <?php if($k==0) {?>active<?php } ?> products-block">
						<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
							<?php if( $i%$cols == 1 || $cols == 1) { ?>
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
										</div>
										<?php } ?>
										
										<div class="product-meta">
											<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
											
											<?php if ($product['rating']) { ?>
											<div class="rating">
												<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
											</div>
											<?php } ?>										
									
											<?php if ($product['price']) { ?>
											<div class="price">
												<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
												<?php } else { ?>
												<span class="price-old"><?php echo $product['price']; ?></span> 
												<span class="price-new"><?php echo $product['special']; ?></span>
												<?php } ?>
											</div>									
											<?php } ?>							
									
											<div class="action">								
												<div class="cart">													
													<span class="product-icon fa fa-shopping-cart shopping-cart " onclick="addToCart('<?php echo $product['product_id']; ?>');" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_cart; ?>">
														<?php //echo $button_cart; ?>				
													</span>											
												</div>
												<div class="wishlist">
													<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>" class="fa fa-heart product-icon" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_wishlist"); ?>">
														<?php // echo $this->language->get("button_wishlist"); ?>
													</a>	
												</div>
												<div class="compare">			
													<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_compare"); ?>" class="fa fa-exchange product-icon" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_compare"); ?>">
														<?php // echo $this->language->get("button_compare"); ?>
													</a>	
												</div>
											</div>										
										</div>
										
										<div class="deal deal_detail is-hidden">
											<ul>
												<li>
													<span><?php echo $this->language->get("text_discount");?></span>
													<span class="deal_detail_num"><?php echo $product['deal_discount'];?>%</span>
												</li>
												<li>
													<span><?php echo $this->language->get("text_you_save");?></span>
													<span class="deal_detail_num"><span class="price"><?php echo $product["save_price"]; ?></span></span>
												</li>
												<li>
													<span><?php echo $this->language->get("text_bought");?></span>
													<span class="deal_detail_num"><?php echo $product['bought'];?></span>
												</li>
											</ul>
										</div>
										
										<div class="deal deal-qty-box is-hidden">
											<?php echo sprintf($this->language->get("text_quantity_deal"), $product["quantity"]);?>
										</div>
									
										<div class="deal item-detail is-hidden">
											<div class="timer-explain">(<?php echo date($this->language->get("date_format_short"), strtotime($product['date_end_string'])); ?>)</div>	
										</div>
										
										<div id="item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>" class="deal item-countdown clearfix"></div>
										
										<script type="text/javascript">
										jQuery(document).ready(function($){
												$("#item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>").lofCountDown({
													formatStyle:2,
													TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime($product['date_end_string'])); ?>",
													DisplayFormat:"<ul><li>%%D%% <div><?php echo $this->language->get("text_days");?></div></li><li> %%H%% <div><?php echo $this->language->get("text_hours");?></div></li><li> %%M%% <div><?php echo $this->language->get("text_minutes");?></div></li><li> %%S%% <div><?php echo $this->language->get("text_seconds");?></div></li></ul>",
													FinishMessage: "<?php echo $this->language->get('text_finish');?>"
												});
											});
										</script>
									</div>
								</div>
						  
							<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
							</div>
							<?php } ?>
							
						<?php } //endforeach; ?>
					</div>
			  <?php } ?>
			</div>
			</div>  
		</div>
	</div> 
 </div>


<script type="text/javascript">
$('#pavdeals<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
</script>