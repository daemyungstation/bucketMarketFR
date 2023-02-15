package common.util.renderer;

import java.util.Properties;

import common.code.Product;
import common.util.ContextUtil;
import common.util.DeviceUtil;
import common.util.StringUtil;

public class ProductImageRender {

    /**
     * <pre>
     * 1. MethodName : getProductSrc
     * 2. ClassName  : ProductImageRender.java
     * 3. Comment    : 상품이미지 URL을 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 26.
     * </pre>
     *
     * @param prdMstCd
     * @param thubnailSize
     * @return
     */
    private static String getProductSrc (String prdMstCd, String thubnailSize) {
        Properties resourcesProperties = (Properties) ContextUtil.getBean("resource");
        Properties fileProperties = (Properties) ContextUtil.getBean("file");
        String productSrc = StringUtil.getString(resourcesProperties.getProperty("cdn.ssl.domain"));
        productSrc += StringUtil.getString(fileProperties.getProperty("file.path.product"));
        productSrc += "/";
        productSrc += prdMstCd;
        productSrc += "/";
        productSrc += Product.IMG_MAIN.toLowerCase();
        productSrc += "_";
        productSrc += thubnailSize;
        productSrc += ".png";
        return productSrc;
    }
    
    /**
     * <pre>
     * 1. MethodName : getProductErrorSrc
     * 2. ClassName  : ProductImageRender.java
     * 3. Comment    : 상품이미지 오류 URL을 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 26.
     * </pre>
     *
     * @return
     */
    private static String getProductErrorSrc () {
        Properties resourcesProperties = (Properties) ContextUtil.getBean("resource");
        String productErrorScr = "";
        if (DeviceUtil.isNormal()) {
            productErrorScr += StringUtil.getString(resourcesProperties.getProperty("img.ssl.none.src.pc"));
        } else {
            productErrorScr += StringUtil.getString(resourcesProperties.getProperty("img.ssl.none.src.mobile"));
        }
        return productErrorScr;
    }
    
    /**
     * <pre>
     * 1. MethodName : getProductErrorSrc
     * 2. ClassName  : ProductImageRender.java
     * 3. Comment    : 상품이미지 태그를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 26.
     * </pre>
     * 
     * @param prdMstCd
     * @param thubnailSize
     * @return
     */
    public static String renderProductImageTag(String prdMstCd, String thubnailSize) {
        String productImageTag = "";
        productImageTag += "<img src=\"" + getProductSrc(prdMstCd, thubnailSize) + "\" alt=\"\" onerror=\"this.src='" + getProductErrorSrc() + "'\"/>";
        return productImageTag;
    }
    /**
     * <pre>
     * 1. MethodName : getProductErrorSrc
     * 2. ClassName  : ProductImageRender.java
     * 3. Comment    : 상품이미지 URL을 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 26.
     * </pre>
     * 
     * @param prdMstCd
     * @param thubnailSize
     * @return
     */
    public static String renderProductImageUrl(String prdMstCd, String thubnailSize) {
        return getProductSrc(prdMstCd, thubnailSize);
    }
    
}
