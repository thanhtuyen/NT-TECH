<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); 
	$themeConfig = $this->config->get('themecontrol');
	 
	 $categoryConfig = array( 
		'listing_products_columns' 		     => 0,
		'listing_products_columns_small' 	     => 2,
		'listing_products_columns_minismall'    => 1,
		'cateogry_display_mode' 			     => 'grid',
		'category_pzoom'				          => 1,
	); 
	$categoryConfig  = array_merge($categoryConfig, $themeConfig );
	$DISPLAY_MODE 	 = $categoryConfig['cateogry_display_mode'];
	$MAX_ITEM_ROW 	 = $themeConfig['listing_products_columns']?$themeConfig['listing_products_columns']:4; 
	$MAX_ITEM_ROW_SMALL = $categoryConfig['listing_products_columns_small']?$categoryConfig['listing_products_columns_small']:2;
	$MAX_ITEM_ROW_MINI  = $categoryConfig['listing_products_columns_minismall']?$categoryConfig['listing_products_columns_minismall']:1; 
	$categoryPzoom 	    = $categoryConfig['category_pzoom'];  
?>
<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>
<div class="container">
	<div class="row"> 
		<?php if( $SPAN[0] ): ?>
			<aside class="col-lg-<?php echo $SPAN[0];?> col-md-<?php echo $SPAN[0];?> col-sm-12 col-xs-12">
				<?php echo $column_left; ?>
			</aside>	
		<?php endif; ?> 

		<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">		
			<div id="content">
				<?php echo $content_top; ?>
				<h1><?php echo $heading_title; ?></h1>
				<?php if ($thumb || $description) { ?>
					<div class="category-info clearfix">
						<?php if ($thumb) { ?>
							<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" class="responsive-img" /></div>
						<?php } ?>
						<?php if ($description) { ?>
							<div class="category-description wrapper">
								<?php echo $description; ?>
							</div>
						<?php } ?>
					</div>
				<?php } ?> 
		  
				<?php if ($categories) { ?>
					<h4><?php echo $text_refine; ?></h4>
					<div class="category-list clearfix">
						<?php if (count($categories) <= 5) { ?>
						<ul class="links">
							<?php foreach ($categories as $category) { ?>
							<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
							<?php } ?>
						</ul>
						<?php } else { ?>
							<?php for ($i = 0; $i < count($categories);) { ?>
							<ul class="links">
								<?php $j = $i + ceil(count($categories) / 4); ?>
								<?php for (; $i < $j; $i++) { ?>
								<?php if (isset($categories[$i])) { ?>
									<li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
								<?php } ?>
								<?php } ?>
							</ul>
						<?php } ?>
						<?php } ?>
					</div>
				<?php } ?>
				
				<?php if ($products) { ?>
					<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/product/product_collection.tpl" );  ?>
				<?php } ?>					
		  
				<?php if (!$categories && !$products) { ?>
					<div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
					<div class="buttons">
						<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
					</div>
				<?php } ?>
		  
				<?php echo $content_bottom; ?></div>
			
		  
<script type="text/javascript">
<!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.products-block  .product-block').each(function(index, element) {
 
			 $(element).parent().addClass("col-fullwidth");
		});		
		
		$('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list active"><i class="fa fa-th-list"></i><em><?php echo $text_list; ?></em></a><a class="grid" onclick="display(\'grid\');"><i class="fa fa-th"></i><em><?php echo $text_grid; ?></em></a>');
	
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.products-block  .product-block').each(function(index, element) {
			 $(element).parent().removeClass("col-fullwidth");  
		});	
					
		$('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list" onclick="display(\'list\');"><i class="fa fa-th-list"></i><em><?php echo $text_list; ?></em></a><a class="grid active"><i class="fa fa-th"></i><em><?php echo $text_grid; ?></em></a>');
	
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('<?php echo $DISPLAY_MODE;?>');
}
//-->
</script> 

<?php if( $categoryPzoom ) {  ?>
<script type="text/javascript">
<!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: false,
		onLoad:function(){
			$("#cboxNext").remove(0);
			$("#cboxPrevious").remove(0);
			$("#cboxCurrent").remove(0);
		}
	});	 
});
//-->
</script>
<?php } ?>		
		
</section> 

<?php if( $SPAN[2] ): ?>
	<aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12">	
		<?php echo $column_right; ?>
	</aside>
<?php endif; ?>
		
</div></div>	
 
<?php echo $footer; ?>