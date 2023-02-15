function SnsShare (data) {
    var resources = data.resources;
    this.share = function (type) {
        switch (type) {
            case "sns-kakaotalk" :
                shareKaKaotalk();
                break;
            case "sns-kakaotalk-product" :
                shareKaKaotalkProduct();
                break;
            case "sns-kakaotalk-product-mo" :
                shareKaKaotalkProductMo();
                break;
            case "sns-kakaostory" :
                shareKaKaostory();
                break;
            case "sns-twitter" :
                shareTwitter();
                break;
            case "sns-blog" :
                shareNaberBlog();
                break;
            case "sns-facebook" :
                shareFacebook();
                break;
            default : new Error("Not Found Sns Type.")
                break;
        }
    };
    $.each(resources, function (key, value) {
        console.log(key + ":" + value);
    });
    var url = encodeURIComponent(resources.url),
        text = encodeURIComponent("[" + resources.site_name + "] " + resources.title + " " + resources.description);
    function shareKaKaotalk() {
        Kakao.Link.sendCustom({
            templateId: 56776,
            templateArgs : {
                SUBJECT : resources.title,
                DESC : resources.description,
                THU : resources.image,
                BUTTON: resources.site_name,
                WLINK : resources.url.replace("https://me2.do", ""),
                MLINK : resources.url.replace("https://me2.do", "")
            },
        });
    }
    function shareKaKaotalkProduct() {
        Kakao.Link.sendCustom({
            templateId: 62362,
            templateArgs : {
                SUBJECT : resources.title,
                DESC : resources.description,
                THU : resources.image,
                BUTTON: resources.site_name,
                WLINK : resources.url.replace("https://www.bucketmarket.co.kr/", ""),
                MLINK : resources.url.replace("https://www.bucketmarket.co.kr/", "")
            },
        });
    }
    function shareKaKaotalkProductMo() {
        Kakao.Link.sendCustom({
            templateId: 62365,
            templateArgs : {
                SUBJECT : resources.title,
                DESC : resources.description,
                THU : resources.image,
                BUTTON: resources.site_name,
                WLINK : resources.url.replace("https://m.bucketmarket.co.kr/", ""),
                MLINK : resources.url.replace("https://m.bucketmarket.co.kr/", "")
            },
        });
    }
    function shareKaKaostory() {
        if ($.resources.isPc) {
            Kakao.Story.share({
                url : resources.url,
                text : "[" + resources.site_name + "] " + resources.title + " " + resources.description
            });
        } else {
            Kakao.Story.open({
                url : resources.url,
                install : true,
                text : "[" + resources.site_name + "] " + resources.title + " " + resources.description,
                urlInfo : {
                    title : resources.title,
                    desc : resources.description,
                    name : resources.site_name,
                    images : [resources.image]
                }
            });
        }
    }
    function shareTwitter() {
        $.requestLink("https://twitter.com/intent/tweet?text="+ text + "&url=" + url, "W");
    }
    function shareFacebook() {
        $.requestLink("http://www.facebook.com/sharer.php?u=" + url, "W");
    }
    function shareNaberBlog() {
        $.requestLink("https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + text, "W");
    }
}