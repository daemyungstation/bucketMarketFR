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

    //사이드 바
    $('.area-header .btn-navigation button').on('click',function(){
        addActiveSiderBarClass(this);
    });
    $('.area-aside.bottom .btn-tabbar1 button').on('click',function(){
        addActiveSiderBarClass(this);
    });
    $('.btn-sidebar-close button').on('click',function(){
        $('body').removeClass('active-sidebar');
    });

    //일반 탭
    $('.box-tab-head button').on('click',function(){
        tabType1($(this))
    });

    //서브 탭
    $('.box-tab-sub-head button').on('click',function(){
        tabType2($(this))
    });

    //헤더 카테고리 레이어
    $('.area-header .title button').on('click',function(){
        categoryArea($(this))
    });

    //아코디언
    $('.ui-accordion dt').on('click',function(){
        AccordionUI($(this))
    });

    //상품상세보기
    $('.product-moreview button').on('click',function(){
        if($('.product-moreview').hasClass('on') != 1){
            $('.product-moreview button').parent().addClass('on')
            $(this).closest('.contain-product2').height('auto');
        }else{
            $('.product-moreview button').parent().removeClass('on')
            $(this).closest('.contain-product2').height('500');
        }
    });

    //Top 버튼
    $('.area-floating .btn-topancher').on('click', function(){
        event.preventDefault();
        $('html, body').animate({scrollTop:0}, 400);
    })
    //도움말 팝업
    if($('.box-help').length > 0){
        $('.btn-help button').on('click',function(){
            var thisClass = $(this).attr('class')
            var compNum = $(window).width() - $(this).offset().left
            var posX = $(this).offset().left - 7
            var posR = compNum - 20
            var posY = $(this).offset().top + 22
            $('.box-help').hide()
            if(posX > $(window).width()/2){
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

    //팝업 위치
    if($('.layer-popup2').length > 0){
        posPopup()
    }else{}

    //팝업 닫기
    $('.layer-popup1 .btn-close').on('click',function(){
        closePopup1($(this));
    });
    $('.layer-popup2 .btn-close').on('click',function(){
        closePopup2($(this));
    });
    $('.layer-popup4 .btn-close').on('click',function(){
        closePopup4($(this));
    });
    $('.layer-popup5 .btn-close').on('click',function(){
        closePopup5($(this));
    });

    //SNS 공유
    $('.btn-share button').on('click',function(){
        $('.layer-popup2.infor1').addClass('active');
        posPopup()
        scrollDisable()
    })

    //제품 인기순 등 정렬 팝업
    if($('.box-category-more').length > 0){
        categoryMore()
    }else{}

    //메인 인기순 등 정렬 팝업
    if($('.main-category-more').length > 0){
        MainCategoryMore()
    }else{}

    //댓글 수정/삭제 팝업
    if($('.box-comment-more').length > 0){
        commentMore()
    }else{}

    //Audio 버튼
    $('.swiper-container .btn-audio').on('click',function(){
        if($(this).hasClass('active') != 0){
            $(this).removeClass('active');
            document.getElementById("audio_div").pause();
        }else{
            $(this).addClass('active');
            document.getElementById("audio_div").play();
        }
    });

    //오늘 하루 보지않기
    $('.btn-today-close').on('click',function(){
        setCookieMobile('todayCookie', 'done' , 1);
        $('.layer-popup2.layer-banner').removeClass('active');
    });

    getCookieMobile ()
    //topAncher()//200618추가

});

var nowScrollTop = $(window).scrollTop();
function topAncher(){//200618추가
    //if($(window).scrollTop() > 10){
        var oldScrollTop = $(window).scrollTop();
        if(oldScrollTop < nowScrollTop){
            $('.area-floating .btn-topancher').css({'display':'block'})
        }else{
            $('.area-floating .btn-topancher').css({'display':'none'})
        }
        nowScrollTop = $(window).scrollTop();
    //}else{
        //$('.area-floating .btn-topancher').hide()
    //}
    
}


function setCookieMobile ( name, value, expiredays ) {//쿠키 세팅
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
function getCookieMobile () {//쿠키 세팅
    var cookiedata = document.cookie;
    //console.log(cookiedata)
    if ( cookiedata.indexOf('todayCookie=done') < 0 ){
        $('.layer-popup2.layer-banner').addClass('active');
    }
    else {
        $('.layer-popup2.layer-banner').removeClass('active');
    }
}



var curentScrollTop = 0;
$(window).on('scroll',function(event){
    scrollAction()
    topAncher() //200618추가

    if($('.area-header .title button').length > 0){
        $('.area-header .title button').removeClass('on')
        $('.area-category').removeClass('on');
        $('.area-category').css({'height':0})
    }

});

$(window).on('resize',function(event){

})



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

function scrollAction(){//스크롤 시 헤더 가리기
    if($(window).scrollTop() < 0 || $(window).scrollTop() < curentScrollTop || $(window).scrollTop() == $(document).innerHeight() - $(window).height()){
        $('body').removeClass('active');
        curentScrollTop = $(window).scrollTop();
        $('.area-category').css({'top':51})

    }else{
        if($(window).scrollTop() != 0){
            $('.area-category').css({'top':0})
            $('body').addClass('active');
        }else{
            $('body').removeClass('active');
        }
        curentScrollTop = $(window).scrollTop();
    }
/*
    if($('.banner-main-top').length > 0 && $('.banner-main-top').height() > 0){
        $('.area-header').css({'top':$('.banner-main-top img').height()})
        $('.banner-main-top').css({'height':$('.banner-main-top img').height()})
    }else{
        $('.area-header').css({'top':0})
    }
*/


}

function categoryArea(actBtn){//카테고리 서브 레이어
    if($('.area-category').hasClass('on') != 1){
        actBtn.addClass('on')
        $('.area-category').addClass('on');
        //$('.area-category').css({'height':$('.area-category .area-inner').height() + 41})
        $('.area-category').css({'height':$(window).innerHeight()})//200619변경
    }else{
        actBtn.removeClass('on')
        $('.area-category').removeClass('on');
        $('.area-category').css({'height':0})
    }
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

function tabType1(tabTag1){//탭
    var tabNum1 = tabTag1.parent().index() + 1 ;
    $('.box-tab-head button').parent().removeClass('on');
    tabTag1.parent().addClass('on');
    tabTag1.closest('.box-tab-head').siblings('.box-tab-body').removeClass('on')
    tabTag1.closest('.box-tab-head').siblings('.box-tab-body.tab' + tabNum1).addClass('on')
    $('html, body').animate({scrollTop: $('.contain-product2').offset().top}, 500);//0805 추가
    /* 200619 변경 */
    if(tabTag1.closest('.area-content-layer').attr('class') == 'area-content-layer'){
        //
    }else{
        //$('html, body').animate({scrollTop: tabTag1.offset().top}, 500);//0805 수정
    }

}

function tabType2(tabTag2){//서브 탭
    var tabNum2 = tabTag2.parent().index() + 1 ;
    $('.box-tab-sub-head button').parent().removeClass('on');
    tabTag2.parent().addClass('on');
    tabTag2.closest('.box-tab-sub-head').siblings('.box-tab-sub-body').removeClass('on')
    tabTag2.closest('.box-tab-sub-head').siblings('.box-tab-sub-body.subtab' + tabNum2).addClass('on')
    //$('html, body').animate({scrollTop: tabTag2.offset().top - 56}, 500);
    $('html, body').animate({scrollTop: $('.contain-product2').offset().top}, 500);//0805 추가
}


//팝업 위치
function posPopup(){
    $('.layer-popup2').each(function(){
        var winHeight = $(window).height() / 2
        var popPopY = winHeight - 30 - $(this).find('.layer-inner').height() / 2
        $(this).find('.layer-inner').css({'top':popPopY});
    });
}
//팝업 위치
function posPopup2(layerClassname, layerInnerClassname){
    $(layerClassname).each(function(){
        var winHeight = $(window).height() / 2
        var popPopY = winHeight - 30 - $(this).find(layerInnerClassname).height() / 2
        if( popPopY < 0 ) {
            popPopY = 0;
        }
        $(this).find(layerInnerClassname).css({'top':popPopY});
    });
}

//제품 인기순 등 정렬 팝업
function categoryMore(){
    $('.box-category-more > button').on("click", function () {
        $('.box-category-inner').toggleClass('active');
    });
}

//메인 인기순 등 정렬 팝업
function MainCategoryMore(){
    $('.main-category-more > button').on("click", function () {
        $('.main-category-inner').toggleClass('active');
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

function closePopup1(popup1){//팝업 닫기
    popup1.closest('.layer-popup1').removeClass('active');
    scrollAble()
}

function closePopup2(popup2){//팝업 닫기
    popup2.closest('.layer-popup2').removeClass('active');
    scrollAble()
}

function closePopup4(popup4){//팝업 닫기
    popup4.closest('.layer-popup4').removeClass('active');
    scrollAble()
}
function closePopup5(popup5){//팝업 닫기
    popup5.closest('.layer-popup5').removeClass('active');
    scrollAble()
}


function scrollDisable(){//본문 스크롤 막기
    $('body').addClass('scrollDisable').on('scroll touchmove mousewheel', function(e){
        e.preventDefault();
    });
}
function scrollAble(){//본문 스크롤 풀기
    $('body').removeClass('scrollDisable').off('scroll touchmove mousewheel');
}

function addActiveSiderBarClass(obj){// 사이드 바 클래스 body 추가
    if ($(obj).hasClass('navi-button')) {
        $.requestCategory(function () {
            $('body').addClass('active-sidebar');
        });
    } else {
        $('body').addClass('active-sidebar');
    }
}