<?php
/******************************************************
 * @package Pav Category Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

$span = 12/$cols;
$id = rand(1,9)+rand();
$tabdefault = str_replace(' ', '', key($tabs).$id);
$categoryConfig = array(
'category_pzoom'				          => 1,
);
$categoryPzoom 	    = $categoryConfig['category_pzoom'];
?>
<div class="box box productcarousel">
	<?php if( !empty($module_description) ) { ?>
	<div class="module-desc">
		<?php echo $module_description;?>
	</div>
	<?php } ?>

	<div class="productcarousel">
		<?php $image = $this->model_tool_image->resize( $icon, 32,32 );?>

		<div class="category-name <?php echo $prefix_class;?>"><h2><a href="<?php echo $link_category;?>"><?php echo $category_name;?></a></h2></div>
        <ul class="nav nav-tabs"></ul>
		<?php if($flag == 0):?>
		<ul class="nav nav-tabs" id="producttabs<?php echo $id;?>">
			<?php $i = 0;?>
			<?php foreach( $tabs as $tab => $products ): if(empty($products)): continue; endif;  ?>
			<?php $i++;?>
			<?php if($i <= $limit_tabs):?>
			<?php $idtab = str_replace(' ', '', $tab.$id);?>
			<?php $active = ($idtab == $tabdefault)?'class="active"':'';?>
			<li <?php echo $active;?> >
				<a href="#tab-<?php echo str_replace(' ', '', $tab.$id);?>" data-toggle="tab" class="tab-link"><?php echo $tab;?></a>
			</li>
			<?php endif; ?>
			<?php endforeach; ?>
		</ul>
		<?php endif; ?>
	</div>

	<div class="box-content">
		<?php $i = 0;?>
		<?php foreach( $tabs as $tab => $products ) {
			$i++;
			if($i <= $limit_tabs) {
			$idtab = str_replace(' ', '', $tab.$id);
			$active = ($idtab == $tabdefault)?'active':'';
			if( empty($products) ){ continue;}
        ?>
			<div class="tab-pane box-products tabcarousel<?php echo $id; ?> slide <?php echo $active;?>" id="tab-<?php echo str_replace(' ', '', $tab.$id);?>">
				<?php if($status_nav == 1) { ?>
				<?php if( count($products) > $itemsperpage ) { ?>
                <div class="carousel-controls">
                    <a class="carousel-control left fa fa-angle-left" href="#tab-<?php echo str_replace(' ', '', $tab.$id);?>"   data-slide="prev"></a>
                    <a class="carousel-control right fa fa-angle-right" href="#tab-<?php echo str_replace(' ', '', $tab.$id);?>"  data-slide="next"></a>
                </div>
				<?php } ?>
				<?php } ?>
				<div class="carousel-inner">
					<?php
					$pages = array_chunk( $products, $itemsperpage);
					//	echo '<pre>'.print_r( $pages, 1 ); die;
					?>
					<?php foreach ($pages as  $k => $tproducts ) { ?>
					<div class="item <?php echo ($k==0)?'active':'';?> ">
						<div class="product-grid">
						<?php foreach( $tproducts as $i => $product ) { ?>
							<?php if( $i++%$cols == 0 ) { ?>
							<div class="row">
							<?php } ?>
                                <div class="col-lg-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12">
								    <div class="product-block">
										<?php if ($product['thumb']) { ?>
										<div class="image">
											<?php if ($product['special']) { ?>
												<span class="product-label-special"><span><?php echo $this->language->get( 'text_sale' ); ?></span></span>
											<?php } ?>
											<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                                            <?php if( $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
                                            <a href="<?php echo $zimage;?>" class="info-view colorbox product-zoom" rel="colorbox" title="<?php echo $product['name']; ?>"><i class="fa fa-search-plus"></i></a>
                                            <?php } ?>
                                            <div class="img-overlay"></div>

										</div>
										<?php } ?>
                                        <div class="product-meta">
                                            <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                            <p class="description">
                                                <?php echo utf8_substr( strip_tags($product['description']),0,40);?>...
                                            </p>
                                            <?php if ($product['rating']) { ?>
                                            <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
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
                                                    <input type="button" value="&#xf07a;" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="product-icon fa fa-shopping-cart shopping-cart " data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_cart; ?>" />
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
								  </div>
                                </div>
								<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
							</div>
							<?php } ?>
							<?php } //endforeach; ?>
						</div>
					</div>

					<?php } ?>

				</div>
			</div>
			<?php } // endif of limit_tab ?>
			<?php } // endforeach of tabs ?>
		</div>
	</div>


	<script>
	$(function () {
		$('#tab-<?php echo str_replace(' ', '', $tab.$id);?> a:first').tab('show');
	})
	$('.tabcarousel<?php echo $id;?>').carousel({interval:false,auto:false,pause:'hover'});
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

<script type="text/javascript">
    $('#productcarousel<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
</script>
