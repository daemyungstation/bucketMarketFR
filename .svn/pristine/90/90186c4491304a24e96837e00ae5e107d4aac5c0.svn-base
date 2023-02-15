$(window).on('load',function(){

    //Checkbox & Radio
    if($('.form-checkbox').length > 0){
        checkBox_Ck();//checkbox
    }
    if($('.form-radio').length > 0){
        radioBtn_Ck();//radio
    }
    if($('.form-radio-category').length > 0){
        radioBtnCate_Ck();//radio
    }


    /* 헤더 검색 레이어 */
    $('.area-header .contain-search input[type^="text"]').click(function(){
        $('.area-header .contain-search .box-favword').css({'height':$('.area-header .box-favword .box-inner').height() + 20})
    });

    /* 헤더 검색순위 레이어 */
    $('.contain-word').on('mouseenter',function(){
        $('.contain-word').addClass('on').css({'height':$('.contain-word ul').height()})
    })
    $('.contain-word').on('mouseleave',function(){
        $('.contain-word').removeClass('on').css({'height':36})
    })

    /* GNB 레디플래너 레이어 */
    $('.area-navigation-global .contain-myinfor .box-infor').on('mouseenter',function(){
        $('.box-detail-links').css({'height':$('.box-detail-links ul').height() + 2})
    })
    $('.area-navigation-global .contain-myinfor .box-infor').on('mouseleave',function(){
        $('.box-detail-links').css({'height': 0})
    })

    /* GNB MY계약 레이어 */
    $('.area-navigation-global .contain-myinfor .box-planner').on('mouseenter',function(){
        $('.detail-planner-links').css({'height':$('.detail-planner-links ul').height() + 2})
    })
    $('.area-navigation-global .contain-myinfor .box-planner').on('mouseleave',function(){
        $('.detail-planner-links').css({'height': 0})
    })

    /* GNB 검색레이어 */
    $('.area-navigation-global .btn-searchbox').on('click',function(){
        if($('.area-navigation-global .box-search').hasClass('on') != 1){
            $('.area-navigation-global .box-search').addClass('on')
            $('.area-navigation-global .article-search').css({'height':$('.area-navigation-global .box-search .contain-inner').height() + 50})
        }else{
            $('.area-navigation-global .box-search').removeClass('on')
            $('.area-navigation-global .article-search').css({'height':0})
        }
    })

    /* 전체 카테고리 */
    $('.area-navigation-global .contain-category .btn-category').on('click',function(){
        requestCategory(this, function () {
            if($('.area-navigation-global .contain-category .btn-category').hasClass('on') != 1){
                $('.area-navigation-global .contain-category .btn-category').addClass('on')
                //$('.area-navigation-global .box-search').addClass('on')
                $('.area-category').css({'height':$('.area-category .area-inner').height() + 1})
            }else{
                $('.area-navigation-global .contain-category .btn-category').removeClass('on')
                //$('.area-navigation-global .box-search').removeClass('on')
                $('.area-category').css({'height':0})
            }
        });
    })

    $('html').on('click',function(e) {//200623 추가
        if($(e.target).parents().hasClass('contain-search')){
            //
        }else{
            $('.area-header .contain-search .box-favword').css({'height': 0})
        }
        if($(e.target).parents().hasClass('box-search')){
            //
        }else{
            $('.area-navigation-global .box-search').removeClass('on')
            $('.area-navigation-global .article-search').css({'height':0})
        }
        if($(e.target).parents().hasClass('area-category') || $(e.target).parents().hasClass('btn-category')){
            //
        }else{
            $('.area-navigation-global .contain-category .btn-category').removeClass('on')
            $('.area-category').css({'height':0})
        }
    });

    /* 탑 배너 */
    $('.area-topbanner .btn-close-banner').on('click',function(){
        $('body').removeClass('active-banner');
        $('.area-navigation-global').css({'position':'absolute','top':'224px'})
        $('.area-category').css({'height':'0','top':$('.area-navigation-global').offset().top + 50}) //0630추가
    });

    //팝업 닫기
    $('.layer-popup1 .btn-close').on('click',function(){
        closePopup1($(this));
    });
    $('.layer-popup1 .close-layer').on('click',function(){
        closePopup1($(this));
    });
    $('.layer-popup2 .close-layer').on('click',function(){
        closePopup2($(this));
    });
    $('.layer-popup2 .btn-close').on('click',function(){
        closePopup2($(this));
    });
    $('.layer-popup3 .btn-close').on('click',function(){
        closePopup3($(this));
    });
    $('.layer-popup4 .btn-close').on('click',function(){
        closePopup4($(this));
    });


    //제품상세 탭
    $('.box-tab-head button').on('click',function(){
        tabType1($(this))
    });

    //일반 탭
    $('.sub-tab-head button').on('click',function(){
        subTab($(this))
    });

    //서브 탭
    $('.box-tab-sub-head button').on('click',function(){
        tabType2($(this))
    });

    //아코디언
    $('.ui-accordion dt').on('click',function(){
        AccordionUI($(this))
    });

    //도움말 팝업
    if($('.box-help').length > 0){
        $('.btn-help button').on('click',function(){
            var thisClass = $(this).attr('class')
            var compNum = $(window).width() - $(this).offset().left
            var posX = $(this).offset().left - 3
            var posR = compNum - 20
            var posY = $(this).offset().top + 30
            $('.box-help').hide()
            if(posX < $(window).width()/2){
                $('.box-help.' + thisClass).addClass('rtl');
                $('.box-help.' + thisClass).css({
                    'display':'block',
                    'left': 'auto',
                    'right':posR,
                    'top':posY,
                });
            }else{
                $('.box-help.' + thisClass).css({
                    'display':'block',
                    'left':posX,
                    'right':'auto',
                    'top':posY,
                });
            }
            return false
        });
        $(document).on('click',function(e){
            if(e.target.className =="btn-help"){return false}
            $('.box-help').hide();
        });
    }

    //제품 인기순 등 정렬 팝업
    if($('.box-category-more').length > 0){
        categoryMore()
    }else{}

    //댓글 수정/삭제 팝업
    if($('.box-comment-more').length > 0){
        commentMore()
    }else{}

    //Audio 버튼
    $('.swiper-container .btn-audio').on('click',function(){
        if($(this).hasClass('active') != 0){
            $(this).removeClass('active');
        }else{
            $(this).addClass('active');
        }
    });



    //제품 상세이미지 - Swiper
    if($('.box-image-product1-1.swiper-container').length > 0){
        var productSwiper2 = new Swiper('.box-image-product1-2.swiper-container', {
            spaceBetween: 10,
            slidesPerView: 4,
            freeMode: true,
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
            navigation: {
                nextEl: '.wrap-image .swiper-button-next',
                prevEl: '.wrap-image .swiper-button-prev',
            },
        });
//        productSwiper2.on("slideChange", function() {
//            $(".box-image-product1-1.swiper-container").find(".lazy").Lazy({
//                effect: "fadeIn"
//            });
//        });
//        $(".box-image-product1-1.swiper-container").find(".lazy").Lazy({
//            effect: "fadeIn"
//        });

        var productSwiper1 = new Swiper('.box-image-product1-1.swiper-container', {
            spaceBetween: 10,
            thumbs: {
              swiper: productSwiper2
            }
        });
//        productSwiper1.on("slideChange", function() {
//            $(".box-image-product1-1.swiper-container").find(".lazy").Lazy({
//                effect: "fadeIn"
//            });
//        });
//        $(".box-image-product1-1.swiper-container").find(".lazy").Lazy({
//            effect: "fadeIn"
//        });

    }else{}

    //베스트 후기 - Swiper
    if($('.box-latter-best.swiper-container').length > 0){
        var letterBestSwiper = new Swiper('.box-latter-best.swiper-container', {
            centeredSlides: true,
            pagination: {
                el: '.box-latter-best .swiper-pagination',
                type: 'fraction',
            },
            navigation: {
                nextEl: '.box-latter-best .swiper-button-next',
                prevEl: '.box-latter-best .swiper-button-prev',
            },
        });
    }else{}

    //다른 고객님이 본 상품 - Swiper
    if($('.box-othercustomer.swiper-container').length > 0){
        var productSwiper2 = new Swiper('.box-othercustomer.swiper-container', {
            spaceBetween: 10,
            slidesPerView: 4,
            //loop: true,
            navigation: {
                nextEl: '.contain-product7 .swiper-button-next',
                prevEl: '.contain-product7 .swiper-button-prev',
            },
        });
    }else{}

    //최근 본 상품 - Swiper
    if($('.viewed-goods .swiper-container').length > 0){
        var productSwiper2 = new Swiper('.viewed-goods .swiper-container', {
            direction: 'vertical',
            spaceBetween: 10,
            slidesPerView: '3',
            navigation: {
                nextEl: '.viewed-goods .swiper-button-next',
                prevEl: '.viewed-goods .swiper-button-prev',
            },
        });
    }else{}

    //탑 앵커
    if($('.area-sidebar .ancher-top').length > 0){
        $('.area-sidebar .ancher-top button').on('click',function(){
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 400);
        });
    }else{}

    categoryPos()

    if($('.area-sidebar').length > 0){
        viewedGoods()
    }
    if($('.contain-order-top').length > 0){
        orderPos()
    }

    //팝업 위치
    if($('.layer-popup1, .layer-popup2, .layer-popup4').length > 0){
        posPopup()
    }else{}

    tabPosFix()

// PC 에서는 팝업이 여러개라 아래 코드 사용 하지 않음 - 김혁
//    //오늘 하루 보지않기
//    $('.layer-popup3 .btn-today-close').on('click',function(){
//        // setCookieMobile('todayCookie', 'done' , 1);
//        $('.layer-popup3').removeClass('active');
//    });
//    getCookieMobile ()

    //오늘 하루 보지않기
    $('.layer-popup3 .btn-today-close').on('click',function(){
        $(this).closest('.layer-popup3').removeClass('active');
    });

    //팝업 위치 - 0625 ready에서 load로 이동
    if($('.layer-popup1, .layer-popup2, .layer-popup4').length > 0){
        posPopup()
    }else{}



});

function setCookieMobile ( name, value, expiredays ) {//쿠키 세팅
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//PC 에서는 팝업이 여러개라 아래 코드 사용 하지 않음 - 김혁
//function getCookieMobile () {//쿠키 세팅
//    var cookiedata = document.cookie;
//    //console.log(cookiedata)
//    if ( cookiedata.indexOf('todayCookie=done') < 0 ){
//        $('.layer-popup3').addClass('active');
//    }
//    else {
//        $('.layer-popup3').removeClass('active');
//    }
//}

$(window).on('scroll',function(){

    if($('.contain-product2 .box-tab-head').length > 0){//0630 추가
        tabPos = $('.contain-product2').offset().top - 50;
    }else{}

    if($('.contain-product2 .box-tab-head').length > 0 && $(window).scrollTop() > tabPos){
        $('.box-tab-head').addClass('on');
    }else{
        $('.box-tab-head').removeClass('on');
    }
    if($('.contain-product2 .box-tab-sub-head').length > 0 && $(window).scrollTop() > tabPos){
        $('.box-tab-sub-head').addClass('on');
    }else{
        $('.box-tab-sub-head').removeClass('on');
    }

    categoryPos()
    tabPosFix()

    if($('.contain-option').length > 0){
        floatingOption()
    }

    if($('.area-sidebar').length > 0){
        floatingAside()
    }
    if($('.contain-order-top').length > 0){
        orderPos()
    }
    $('.area-navigation-global .contain-category .btn-category').removeClass('on');
    $('.area-category').stop().css({'height':'0','top':$('.area-navigation-global').offset().top + 50})
});

$(window).on('resize',function(){

    tabPosFix()

})

function tabPosFix(){//가로폭 좁아졌을때 탭 위치

    if($('.contain-product2 .box-tab-head').hasClass('on') ){
        if($(window).innerWidth() < 1280){
            $('.box-tab-head').css({
                left: 0 - $(this).scrollLeft(),
                margin: '0'
            });
        }else{
            $('.box-tab-head').css({
                left: '50%',
                margin: '0 0 0 -640px'
            });
        }
    }else{
        $('.box-tab-head').css({
            left: '0',
            margin: '0'
        });
    }

}


function viewedGoods(){//최근 본 상품 레이어
    if($('.area-sidebar .viewed-goods').length > 0){
        $('.area-sidebar .viewed-goods .swiper-slide').on('mouseenter',function(){
            $(this).find('.viewed-detail').css({
                'width' : 200
            })
            $('.area-sidebar .viewed-goods .swiper-container').css({
                'width' : 200,
                'marginLeft' : -114
            })
        })
        $('.area-sidebar .viewed-goods .swiper-slide').on('mouseleave',function(){
            $(this).find('.viewed-detail').css({
                'width' : 0
            })
            $('.area-sidebar .viewed-goods .swiper-container').css({
                'width' : 86,
                'marginLeft' : 0
            })
        })
    }

}

function orderPos(){//계약사항 고정
    if($(window).scrollTop() > 274){
        $('.contain-order-top').css({'position':'fixed','top':'50px'})
    }else{
        $('.contain-order-top').css({'position':'absolute','top':'0'})
    }
}

function categoryPos(){//카테고리 고정 //200622 수정 6030수정
    if($('body').hasClass('active-banner') != 0){
        if($(window).scrollTop() > 304){
            $('.area-navigation-global').css({'position':'fixed','top':'0'})
            $('.box-search').addClass('active')
        }else{
            $('.area-navigation-global').css({'position':'','top':''})
            $('.box-search').removeClass('active')
        }
    }else{
        if($(window).scrollTop() > 224){
            $('.area-navigation-global').css({'position':'fixed','top':'0'})
            $('.box-search').addClass('active')
        }else{
            $('.area-navigation-global').css({'position':'','top':''})
            $('.box-search').removeClass('active')
        }
    }
}

function floatingOption(){//상세 고정 0630수정

    if($('.contain-product2 .box-tab-head').length > 0){//0630 추가
        tabPos = $('.contain-product2').offset().top - 60;
    }else{}

    if($(window).innerWidth() < 1280){
        if($(window).scrollTop() + 10 > tabPos){
            $('.contain-option').css({
                left: 0-$(this).scrollLeft(),
                margin: '0 0 0 960px'
            });
        }else{
            $('.contain-option').css({
                left: '50%',
                margin: '0 0 0 495px'
            });
        }
        if($(window).scrollTop() + 10 > tabPos){
            $('.contain-option').addClass('on');
        }else{
            $('.contain-option').removeClass('on');
        }
    }else{
        $('.contain-option').css({
            left: '',
            margin: ''
        });
        if($(window).scrollTop() + 10 > tabPos){
            $('.contain-option').addClass('on');
        }else{
            $('.contain-option').removeClass('on');
        }
    }

}

function floatingAside(){//최근 본 상품 플로팅 수정 6029수정 0630수정
    if($(window).scrollTop() + 60 > 383){
        $('.area-sidebar').addClass('on')
    }else{
        $('.area-sidebar').removeClass('on')
    }
}

function checkBox_Ck(){//체크박스
    var objCheckbox = $('.form-checkbox');
    objCheckbox.each(function(){
        if($(this).find('input[type=checkbox]').is(':checked')){
            $(this).addClass('checked')
        }
    });
    objCheckbox.on('click', function(){
        if($(this).find('input[type=checkbox]').is(':checked')){
            $(this).addClass('checked');
            $(this).find('input[type=checkbox]').attr('checked',true);
        }else{
            $(this).removeClass('checked');
            $(this).find('input[type=checkbox]').attr('checked',false);
        }
    });
}

function radioBtn_Ck(){//라디오
    $('.form-radio').on('click',function(){
        sameName = $(this).find('input').attr('name');
        $('input:radio[name="' + sameName + '"]').parent().removeClass('checked')
        $('input:radio[name="' + sameName + '"]').attr('checked', false)
        $(this).addClass('checked');
        $(this).find('input').attr('checked', true)
    });
}

function radioBtnCate_Ck(){//라디오-카테고리
    $('.form-radio-category').on('click',function(){
        sameName = $(this).find('input').attr('name');
        $('input:radio[name="' + sameName + '"]').parent().removeClass('checked')
        $('input:radio[name="' + sameName + '"]').attr('checked', false)
        $(this).addClass('checked');
        $(this).find('input').attr('checked', true)
    });
}

function tabType1(tabTag1){//탭
    var tabNum1 = tabTag1.parent().index() + 1 ;
    $('.box-tab-head button').parent().removeClass('on');
    tabTag1.parent().addClass('on');
    tabTag1.closest('.box-tab-head').siblings('.box-tab-body').removeClass('on')
    tabTag1.closest('.box-tab-head').siblings('.box-tab-body.tab' + tabNum1).addClass('on')
    $('html, body').animate({scrollTop: tabPos}, 500);
}

function subTab(tabTag3){//탭
    var tabNum3 = tabTag3.parent().index() + 1 ;
    $('.sub-tab-head button').parent().removeClass('on');
    tabTag3.parent().addClass('on');
    tabTag3.closest('.sub-tab-head').siblings('.box-tab-body').removeClass('on')
    tabTag3.closest('.sub-tab-head').siblings('.box-tab-body.tab' + tabNum3).addClass('on')
}

function tabType2(tabTag2){//서브 탭
    var tabNum2 = tabTag2.parent().index() + 1 ;
    $('.box-tab-sub-head button').parent().removeClass('on');
    tabTag2.parent().addClass('on');
    tabTag2.closest('.box-tab-sub-head').siblings('.box-tab-sub-body').removeClass('on')
    tabTag2.closest('.box-tab-sub-head').siblings('.box-tab-sub-body.subtab' + tabNum2).addClass('on')
    $('html, body').animate({scrollTop: tabPos}, 500);
}

function AccordionUI(curruntTag){//아코디언 UI
    vHeight = curruntTag.siblings('dd').find('>div').height() + 45
    if(curruntTag.parent().hasClass('on') == 0){
        $('.ui-accordion dl').removeClass('on');
        $('.ui-accordion dd').css({'height':'0'})
        curruntTag.parent().addClass('on');
        curruntTag.siblings('dd').css({'height':vHeight})
    }else{
        curruntTag.parent().removeClass('on');
        curruntTag.siblings('dd').css({'height':'0'})
    }
}

//제품 인기순 등 정렬 팝업
function categoryMore(){
    $('.box-category-more > button').on("click", function () {
        $('.box-category-inner').toggleClass('active');
    });
}

//댓글 수정/삭제 팝업
function commentMore(){
    $('.box-comment-more > button').each(function(i){
        $(this).off("click").on("click", function(e){
            e.preventDefault();
            $(".box-comment-inner").eq(i).toggleClass("active");
        });
    });
}

//팝업 위치
function posPopup(){
    $('.layer-popup1, .layer-popup2, .layer-popup4').each(function(){
        var winHeight = $(window).height() / 2
        var popPopY = winHeight - 30 - $(this).find('.layer-inner').innerHeight() / 2
        $(this).find('.layer-inner').css({'top':popPopY});
    });
}

function closePopup1(popup1){//팝업 닫기
    popup1.closest('.layer-popup1').removeClass('active');
    /* scrollAble() */
}

function closePopup2(popup2){//팝업 닫기
    popup2.closest('.layer-popup2').removeClass('active');
    /* scrollAble() */
}
function closePopup3(popup3){//팝업 닫기
    popup3.closest('.layer-popup3').removeClass('active');
    /* scrollAble() */
}
function closePopup4(popup4){//팝업 닫기
    popup4.closest('.layer-popup4').removeClass('active');
    /* scrollAble() */
}

function requestCategory (obj, callback) { // 카테고리 호출
    var isRequest = false;
    var $this = $(obj);
    if ($this.find(".button-category").length > 0 && !$this.hasClass("on")) {
        isRequest = true;
    }
    if (isRequest) {
        $.requestCategory(function () {
            callback.call(obj);
        });
    } else {
        callback.call(obj);
    }
}
