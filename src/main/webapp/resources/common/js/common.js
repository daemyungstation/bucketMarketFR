/**
 * Debug Log
 */
if (!window.console) {
    var Console = function() {
        return {
            log : function(message) {
            },
            info : function(message) {
            },
            warn : function(message) {
            },
            error : function(message) {
            }
        };
    };
    console = Console();
}

/**
 * <pre>
 * 1. FuntionName : DateUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 날짜 관련 Class
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 23.
 * </pre>
 */
var DateUtil = {
    /**
     * <pre>
     * 1. FuntionName : fnDateReset
     * 2. ClassName  : common.js
     * 3. Comment    : 날짜 셋팅 - 초기화
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param v_start_name
     * @param v_end_name
     * @returns
     */
    fnDateReset : function(v_start_name, v_end_name) {
        document.getElementById(v_start_name).value = "";
        document.getElementById(v_end_name).value = "";
    },
    /**
     * <pre>
     * 1. FuntionName : fnDateSet
     * 2. ClassName  : common.js
     * 3. Comment    : 날짜 셋팅 - 오늘, 일주일, 15일, 한달, 두달
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param v_start_name
     * @param v_end_name
     * @param s_year
     * @param s_month
     * @param s_day
     * @param e_year
     * @param e_month
     * @param e_day
     * @param seperator
     * @returns
     */
    fnDateSet : function(v_start_name, v_end_name, s_year, s_month, s_day, e_year, e_month, e_day, seperator) {
        document.getElementById(v_start_name).value = getCalculatedDate(s_year, s_month, s_day, seperator);
        document.getElementById(v_end_name).value = getCalculatedDate(e_year, e_month, e_day, seperator)
        function getCalculatedDate(iYear, iMonth, iDay, seperator) {
            // 현재 날짜 객체를 얻어옴.
            var gdCurDate = new Date();

            // 현재 날짜에 날짜 게산.
            gdCurDate.setYear(gdCurDate.getFullYear() + iYear);
            gdCurDate.setMonth(gdCurDate.getMonth() + iMonth);
            gdCurDate.setDate(gdCurDate.getDate() + iDay);

            // 실제 사용할 연, 월, 일 변수 받기.
            var giYear = gdCurDate.getFullYear();
            var giMonth = gdCurDate.getMonth() + 1;
            var giDay = gdCurDate.getDate();

            // 월, 일의 자릿수를 2자리로 맞춘다.
            giMonth = "0" + giMonth;
            giMonth = giMonth.substring(giMonth.length - 2, giMonth.length);
            giDay = "0" + giDay;
            giDay = giDay.substring(giDay.length - 2, giDay.length);

            // display 형태 맞추기.
            return giYear + seperator + giMonth + seperator + giDay;
        }
    }
};
/**
 * <pre>
 * 1. FuntionName : TagUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 태그 관련 Class
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 23.
 * </pre>
 */
var TagUtil = {
    /**
     * <pre>
     * 1. FuntionName : createDynamicForm
     * 2. ClassName  : common.js
     * 3. Comment    : FORM 태그 동적 생성 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param id
     * @param action
     * @param method
     * @param target
     * @returns
     */
    createDynamicForm : function(id, action, method, target) {
        var $frm = $("<form></form>");
        $frm.attr({
            "id" : id,
            "action" : action,
            "method" : typeof(method) != "undefined" ? method : "POST",
            "target" : typeof(target) != "undefined" ? target : "_self"
        });
        return $frm;
    },
    /**
     * <pre>
     * 1. FuntionName : createDynamicInput
     * 2. ClassName  : common.js
     * 3. Comment    : INPUT 태그 동적 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param type
     * @param name
     * @param value
     * @returns
     */
    createDynamicInput : function(type, name, value) {
        var $input = $("<input/>");
        $input.attr({
            "type" : type,
            "name" : name,
            "value" : value
        });
        return $input;
    },
    /**
     * <pre>
     * 1. FuntionName : createDynamicCategory
     * 2. ClassName  : common.js
     * 3. Comment    : 카테고리 태그 동적 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param idx
     * @param name
     * @returns
     */
    createDynamicCategory : function(idx, name, level) {
        var contents = "";
        contents += "<a href=\"javascript:$.requestPage($.action.product.basic.list(), {PRD_CTG_IDX : '" + idx + "'});\">";
        contents += name;
        contents += "</a>";
        var html = "";
        if ($.resources.isPc) {
            if (level == 0) {
                html += "<dl category-key=\"" + idx + "\">";
                html += "<dt>";
                html += contents;
                html += "</dt>";
                html += "</dl>";
            } else {
                html += "<dd>";
                html += contents;
                html += "</dd>";
            }
        } else {
            var clazz = "link" + idx;
            html += "<span class=\"" + clazz + "\">";
            html += contents;
            html += "</span>";
        }
        return html;
    },
    /**
     * <pre>
     * 1. FuntionName : formClear
     * 2. ClassName  : common.js
     * 3. Comment    : FORM 태그 초기화
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param formId
     */
    formClear : function(formId) {
        var $form = $("#" + formId);
        $form.find("input[type=text]").val("");
        $.each($form.find("input[type=hidden]"), function (idx, item) {
            var isFormClear = $(item).data("is_form_clear");
            if (typeof(isFormClear) != "undefined" && isFormClear) {
                $(item).val("");
            }
        });
        $form.find("select").find("option:eq(0)").prop("selected", true);
        $form.find(":checkbox").prop("checked", false);
        var tmpRadioNm = "";
        $.each($form.find(":radio"), function(idx, item) {
            if (tmpRadioNm != $(item).attr("name")) {
                $form.find("input[name=" + $(item).attr("name") + "]:eq(0)").prop("checked", true);
            }
            tmpRadioNm = $(item).attr("name");
        });
    },
    /**
     * <pre>
     * 1. FuntionName : formClear
     * 2. ClassName  : common.js
     * 3. Comment    : Object Name 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param formId
     */
    getObjectClass : function  (obj) {
        if (obj && obj.constructor && obj.constructor.toString) {
            var arr = obj.constructor.toString().match(
                /function\s*(\w+)/);
            if (arr && arr.length == 2) {
                return arr[1];
            }
        }
        return undefined;
    }
};
/**
 * <pre>
 * 1. FuntionName : StringUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 문자열 관련 Class
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 23.
 * </pre>
 */
var StringUtil = {
    /**
     * <pre>
     * 1. FuntionName : getString
     * 2. ClassName  : common.js
     * 3. Comment    : 문자열확인 후 문자열 또는 기본값 리턴
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param str
     *            체크 문자열
     * @param def
     *            기본값
     * @returns
     */
    getString : function(str, def) {
        if (str != undefined && str && str != "" && str != "null") {
            return $.trim(str);
        } else {
            return $.trim(def);
        }
    },
    /**
     * <pre>
     * 1. FuntionName : getInt
     * 2. ClassName  : common.js
     * 3. Comment    : 정수형 확인 후 정수형 또는 기본값 리턴
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param num
     *            체크 정수형
     * @param def
     *            기본값
     * @returns
     */
    getInt : function(num, def) {
        var val = parseInt(num, 10);

        if (isNaN(val)) {
            return def;
        } else {
            return val;
        }
    },
    /**
     * <pre>
     * 1. FuntionName : trim
     * 2. ClassName  : common.js
     * 3. Comment    : 공백제거
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param str
     *            공백 제거 할 문자열
     * @returns
     */
    trim : function(str) {
        return $.trim(str);
    },
    /**
     * <pre>
     * 1. FuntionName : setComma
     * 2. ClassName  : common.js
     * 3. Comment    : 콤마 추가
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param num
     * @returns
     */
    setComma : function(num) {
        var pattern = /(^[+-]?\d+)(\d{3})/;
        num += '';
        while (pattern.test(num)) {
            num = num.replace(pattern, '$1' + ',' + '$2');
        }
        return num;
    },
    /**
     * <pre>
     * 1. FuntionName : removeComma
     * 2. ClassName  : common.js
     * 3. Comment    : 콤마 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param num
     * @returns
     */
    removeComma : function(num) {
        return num.replace(/,/gi, "");
    },
    /**
     * <pre>
     * 1. FuntionName : getStrByte
     * 2. ClassName  : common.js
     * 3. Comment    : 글자제한 onkeyup=&quot;getStrByte(this,'#byte', 200, 3);&quot;
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * focus 원치 않는 경우에만 noFocusYn 파라미터를 추가해준다. (ex: 화면 초기 로딩시 textarea byte수 보여줘야
     * 하는경우) getStrByte(this,'#byte', 200, 3, 'Y');
     * 
     * @param obj
     * @param tgt
     * @param size
     * @param korSize
     * @param noFocusYn
     * @returns bytes
     */
    getStrByte : function(obj, tgt, size, korSize, noFocusYn) {
        var korByte = korSize != undefined && korSize != "" ? parseInt(korSize, 10) : 3; // 한글 바이트 (기본값 3)
        var str = obj.value;
        var str_max = size;
        var p = 0;
        var bytes = 0;
        var len_num = 0;
        var str2 = "";
        if (str != "") {
            for (p = 0; p < str.length; p++) {
                (str.charCodeAt(p) > 255) ? bytes += korByte : bytes++; // 한글은 korByte, 영문, 숫자, 공백은 1byte
                if (bytes <= str_max) {
                    len_num = p + 1;
                } else {
                    alert(size + " byte를 초과 입력할수 없습니다.\n초과된 내용은 자동으로 삭제 됩니다.");
                    str2 = str.substr(0, len_num);
                    obj.value = str2;
                    bytes -= (str.charCodeAt(p) > 255)? korByte : 1;
                    break;
                }
                $(tgt).text(bytes);
            }
            return bytes;
        } else {
            $(tgt).text("0");
            return 0;
        }

        if (noFocusYn == undefined || noFocusYn != "Y") {
            obj.focus();
        }
    },
    /**
     * <pre>
     * 1. FuntionName : getStrLength
     * 2. ClassName  : common.js
     * 3. Comment    : 글자제한 onkeyup=&quot;getStrByte(this,'#byte', 200);&quot;
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * @param obj
     * @param tgt
     * @param maxlen
     */
    getStrLength : function (obj, tgt, maxlen) {
        var value = obj.value,
            len = value.length;
        if (isNaN(maxlen)) {
            return;
        }
        if (len > maxlen) {
            obj.value = value.substring(0, maxlen);
            $(tgt).text(maxlen);
        } else {
            $(tgt).text(len);
        }
        obj.focus();
    },
    /**
     * <pre>
     * 1. FuntionName : format
     * 2. ClassName  : common.js
     * 3. Comment    : 문자열 치환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     * 
     * ex ) StringUtil.format("test-{0}-{1}", "1", "2")
     *     => return "test-1-2
     * @param arguments
     * @returns
     */
    format : function () {
        var args = arguments,
            target = args[0],
            replaceArgs = new Array();
        $.each(args, function (i) {
            if (i > 0) {
                replaceArgs.push(this);
            }
        });
        return target.replace(/{(\d+)}/g, function(match, number) {
            return typeof replaceArgs[number] != "undefined" ? replaceArgs[number] : match;
        });
   },
   /**
    * <pre>
    * 1. FuntionName : formatPhone
    * 2. ClassName  : common.js
    * 3. Comment    : 연락처 포맷
    * 4. 작성자       : upleat
    * 5. 작성일       : 2020. 3. 23.
    * </pre>
    * 
    * ex ) StringUtil.formatPhone('01012345678', '-')
    * @param value
    * @param char
    * @returns
    */
   formatPhone : function (value, char) {
       if (isNaN(value)) {
           return value;
       }
       return value.replace(/(02|\d{3})(\d+)(\d{4})/, StringUtil.format("$1{0}$2{0}$3", char));
   },
   /**
    * <pre>
    * 1. FuntionName : formatDate
    * 2. ClassName  : common.js
    * 3. Comment    : 문자열 치환
    * 4. 작성자       : upleat
    * 5. 작성일       : 2020. 3. 23.
    * </pre>
    * 
    * ex ) StringUtil.formatDate('20200427', 'yyyy-MM-dd')
    * @param regdt
    * @param f
    * @returns
    */
   formatDate : function (regdt, f) {
       regdt = regdt || "";
       var yyyy = regdt.substring(0, 4);
       var yy = regdt.substring(2, 4);
       var MM = regdt.substring(4, 6);
       var dd = regdt.substring(6, 8);
       var hh = regdt.substring(8, 10);
       var mm = regdt.substring(10, 12);
       var ss = regdt.substring(12, 14);
       return f.replace(/(yyyy|yy|MM|dd|hh|mm|ss)/gi, function($1) {
           switch ($1) {
               case "yyyy":
                   return yyyy;
               case "yy":
                   return yy;
               case "MM":
                   return MM;
               case "dd":
                   return dd;
               case "hh":
                   return hh;
               case "mm":
                   return mm;
               case "ss":
                   return ss;
               default:
                   return $1;
           }
       });
   },
   /**
    * <pre>
    * 1. FuntionName : replaceEnterToBr
    * 2. ClassName  : common.js
    * 3. Comment    : 개행문자 br태그로 치환
    * 4. 작성자       : upleat
    * 5. 작성일       : 2020. 3. 23.
    * </pre>
    * 
    * @param data
    * @returns
    */
   replaceEnterToBr : function (data) {
       return data.replace(/\n/g, "<br/>");
   }
};

/**
 * <pre>
 * 1. FuntionName : ValidationUtil
 * 2. ClassName  : common.js
 * 3. Comment    : 유효성 검증
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 4. 13.
 * </pre>
 */
var ValidationUtil = {
        
    /**
     * <pre>
     * 1. FuntionName : checkSsn
     * 2. ClassName  : common.js
     * 3. Comment    : 주민등록번호 검증
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     * 
     * @param num1
     *            앞자리 숫자 6자리
     * @param num2
     *            뒷자리 숫자 7자리
     * @returns boolean
     */
    checkSsn : function(num1, num2) {
        
        var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
        var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

        for (var i=0; i<num1.length; i++) {
            arrNum1[i] = num1.charAt(i);
        } // 주민번호 앞자리를 배열에 순서대로 담는다.

        for (var i=0; i<num2.length; i++) {
            arrNum2[i] = num2.charAt(i);
        } // 주민번호 뒷자리를 배열에 순서대로 담는다.

        var tempSum=0;

        for (var i=0; i<num1.length; i++) {
            tempSum += arrNum1[i] * (2+i);
        } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

        for (var i=0; i<num2.length-1; i++) {
            if(i>=2) {
                tempSum += arrNum2[i] * i;
            }
            else {
                tempSum += arrNum2[i] * (8+i);
            }
        } // 같은방식으로 앞 번호 계산한것의 합에 뒷번/*  */호 계산한것을 모두 더함
        
        if((11-(tempSum%11))%10!=arrNum2[6]) {
            return false;
        }else{
            return true;
        }
    },
        
    /**
     * <pre>
     * 1. FuntionName : checkBizNo
     * 2. ClassName  : common.js
     * 3. Comment    : 사업자번호 검증
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     * 
     * @param num1
     *            앞자리 숫자 3자리
     * @param num2
     *            중간 숫자 2자리
     * @param num3
     *            뒷자리 숫자 5자리
     * @returns boolean
     */
    checkBizNo : function(num1, num2, num3) {
        
        var bizID = new String(num1) + new String(num2) + new String(num3)
        var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
        var tmpBizID, i, chkSum = 0, c2, remander; 
        bizID = bizID.replace(/-/gi,''); 
         
        for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i); 
        c2 = "0" + (checkID[8] * bizID.charAt(8)); 
        c2 = c2.substring(c2.length - 2, c2.length); 
        chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
        remander = (10 - (chkSum % 10)) % 10 ; 
         
        if (Math.floor(bizID.charAt(9)) == remander) {
            return true 
        } else {
            return false; 
        }
    },
    
    /**
     * <pre>
     * 1. FuntionName : checkUrl
     * 2. ClassName  : common.js
     * 3. Comment    : 사이트 주소 검증
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     * 
     * @param url
     * @returns boolean
     */
    checkUrl : function(url) {
        return (url || "").match(/(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/);
    }
}
/**
 * <pre>
 * 1. FuntionName : iframeCallback
 * 2. ClassName  : common.js
 * 3. Comment    : iframe 공통 callback 함수 
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 25.
 * </pre>
 *
 * @param type
 * @param data
 * @returns
 */
function iframeCallback (type, data) {
    switch (type) {
        case "oneself" :
            $.oneselfCallback.call(this, data);
            $.common.layer.close($(".layer-popup1"));
            break;
    }
}

/**
 * <pre>
 * 1. FuntionName : windowPopupCallback
 * 2. ClassName  : common.js
 * 3. Comment    : 윈도우 팝업 공통 callback 함수 
 * 4. 작성자       : upleat
 * 5. 작성일       : 2020. 3. 25.
 * </pre>
 *
 * @param type
 * @param data
 * @returns
 */
function windowPopupCallback (type, data) {
    switch (type) {
        case "oneself" :
            $.common.check.oneselfCallback(data);
            break;
    }
}

// 필터
function setInputFilter(element, inputFilter) {
    [ "input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop" ].forEach(function(event) {
        element.addEventListener(event, function() {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            } else {
                this.value = "";
            }
        });
    });
}

//앱다운로드 이동
function fnAppExec(){
    // userAgent값 얻기
    var ua = navigator.userAgent.toLowerCase(); 
    var tm = (new Date()).getTime();

    // Android
    if(ua.match(".*android.*")) {
        location.href = "intent://bucketmarket.co.kr#Intent;scheme=bucketmarket;package=kr.co.bucketmarket.android;end";
    } 
    // IOS
    else if (ua.match(".*iphone.*") || ua.match(".*ipad.*")) {
        setTimeout(function(){
            if ((new Date()).getTime() - tm < 3000) {
                // 앱스토어 이동 
                location.href = "https://itunes.apple.com/app/id1518205038"; 
            } 
            
        }, 2500);
        setTimeout(function(){ 
            // 앱실행 
            location.href = "bucketmarket://"; 
        }, 0);
    } 
    // 예외
    else {
        alert("지원되지 않은 단말입니다."); return;
    }
}