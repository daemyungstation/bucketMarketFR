$(window).on('load',function(){
    $('.contain-main4 .contain-item').css({'height':$('.contain-main4 .detail-product-type1').height() * 2 + 40});
    //$('.contain-main6 .contain-item.swiper-container').css({'height':$('.contain-main6 .detail-product-type1').height() + 20});

    if($('.banner-main-top').length > 0){
        $('body').addClass('banner-main');
    }else{

    }
    $('.banner-main-top .btn-close').on('click',function(){
        $('body').removeClass('banner-main');
        $('.banner-main-top').css({'height':0})
    });

})
$(window).resize(function(){
    $('.contain-main4 .contain-item').css({'height':$('.contain-main4 .detail-product-type1').height() * 2 + 40});
    //$('.contain-main6 .contain-item.swiper-container').css({'height':$('.contain-main6 .detail-product-type1').height() + 20});
});

//스와이프 탭 - Swiper
if($('div[class^="box-tab-"].swiper-container').length > 0){
    var tebSwiper = new Swiper('div[class^="box-tab-"].swiper-container', {
        slidesPerView: 'auto',
        spaceBetween: 0,
        freeMode: true,
    });
}else{}

//제품 상세이미지 - Swiper
if($('.box-image-product1.swiper-container').length > 0){
    var productSwiper = new Swiper('.box-image-product1.swiper-container', {
        pagination: {
            el: '.box-image-product1 .swiper-pagination',
            type: 'fraction',
        }
    });
    productSwiper.on("slideChange", function() {
        // 이미지 로딩
        $(".box-image-product1.swiper-container").find(".lazy").Lazy({
            effect: "fadeIn"
        });
    });
    // 이미지 로딩
    $(".box-image-product1.swiper-container").find(".lazy").Lazy({
        effect: "fadeIn"
    });
}else{}

//베스트 후기 - Swiper
if($('.box-latter-best.swiper-container').length > 0){
    var letterBestSwiper = new Swiper('.box-latter-best.swiper-container', {
        centeredSlides: true,
        pagination: {
            el: '.box-latter-best .swiper-pagination',
            type: 'fraction',
        }
    });
}else{}

//다른고객이 본 상품 - Swiper
if($('.box-othercustomer.swiper-container').length > 0){
    var othderCustomerSwiper = new Swiper('.box-othercustomer.swiper-container', {
        slidesPerView: 2,
        spaceBetween: 15,
        navigation: {
            nextEl: '.box-othercustomer.swiper-container .swiper-button-next',
            prevEl: '.box-othercustomer.swiper-container .swiper-button-prev',
        },
    });
}else{}

//전시매장 팝업존 - Swiper
if($('.box-popup-store.swiper-container').length > 0){
    var storeSwiper = new Swiper('.box-popup-store.swiper-container', {
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        }
    });
}else{}

//전시매장 팝업존 - 재생/중지
$('.btn-play').on('click', function(){
    $(this).siblings().removeClass('on');
    $(this).addClass('on');
    storeSwiper.autoplay.start();
    return false;
});
$('.btn-stop').on('click', function(){
    $(this).siblings().removeClass('on');
    $(this).addClass('on');
    storeSwiper.autoplay.stop();
    return false;
});

//전시매장 카테고리 - Swiper
if($('.box-store-category.swiper-container').length > 0){
    var tebSwiper = new Swiper('.box-store-category.swiper-container', {
        slidesPerView: 'auto',
        spaceBetween: 0,
        freeMode: true,
    });
}else{}


//메인 버킷마켓 - Swiper
if($('.bukkitmarket.swiper-container').length > 0){
    var othderCustomerSwiper = new Swiper('.bukkitmarket.swiper-container', {
        autoplay: {
            delay: 4000,
        },
        speed: 500,
        spaceBetween: 20,
        pagination: {
            el: '.bukkitmarket .swiper-pagination',
            clickable: true,
        }
    });
    othderCustomerSwiper.on("slideChange", function() {
        // 이미지 로딩
        $(".bukkitmarket.swiper-container").find(".lazy").Lazy({
            effect: "fadeIn"
        });
    });
}else{}

//메인 레디플래너 - Swiper
if($('.readyplaner.swiper-container').length > 0){
    var othderCustomerSwiper = new Swiper('.readyplaner.swiper-container', {
        autoplay: {
            delay: 4000,
        },
        speed: 500,
        spaceBetween: 20,
        pagination: {
            el: '.readyplaner .swiper-pagination',
            clickable: true,
        }
    });
}else{}

//메인 배너1 - Swiper
if($('.banner1.swiper-container').length > 0){
    var othderCustomerSwiper = new Swiper('.banner1.swiper-container', {
        spaceBetween: 20,
        pagination: {
            el: '.banner1 .swiper-pagination',
            clickable: true,
        }
    });
    othderCustomerSwiper.on("slideChange", function() {
        // 이미지 로딩
        $(".banner1.swiper-container").find(".lazy").Lazy({
            effect: "fadeIn"
        });
    });
}else{}

//메인 배너2 - Swiper
if($('.banner2.swiper-container').length > 0){
    var othderCustomerSwiper = new Swiper('.banner2.swiper-container', {
        spaceBetween: 20,
        pagination: {
            el: '.banner2 .swiper-pagination',
            clickable: true,
        }
    });
    othderCustomerSwiper.on("slideChange", function() {
        // 이미지 로딩
        $(".banner2.swiper-container").find(".lazy").Lazy({
            effect: "fadeIn"
        });
    });
}else{}

//메인 베스트 상품 - Swiper
if($('.contain-main4 > .contain-item.swiper-container').length > 0){
    var othderCustomerSwiper = new Swiper('.contain-main4 > .contain-item.swiper-container', {
        slidesPerView: 2,
        slidesPerColumn: 2,
        slidesPerGroup:2,
        spaceBetween: 4,
        //autoHeight: true,
        pagination: {
            el: '.contain-main4 .swiper-pagination',
            //clickable: true,
        },
        navigation: {
            nextEl: '.contain-main4 .swiper-button-next',
            prevEl: '.contain-main4 .swiper-button-prev',
        },
    });
    othderCustomerSwiper.on("slideChange", function() {
        // 이미지 로딩
        $(".contain-main4 > .contain-item.swiper-container").find(".lazy").Lazy({
            effect: "fadeIn"
        });
    });
}else{}

//오늘의 버킷 리스트 - Swiper

if($('.contain-main6 .swiper-container').length > 0){
    var othderCustomerSwiper = new Swiper('.contain-main6 .swiper-container', {
        slidesPerView: 2,
        spaceBetween: 4,
        autoHeight: true,
        navigation: {
            nextEl: '.contain-main6 .swiper-button-next',
            prevEl: '.contain-main6 .swiper-button-prev',
        },
    });
}else{}



