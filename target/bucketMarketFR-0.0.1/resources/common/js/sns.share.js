function SnsShare (data) {
    var resources = data.resources;
    this.share = function (type) {
        switch (type) {
            case "sns-kakaotalk" :
                shareKaKaotalk();
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
        Kakao.Link.sendDefault({
            objectType : "feed",
            installTalk : true,
            content : {
                title : resources.title,
                description : resources.description,
                imageUrl : resources.image,
                link : {
                    mobileWebUrl: resources.url,
                    webUrl : resources.url
                }
            },
            buttons : [{
                title : resources.site_name,
                link : {
                    mobileWebUrl : resources.url,
                    webUrl : resources.url
                }
            }],
            success : function() {
                console.log("success");
            },
            fail: function(error){
                console.log("fail", error);
            }
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