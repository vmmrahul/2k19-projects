$(function() {
    'use strict'; // Start of use strict
   
   

    /*--------------------------
    scrollUp
    ---------------------------- */
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
	});
	/*--------------------------
    magnificPopup
    ---------------------------- */
	if ($('.projects-popup-link').length) {
        $('.projects-popup-link').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            },
        });
	}
	 // isotop
    // init Isotope
    var $grid = $('.custom-row').isotope({
        itemSelector: '.grid-item',
        percentPosition: true,
        masonry: {
            // use outer width of grid-sizer for columnWidth
            columnWidth: 1,
        }
    });
	/*--------------------------
    LightBox
    ---------------------------- */
	if($('.lightbox-image').length) {
		$('.lightbox-image').fancybox({
			openEffect  : 'fade',
			closeEffect : 'fade',
			helpers : {
				media : {}
			}
		});
	}

	/*--------------------------
    Header Sticky
    ---------------------------- */
	$(window).on('scroll', function() {
		if ($(this).scrollTop() >150){  
			$('.main-nav').addClass("is-sticky");
		}
		else{
			$('.main-nav').removeClass("is-sticky");
		}
	});

	/*--------------------------
      FAQ Accordion
    ---------------------------- */	
	$('.accordion').find('.accordion-title').on('click', function(){
		// Adds Active Class
		$(this).toggleClass('active');
		// Expand or Collapse This Panel
		$(this).next().slideToggle('fast');
		// Hide The Other Panels
		$('.accordion-content').not($(this).next()).slideUp('fast');
		// Removes Active Class From Other Titles
		$('.accordion-title').not($(this)).removeClass('active');		
	});

	/*--------------------------
      Testimonials
    ---------------------------- */	

	$('.slider-for').slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: false,
			draggable: false,
			fade: true,
			autoplay: true,
			autoplaySpeed:1500,
			asNavFor: '.slider-nav'
		});
		
		$('.slider-nav').slick({
			slidesToShow: 3,
			slidesToScroll: 1,
			asNavFor: '.slider-for',
			dots:false,
			arrows: true,
			centerMode: true,
			autoplay: true,
			focusOnSelect: true,
			centerPadding: '10px',
			responsive: [
				{
				  breakpoint: 450,
				  settings: {
					dots: false,
					slidesToShow: 3,  
					centerPadding: '0px',
					}
				},
				{
				  breakpoint: 420,
				  settings: {
					autoplay: true,
					dots: false,
					slidesToShow: 1,
					centerMode: false,
					}
				}
			]
		});
	/*--------------------------
      Blog
	---------------------------- */		
	
var myCarousel = $('.blog-carousel');
var nextBtn = $('.btn-block .next-btn');
var prevBtn = $('.btn-block .prev-btn');

myCarousel.owlCarousel({
    loop: true,
    items: 1,
    margin: 0,
    dots: false,
    rtl: true,

    nav: true,
    navText: [
            '<p>Prev</p>',
            '<p>Next</p>'
    ],

    active: true,
    smartSpeed: 1000,
    autoplay: false,      
  onInitialize: callThumbOnNav,
  onTranslate: callThumbOnNav
});

nextBtn.on('click', function(e) {
    myCarousel.trigger('next.owl.carousel');
    e.preventDefault();
});
prevBtn.on('click', function(e) {
    myCarousel.trigger('prev.owl.carousel');
    e.preventDefault();
});

function callThumbOnNav(e){
  var idx = e.item.index;
    var nxtThumb = myCarousel.find('.single-blog-post-style4').eq(idx + 1).find('img').attr('src');
    var prvThumb = myCarousel.find('.single-blog-post-style4').eq(idx - 1).find('img').attr('src');
    prevBtn.css('background-image', 'url(' + prvThumb + ')');
    nextBtn.css('background-image', 'url(' + nxtThumb + ')');
}

	
	/*------------------------------------------------------------------
        Year
    ------------------------------------------------------------------*/
	$(function(){
    var theYear = new Date().getFullYear();
    $('#year').html(theYear);
    });
    
     // Mean Menu
	jQuery('.mean-menu').meanmenu({
		meanScreenWidth: "991"
	});

    //Main Slider Carousel
	if ($('.main-slider-carousel').length) {
		$('.main-slider-carousel').owlCarousel({
			animateOut: 'fadeOut',
    		animateIn: 'fadeIn',
			loop:true,
			margin:0,
			nav:true,
			autoHeight: true,
			smartSpeed: 1000,
			autoplay: 3000,
			navText: [ '<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>' ],
			responsive:{
				0:{
					items:1
				},
				600:{
					items:1
				},
				800:{
					items:1
				},
				1024:{
					items:1
				},
				1200:{
					items:1
				}
			}
		});    		
	}

	/*------------------------------------------------------------------
       Search Box JS
    ------------------------------------------------------------------*/
    $('.search-toggle').addClass('closed');
    $('.search-toggle .search-icon').on('click', function(e) {
        if ($('.search-toggle').hasClass('closed')) {
        $('.search-toggle').removeClass('closed').addClass('opened');
        $('.search-toggle, .search-area').addClass('opened');
        $('#search-terms').focus();
        } else {
        $('.search-toggle').removeClass('opened').addClass('closed');
        $('.search-toggle, .search-area').removeClass('opened');
        }
    });
    

});


/*------------------------------------------------------------------
 Loader 
------------------------------------------------------------------*/
jQuery(window).on('load',function(){
    jQuery(".loader").fadeOut(500);
});
