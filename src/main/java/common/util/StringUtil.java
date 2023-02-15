package common.util;

/*
 * Copyright 2001-2006 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the ";License&quot;);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS"; BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import lombok.extern.log4j.Log4j2;

/**
 * @PackageName: com.upleat.util
 * @FileName : StringUtil.java
 * @Date : 2014. 1. 27.
 * @프로그램 설명 : 문자열 데이터 처리 관련 유틸리티
 * @author upleat 기술개발팀 egovframework utility version 1.0 기준
 */
@Log4j2
public class StringUtil {
    /**
     * 빈 문자열 <code>""</code>.
     */
    public static final String EMPTY = "";

    /**
     * <pre>
     * 1. MethodName : unicodeToChar
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : properties 등에서 읽어온 유니코드를 원형으로 변환한다 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 24.
     * </pre>
     *
     * @param unicode
     * @return
     */
    public static String unicodeToChar(String unicode) {

        StringBuffer str = new StringBuffer();

        char ch = 0;

        for (int i = unicode.indexOf("\\u"); i > -1; i = unicode.indexOf("\\u")) {
            ch = (char) Integer.parseInt(unicode.substring(i + 2, i + 6), 16);
            str.append(unicode.substring(0, i));
            str.append(String.valueOf(ch));
            unicode = unicode.substring(i + 6);
        }
        str.append(unicode);

        return str.toString();
    }

    /**
     * 문자열이 지정한 길이를 초과했을때 지정한길이에다가 해당 문자열을 붙여주는 메서드.
     * 
     * @param source
     *            원본 문자열 배열
     * @param output
     *            더할문자열
     * @param slength
     *            지정길이
     * @return 지정길이로 잘라서 더할분자열 합친 문자열
     */
    public static String cutString(String source, String output, int slength) {
        String returnVal = null;
        if (source != null) {
            if (source.length() > slength) {
                returnVal = source.substring(0, slength) + output;
            } else
                returnVal = source;
        }
        return returnVal;
    }

    /**
     * 문자열이 지정한 길이를 초과했을때 해당 문자열을 삭제하는 메서드
     * 
     * @param source
     *            원본 문자열 배열
     * @param slength
     *            지정길이
     * @return 지정길이로 잘라서 더할분자열 합친 문자열
     */
    public static String cutString(String source, int slength) {
        String result = null;
        if (source != null) {
            if (source.length() > slength) {
                result = source.substring(0, slength);
            } else
                result = source;
        }
        return result;
    }

    /**
     * <p>
     * String이 비었거나("") 혹은 null 인지 검증한다.
     * </p>
     * 
     * <pre>
     *  StringUtil.isEmpty(null)      = true
     *  StringUtil.isEmpty("")        = true
     *  StringUtil.isEmpty(" ")       = false
     *  StringUtil.isEmpty("bob")     = false
     *  StringUtil.isEmpty("  bob  ") = false
     * </pre>
     * 
     * @param str
     *            - 체크 대상 스트링오브젝트이며 null을 허용함
     * @return <code>true</code> - 입력받은 String 이 빈 문자열 또는 null인 경우
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    /**
     * <p>
     * 기준 문자열에 포함된 모든 대상 문자(char)를 제거한다.
     * </p>
     *
     * <pre>
     * StringUtil.remove(null, *)       = null
     * StringUtil.remove("", *)         = ""
     * StringUtil.remove("queued", 'u') = "qeed"
     * StringUtil.remove("queued", 'z') = "queued"
     * </pre>
     *
     * @param str
     *            입력받는 기준 문자열
     * @param remove
     *            입력받는 문자열에서 제거할 대상 문자열
     * @return 제거대상 문자열이 제거된 입력문자열. 입력문자열이 null인 경우 출력문자열은 null
     */
    public static String remove(String str, char remove) {
        if (isEmpty(str) || str.indexOf(remove) == -1) {
            return str;
        }
        char[] chars = str.toCharArray();
        int pos = 0;
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] != remove) {
                chars[pos++] = chars[i];
            }
        }
        return new String(chars, 0, pos);
    }

    /**
     * <p>
     * 문자열 내부의 콤마 character(,)를 모두 제거한다.
     * </p>
     *
     * <pre>
     * StringUtil.removeCommaChar(null)       = null
     * StringUtil.removeCommaChar("")         = ""
     * StringUtil.removeCommaChar("asdfg,qweqe") = "asdfgqweqe"
     * </pre>
     *
     * @param str
     *            입력받는 기준 문자열
     * @return " , "가 제거된 입력문자열 입력문자열이 null인 경우 출력문자열은 null
     */
    public static String removeCommaChar(String str) {
        return remove(str, ',');
    }

    /**
     * <p>
     * 문자열 내부의 마이너스 character(-)를 모두 제거한다.
     * </p>
     *
     * <pre>
     * StringUtil.removeMinusChar(null)       = null
     * StringUtil.removeMinusChar("")         = ""
     * StringUtil.removeMinusChar("a-sdfg-qweqe") = "asdfgqweqe"
     * </pre>
     *
     * @param str
     *            입력받는 기준 문자열
     * @return " - "가 제거된 입력문자열 입력문자열이 null인 경우 출력문자열은 null
     */
    public static String removeMinusChar(String str) {
        return remove(str, '-');
    }

    /**
     * 원본 문자열의 포함된 특정 문자열을 새로운 문자열로 변환하는 메서드
     * 
     * @param source
     *            원본 문자열
     * @param subject
     *            원본 문자열에 포함된 특정 문자열
     * @param object
     *            변환할 문자열
     * @return sb.toString() 새로운 문자열로 변환된 문자열
     */
    public static String replace(String source, String subject, String object) {
        StringBuffer rtnStr = new StringBuffer();
        String preStr = EMPTY;
        String nextStr = source;
        String srcStr = source;

        while (srcStr.indexOf(subject) >= 0) {
            preStr = srcStr.substring(0, srcStr.indexOf(subject));
            nextStr = srcStr.substring(srcStr.indexOf(subject) + subject.length(), srcStr.length());
            srcStr = nextStr;
            rtnStr.append(preStr).append(object);
        }
        rtnStr.append(nextStr);
        return rtnStr.toString();
    }

    /**
     * 원본 문자열의 포함된 특정 문자열 첫번째 한개만 새로운 문자열로 변환하는 메서드
     * 
     * @param source
     *            원본 문자열
     * @param subject
     *            원본 문자열에 포함된 특정 문자열
     * @param object
     *            변환할 문자열
     * @return sb.toString() 새로운 문자열로 변환된 문자열 / source 특정문자열이 없는 경우 원본 문자열
     */
    public static String replaceOnce(String source, String subject, String object) {
        StringBuffer rtnStr = new StringBuffer();
        String preStr = EMPTY;
        String nextStr = source;
        if (source.indexOf(subject) >= 0) {
            preStr = source.substring(0, source.indexOf(subject));
            nextStr = source.substring(source.indexOf(subject) + subject.length(), source.length());
            rtnStr.append(preStr).append(object).append(nextStr);
            return rtnStr.toString();
        } else {
            return source;
        }
    }

    /**
     * <code>subject</code>에 포함된 각각의 문자를 object로 변환한다.
     * 
     * @param source
     *            원본 문자열
     * @param subject
     *            원본 문자열에 포함된 특정 문자열
     * @param object
     *            변환할 문자열
     * @return sb.toString() 새로운 문자열로 변환된 문자열
     */
    public static String replaceChar(String source, String subject, String object) {
        StringBuffer rtnStr = new StringBuffer();
        String preStr = EMPTY;
        String nextStr = source;
        String srcStr = source;

        char chA;

        for (int i = 0; i < subject.length(); i++) {
            chA = subject.charAt(i);

            if (srcStr.indexOf(chA) >= 0) {
                preStr = srcStr.substring(0, srcStr.indexOf(chA));
                nextStr = srcStr.substring(srcStr.indexOf(chA) + 1, srcStr.length());
                srcStr = rtnStr.append(preStr).append(object).append(nextStr).toString();
            }
        }

        return srcStr;
    }

    /**
     * <p>
     * <code>str</code> 중 <code>searchStr</code>의 시작(index) 위치를 반환.
     * </p>
     *
     * <p>
     * 입력값 중 <code>null</code>이 있을 경우 <code>-1</code>을 반환.
     * </p>
     *
     * <pre>
     * StringUtil.indexOf(null, *)          = -1
     * StringUtil.indexOf(*, null)          = -1
     * StringUtil.indexOf("", "")           = 0
     * StringUtil.indexOf("aabaabaa", "a")  = 0
     * StringUtil.indexOf("aabaabaa", "b")  = 2
     * StringUtil.indexOf("aabaabaa", "ab") = 1
     * StringUtil.indexOf("aabaabaa", "")   = 0
     * </pre>
     *
     * @param str
     *            검색 문자열
     * @param searchStr
     *            검색 대상문자열
     * @return 검색 문자열 중 검색 대상문자열이 있는 시작 위치 검색대상 문자열이 없거나 null인 경우 -1
     */
    public static int indexOf(String str, String searchStr) {
        if (str == null || searchStr == null) {
            return -1;
        }
        return str.indexOf(searchStr);
    }

    /**
     * <pre>
     * 1. MethodName : nullCheck
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : nullCheck
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param obj
     * @return
     */
    public static boolean nullCheck(Object obj) {
        boolean nullStatus = false;
        if (obj == null) {
            nullStatus = true;
        } else {
            nullStatus = false;
        }

        return nullStatus;
    }

    /**
     * 객체가 null인지 확인하고 null인 경우 "" 로 바꾸는 메서드
     * 
     * @param object
     *            원본 객체
     * @return resultVal 문자열
     */
    public static String isNullToString(Object object) {
        String string = EMPTY;

        if (object != null) {
            string = object.toString().trim();
        }

        return string;
    }

    /**
     * <pre>
     * 인자로 받은 String이 null일 경우 &quot;&quot;로 리턴한다.
     * &#064;param src null값일 가능성이 있는 String 값.
     * &#064;return 만약 String이 null 값일 경우 &quot;&quot;로 바꾼 String 값.
     * </pre>
     */
    public static String nullConvert(Object src) {
        // if (src != null &&
        // src.getClass().getName().equals("java.math.BigDecimal")) {
        if (src != null && src instanceof java.math.BigDecimal) {
            return ((BigDecimal) src).toString();
        }

        if (src == null || src.equals("null")) {
            return EMPTY;
        } else {
            return ((String) src).trim();
        }
    }

    /**
     * <pre>
     * 인자로 받은 String이 null일 경우 &quot;&quot;로 리턴한다.
     * &#064;param src null값일 가능성이 있는 String 값.
     * &#064;return 만약 String이 null 값일 경우 &quot;&quot;로 바꾼 String 값.
     * </pre>
     */
    public static String nullConvert(String src) {

        if (src == null || src.equals("null") || EMPTY.equals(src) || " ".equals(src)) {
            return EMPTY;
        } else {
            return src.trim();
        }
    }

    /**
     * <pre>
     * 인자로 받은 String이 null일 경우 &quot;0&quot;로 리턴한다.
     * &#064;param src null값일 가능성이 있는 String 값.
     * &#064;return 만약 String이 null 값일 경우 &quot;0&quot;로 바꾼 String 값.
     * </pre>
     */
    public static int zeroConvert(Object src) {

        if (src == null || src.equals("null")) {
            return 0;
        } else {
            return Integer.parseInt(((String) src).trim());
        }
    }

    /**
     * <pre>
     * 인자로 받은 String이 null일 경우 &quot;&quot;로 리턴한다.
     * &#064;param src null값일 가능성이 있는 String 값.
     * &#064;return 만약 String이 null 값일 경우 &quot;&quot;로 바꾼 String 값.
     * </pre>
     */
    public static int zeroConvert(String src) {

        if (src == null || src.equals("null") || EMPTY.equals(src) || " ".equals(src)) {
            return 0;
        } else {
            return Integer.parseInt(src.trim());
        }
    }

    /**
     * <p>
     * 문자열에서 {@link Character#isWhitespace(char)}에 정의된 모든 공백문자를 제거한다.
     * </p>
     *
     * <pre>
     * StringUtil.removeWhitespace(null)         = null
     * StringUtil.removeWhitespace("")           = ""
     * StringUtil.removeWhitespace("abc")        = "abc"
     * StringUtil.removeWhitespace("   ab  c  ") = "abc"
     * </pre>
     *
     * @param str
     *            공백문자가 제거도어야 할 문자열
     * @return the 공백문자가 제거된 문자열, null이 입력되면 <code>null</code>이 리턴
     */
    public static String removeWhitespace(String str) {
        if (isEmpty(str)) {
            return str;
        }
        int sz = str.length();
        char[] chs = new char[sz];
        int count = 0;
        for (int i = 0; i < sz; i++) {
            if (!Character.isWhitespace(str.charAt(i))) {
                chs[count++] = str.charAt(i);
            }
        }
        if (count == sz) {
            return str;
        }

        return new String(chs, 0, count);
    }

    /**
     * Html 코드가 들어간 문서를 표시할때 태그에 손상없이 보이기 위한 메서드
     * 
     * @param strString
     * @return HTML 태그를 치환한 문자열
     */
    public static String checkHtmlView(String strString) {
        String strNew = EMPTY;

        try {
            StringBuffer strTxt = new StringBuffer(EMPTY);

            char chrBuff;
            int len = strString.length();

            for (int i = 0; i < len; i++) {
                chrBuff = (char) strString.charAt(i);

                switch (chrBuff) {
                case '<':
                    strTxt.append("&lt;");
                    break;
                case '>':
                    strTxt.append("&gt;");
                    break;
                case '"':
                    strTxt.append("&quot;");
                    break;
                case 10:
                    strTxt.append("<br>");
                    break;
                case ' ':
                    strTxt.append("&nbsp;");
                    break;
                default:
                    strTxt.append(chrBuff);
                }
            }

            strNew = strTxt.toString();

        } catch (Exception ex) {
            return null;
        }

        return strNew;
    }

    /**
     * 문자열을 지정한 분리자에 의해 배열로 리턴하는 메서드.
     * 
     * @param source
     *            원본 문자열
     * @param separator
     *            분리자
     * @return result 분리자로 나뉘어진 문자열 배열
     */
    public static String[] split(String source, String separator) throws NullPointerException {
        String[] returnVal = null;
        int cnt = 1;

        int index = source.indexOf(separator);
        int index0 = 0;
        while (index >= 0) {
            cnt++;
            index = source.indexOf(separator, index + 1);
        }
        returnVal = new String[cnt];
        cnt = 0;
        index = source.indexOf(separator);
        while (index >= 0) {
            returnVal[cnt] = source.substring(index0, index);
            index0 = index + 1;
            index = source.indexOf(separator, index + 1);
            cnt++;
        }
        returnVal[cnt] = source.substring(index0);

        return returnVal;
    }

    /**
     * 문자열을 지정한 분리자에 의해 지정된 길이의 배열로 리턴하는 메서드.
     * 
     * @param source
     *            원본 문자열
     * @param separator
     *            분리자
     * @param arraylength
     *            배열 길이
     * @return 분리자로 나뉘어진 문자열 배열
     */
    public static String[] split(String source, String separator, int arraylength) throws NullPointerException {
        String[] returnVal = new String[arraylength];
        int cnt = 0;
        int index0 = 0;
        int index = source.indexOf(separator);
        while (index >= 0 && cnt < (arraylength - 1)) {
            returnVal[cnt] = source.substring(index0, index);
            index0 = index + 1;
            index = source.indexOf(separator, index + 1);
            cnt++;
        }
        returnVal[cnt] = source.substring(index0);
        if (cnt < (arraylength - 1)) {
            for (int i = cnt + 1; i < arraylength; i++) {
                returnVal[i] = EMPTY;
            }
        }

        return returnVal;
    }

    public static String[] getArray(Map<String, Object> commandMap, String obj) {
        String[] returnVal = new String[0];

        try {

            if (commandMap.get(obj).getClass() == null || !commandMap.get(obj).getClass().isArray()) {
                returnVal = new String[1];
                returnVal[0] = (String) commandMap.get(obj);
            } else {
                returnVal = (String[]) commandMap.get(obj);
            }

        } catch (Exception e) {
        }
        return returnVal;
    }
    
    /**
     * <p>
     * {@link String#toLowerCase()}를 이용하여 소문자로 변환한다.
     * </p>
     *
     * <pre>
     * StringUtil.lowerCase(null)  = null
     * StringUtil.lowerCase("")    = ""
     * StringUtil.lowerCase("aBc") = "abc"
     * </pre>
     *
     * @param str
     *            소문자로 변환되어야 할 문자열
     * @return 소문자로 변환된 문자열, null이 입력되면 <code>null</code> 리턴
     */
    public static String lowerCase(String str) {
        if (str == null) {
            return null;
        }

        return str.toLowerCase();
    }

    /**
     * <p>
     * {@link String#toUpperCase()}를 이용하여 대문자로 변환한다.
     * </p>
     *
     * <pre>
     * StringUtil.upperCase(null)  = null
     * StringUtil.upperCase("")    = ""
     * StringUtil.upperCase("aBc") = "ABC"
     * </pre>
     *
     * @param str
     *            대문자로 변환되어야 할 문자열
     * @return 대문자로 변환된 문자열, null이 입력되면 <code>null</code> 리턴
     */
    public static String upperCase(String str) {
        if (str == null) {
            return null;
        }

        return str.toUpperCase();
    }

    /**
     * <p>
     * 입력된 String의 앞쪽에서 두번째 인자로 전달된 문자(stripChars)를 모두 제거한다.
     * </p>
     *
     * <pre>
     * StringUtil.stripStart(null, *)          = null
     * StringUtil.stripStart("", *)            = ""
     * StringUtil.stripStart("abc", "")        = "abc"
     * StringUtil.stripStart("abc", null)      = "abc"
     * StringUtil.stripStart("  abc", null)    = "abc"
     * StringUtil.stripStart("abc  ", null)    = "abc  "
     * StringUtil.stripStart(" abc ", null)    = "abc "
     * StringUtil.stripStart("yxabc  ", "xyz") = "abc  "
     * </pre>
     *
     * @param str
     *            지정된 문자가 제거되어야 할 문자열
     * @param stripChars
     *            제거대상 문자열
     * @return 지정된 문자가 제거된 문자열, null이 입력되면 <code>null</code> 리턴
     */
    public static String stripStart(String str, String stripChars) {
        int strLen;
        if (str == null || (strLen = str.length()) == 0) {
            return str;
        }
        int start = 0;
        if (stripChars == null) {
            while ((start != strLen) && Character.isWhitespace(str.charAt(start))) {
                start++;
            }
        } else if (stripChars.length() == 0) {
            return str;
        } else {
            while ((start != strLen) && (stripChars.indexOf(str.charAt(start)) != -1)) {
                start++;
            }
        }

        return str.substring(start);
    }

    /**
     * <p>
     * 입력된 String의 뒤쪽에서 두번째 인자로 전달된 문자(stripChars)를 모두 제거한다.
     * </p>
     *
     * <pre>
     * StringUtil.stripEnd(null, *)          = null
     * StringUtil.stripEnd("", *)            = ""
     * StringUtil.stripEnd("abc", "")        = "abc"
     * StringUtil.stripEnd("abc", null)      = "abc"
     * StringUtil.stripEnd("  abc", null)    = "  abc"
     * StringUtil.stripEnd("abc  ", null)    = "abc"
     * StringUtil.stripEnd(" abc ", null)    = " abc"
     * StringUtil.stripEnd("  abcyx", "xyz") = "  abc"
     * </pre>
     *
     * @param str
     *            지정된 문자가 제거되어야 할 문자열
     * @param stripChars
     *            제거대상 문자열
     * @return 지정된 문자가 제거된 문자열, null이 입력되면 <code>null</code> 리턴
     */
    public static String stripEnd(String str, String stripChars) {
        int end;
        if (str == null || (end = str.length()) == 0) {
            return str;
        }

        if (stripChars == null) {
            while ((end != 0) && Character.isWhitespace(str.charAt(end - 1))) {
                end--;
            }
        } else if (stripChars.length() == 0) {
            return str;
        } else {
            while ((end != 0) && (stripChars.indexOf(str.charAt(end - 1)) != -1)) {
                end--;
            }
        }

        return str.substring(0, end);
    }

    /**
     * <p>
     * 입력된 String의 앞, 뒤에서 두번째 인자로 전달된 문자(stripChars)를 모두 제거한다.
     * </p>
     * 
     * <pre>
     * StringUtil.strip(null, *)          = null
     * StringUtil.strip("", *)            = ""
     * StringUtil.strip("abc", null)      = "abc"
     * StringUtil.strip("  abc", null)    = "abc"
     * StringUtil.strip("abc  ", null)    = "abc"
     * StringUtil.strip(" abc ", null)    = "abc"
     * StringUtil.strip("  abcyx", "xyz") = "  abc"
     * </pre>
     *
     * @param str
     *            지정된 문자가 제거되어야 할 문자열
     * @param stripChars
     *            제거대상 문자열
     * @return 지정된 문자가 제거된 문자열, null이 입력되면 <code>null</code> 리턴
     */
    public static String strip(String str, String stripChars) {
        if (isEmpty(str)) {
            return str;
        }

        String srcStr = str;
        srcStr = stripStart(srcStr, stripChars);

        return stripEnd(srcStr, stripChars);
    }

    /**
     * 문자열을 다양한 문자셋(EUC-KR[KSC5601],UTF-8..)을 사용하여 인코딩하는 기능 역으로 디코딩하여 원래의 문자열을
     * 복원하는 기능을 제공함 String temp = new String(문자열.getBytes("바꾸기전 인코딩"),"바꿀 인코딩");
     * String temp = new String(문자열.getBytes("8859_1"),"KSC5601"); => UTF-8 에서
     * EUC-KR
     * 
     * @param srcString
     *            - 문자열
     * @param srcCharsetNm
     *            - 원래 CharsetNm
     * @param charsetNm
     *            - CharsetNm
     * @return 인(디)코딩 문자열
     * @exception MyException
     * @see
     */
    public static String getEncdDcd(String srcString, String srcCharsetNm, String cnvrCharsetNm) {

        String rtnStr = null;

        if (srcString == null)
            return null;

        try {
            rtnStr = new String(srcString.getBytes(srcCharsetNm), cnvrCharsetNm);
        } catch (UnsupportedEncodingException e) {
            rtnStr = null;
        }

        return rtnStr;
    }

    /**
     * 특수문자를 웹 브라우저에서 정상적으로 보이기 위해 특수문자를 처리('<' -> & lT)하는 기능이다
     * 
     * @param srcString
     *            - '<'
     * @return 변환문자열('<' -> "&lt"
     * @exception MyException
     * @see
     */
    public static String getSpclStrCnvr(String srcString) {

        String rtnStr = null;

        try {
            StringBuffer strTxt = new StringBuffer(EMPTY);

            char chrBuff;
            int len = srcString.length();

            for (int i = 0; i < len; i++) {
                chrBuff = (char) srcString.charAt(i);

                switch (chrBuff) {
                case '<':
                    strTxt.append("&lt;");
                    break;
                case '>':
                    strTxt.append("&gt;");
                    break;
                case '&':
                    strTxt.append("&amp;");
                    break;
                default:
                    strTxt.append(chrBuff);
                }
            }

            rtnStr = strTxt.toString();

        } catch (Exception e) {
            log.error(e.getStackTrace());
        }
        return rtnStr;
    }

    /**
     * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
     * 
     * @param
     * @return Timestamp 값
     * @exception MyException
     * @see
     */
    public static String getTimeStamp() {

        String rtnStr = null;

        // 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
        String pattern = "yyyyMMddhhmmssSSS";

        try {
            SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
            Timestamp ts = new Timestamp(System.currentTimeMillis());

            rtnStr = sdfCurrent.format(ts.getTime());
        } catch (Exception e) {
            log.error(e.getStackTrace());
        }

        return rtnStr;
    }

    /**
     * html의 특수문자를 표현하기 위해
     * 
     * @param srcString
     * @return String
     * @exception Exception
     * @see
     */
    public static String getHtmlStrCnvr(String srcString) {

        String tmpString = srcString;

        try {
            tmpString = tmpString.replaceAll("&lt;", "<");
            tmpString = tmpString.replaceAll("&gt;", ">");
            tmpString = tmpString.replaceAll("&amp;", "&");
            tmpString = tmpString.replaceAll("&nbsp;", " ");
            tmpString = tmpString.replaceAll("&apos;", "\'");
            tmpString = tmpString.replaceAll("&quot;", "\"");
        } catch (Exception e) {
            log.error(e.getStackTrace());
        }

        return tmpString;

    }

    /**
     * commandMap의 값을 QueryString 형식으로 생성 반환한다.
     * 
     * @param commandMap
     * @return String
     */
    public static String getQueryString(Map<String, Object> commandMap) {
        return getQueryString(commandMap, null);
    }

    /**
     * <pre>
     * 1. MethodName : getQueryString
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : commandMap의 값을 QueryString 형식으로 생성 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 22.
     * </pre>
     *
     * @param commandMap
     * @param removeParamList
     * @return
     */
    public static String getQueryString(Map<String, Object> commandMap, List<String> removeParamList) {
        if (commandMap != null) {
            String removeParams = "";
            if (removeParamList != null) {
                removeParams = String.join(",", removeParamList);
            }
            removeParams = removeParams + ",authsGrade,lang_code,menuTCd,menuLCd,";
            StringBuilder result = new StringBuilder();
            for (String key : commandMap.keySet()) {
                if (removeParams.indexOf("," + key + ",") == -1) {
                    result.append("&" + key + "=" + getString(commandMap.get(key)));
                }
            }
            if (result.length() > 0) {
                return result.toString().substring(1);
            } else {
                return EMPTY;
            }
        } else {
            return EMPTY;
        }
    }

    /**
     * <pre>
     * 1. MethodName : getInt
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param obj
     * @return
     */
    public static int getInt(Object obj) {
        return getInt(obj, 0);
    }

    /**
     * <pre>
     * 1. MethodName : getInt
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param obj
     * @param defNum
     * @return
     */
    public static int getInt(Object obj, int defNum) {
        if (obj == null || obj.toString().equals(EMPTY)) {
            return defNum;
        } else {
            if (obj.toString().indexOf(".") != -1) {
                int temp = obj.toString().indexOf(".");
                String tempObj = getString(obj);
                obj = tempObj.substring(0, temp);
            }
            if (Integer.parseInt(obj.toString()) <= 0) {
                return defNum;
            } else {
                return Integer.parseInt(obj.toString());
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : getInt
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @param key
     * @param defNum
     * @return
     */
    public static int getInt(Map<String, ?> commandMap, String key, int defNum) {
        try {
            return getInt(commandMap.get(key), defNum);
        } catch (NullPointerException e) {
            return defNum;
        }
    }

    /**
     * <pre>
     * 1. MethodName : getInt
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @param key
     * @return
     */
    public static int getInt(Map<String, ?> commandMap, String key) {
        try {
            return getInt(commandMap.get(key), 0);
        } catch (NullPointerException e) {
            return 0;
        }
    }

    /**
     * <pre>
     * 1. MethodName : getString
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 문자열으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param obj
     * @return
     */
    public static String getString(Object obj) {
        return getString(obj, EMPTY);
    }

    /**
     * <pre>
     * 1. MethodName : getString
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 문자열으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param obj
     * @param defStr
     * @return
     */
    public static String getString(Object obj, String defStr) {
        if (obj == null || obj.toString().equals(EMPTY)) {
            return defStr;
        } else {
            if (EMPTY.equals(obj.toString())) {
                return defStr;
            } else {
                return obj.toString();
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : getString
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 문자열으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @param key
     * @param defStr
     * @return
     */
    public static String getString(Map<String, ?> commandMap, String key, String defStr) {
        try {
            return getString(commandMap.get(key), defStr);
        } catch (NullPointerException e) {
            return defStr;
        }
    }

    /**
     * <pre>
     * 1. MethodName : getString
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 문자열으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @param key
     * @return
     */
    public static String getString(Map<String, ?> commandMap, String key) {
        try {
            return getString(commandMap.get(key), EMPTY);
        } catch (NullPointerException e) {
            return EMPTY;
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : getLong
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param obj
     * @return
     */
    public static long getLong(Object obj) {
        return getLong(obj, 0);
    }

    /**
     * <pre>
     * 1. MethodName : getLong
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param obj
     * @param defNum
     * @return
     */
    public static long getLong(Object obj, long defNum) {
        if (obj == null || obj.toString().equals(EMPTY)) {
            return defNum;
        } else {
            if (obj.toString().indexOf(".") != -1) {
                int temp = obj.toString().indexOf(".");
                String tempObj = getString(obj);
                obj = tempObj.substring(0, temp);
            }
            if (Long.parseLong(obj.toString()) <= 0) {
                return defNum;
            } else {
                return Long.parseLong(obj.toString());
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : getLong
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @param key
     * @param defNum
     * @return
     */
    public static long getLong(Map<String, Object> commandMap, String key, long defNum) {
        try {
            return getLong(commandMap.get(key), defNum);
        } catch (NullPointerException e) {
            return defNum;
        }
    }

    /**
     * <pre>
     * 1. MethodName : getLong
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 숫자형으로 변환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param commandMap
     * @param key
     * @return
     */
    public static long getLong(Map<String, Object> commandMap, String key) {
        try {
            return getLong(commandMap.get(key), 0);
        } catch (NullPointerException e) {
            return 0;
        }
    }

    /**
     * <pre>
     * 1. MethodName : setInjectionReplace
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 인젝션 처리 위한 문자열 번환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param value
     * @return
     */
    public static String setInjectionReplace(String value) {
        // Avoid null characters
        value = value.replaceAll(EMPTY, EMPTY);

        // Avoid anything between script tags
        Pattern scriptPattern = Pattern.compile("<script", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-script");

        // Remove any lonesome </script> tag
        scriptPattern = Pattern.compile("</script>", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-/script>");

        scriptPattern = Pattern.compile("<xmp", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-xmp");

        scriptPattern = Pattern.compile("<title", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-title");

        scriptPattern = Pattern.compile("<object", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-object");

        scriptPattern = Pattern.compile("</object", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-/object");

        scriptPattern = Pattern.compile("<textarea", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-textarea");

        scriptPattern = Pattern.compile("</textarea", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-/textarea");

        scriptPattern = Pattern.compile("<iframe", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-iframe");

        scriptPattern = Pattern.compile("</iframe", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll("<x-/iframe");

        // Avoid eval(...) expressions
        scriptPattern = Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
        value = scriptPattern.matcher(value).replaceAll(EMPTY);

        // Avoid expression(...) expressions
        scriptPattern = Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
        value = scriptPattern.matcher(value).replaceAll(EMPTY);

        // Avoid javascript:... expressions
        scriptPattern = Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll(EMPTY);

        // Avoid vbscript:... expressions
        scriptPattern = Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE);
        value = scriptPattern.matcher(value).replaceAll(EMPTY);

        // Avoid onload= expressions
        scriptPattern = Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
        value = scriptPattern.matcher(value).replaceAll(EMPTY);

        return value;
    }

    /**
     * <pre>
     * 1. MethodName : fillLeft
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 입력된 문자열의 왼쪽에 index의 길이만큼 문자열을 붙여 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param str
     *            문자열
     * @param index
     *            문자열이 붙여진 후 최종 문자열의 길이
     * @param addStr
     *            추가하여 붙일 문자
     * @return String 추가된 문자열
     */
    public static String fillLeft(String str, int index, String addStr) {
        int gap = 0;
        if ((str != null) && (addStr != null) && (str.length() <= index)) {
            gap = index - str.length();

            for (int i = 0; i < gap; i++) {
                str = addStr + str;
            }
        }

        return str;
    }

    /**
     * <pre>
     * 1. MethodName : fillRight
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 입력된 문자열의 오른쪽에 index의 길이만큼 문자열을 붙여 반환한다.(Byte로 계산)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param str
     * @param index
     * @param addStr
     * @return
     */
    public static String fillRight(String str, int index, String addStr) {
        int gap = 0;
        if ((str != null) && (addStr != null) && (str.length() <= index)) {
            gap = index - getByteLength(str);

            for (int i = 0; i < gap; i++) {
                str = str + addStr;
            }
        }

        return str;
    }

    /**
     * <pre>
     * 1. MethodName : getByteLength
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 입력된 문자열의 Byte Length를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param str
     * @return
     */
    public static int getByteLength(String str) {
        int subject_len = str.length();
        int strLength = 0;
        char tempChar[] = new char[subject_len];

        for (int i = 0; i < subject_len; i++) {
            tempChar[i] = str.charAt(i);
            if (tempChar[i] < 128) {
                strLength++;
            } else {
                strLength += 2;
            }
        }

        return strLength;
    }

    /**
     * <pre>
     * 1. MethodName : splitPhoneNumber
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : 전화번호 자르기
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param phoneNumber
     * @return
     */
    public static String[] splitPhoneNumber(String phoneNumber) {
        if (phoneNumber.length() == 10) {
            return new String[] { phoneNumber.substring(0, 3), phoneNumber.substring(3, 6), phoneNumber.substring(6, 10) };
        } else if (phoneNumber.length() == 11) {
            return new String[] { phoneNumber.substring(0, 3), phoneNumber.substring(3, 7), phoneNumber.substring(7, 11) };
        } else {
            return null;
        }
    }

    /**
     * <pre>
     * 1. MethodName : splitPhoneNumber
     * 2. ClassName  : StringUtil.java
     * 3. Comment    : TODO
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param phoneNumber
     * @return
     */
    public static boolean isPhoneNumber(String phoneNumber) {
        return phoneNumber.length() == 10 || phoneNumber.length() == 11;
    }
}
