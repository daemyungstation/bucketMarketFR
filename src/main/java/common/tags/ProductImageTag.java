package common.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import common.util.StringUtil;
import common.util.renderer.ProductImageRender;

public class ProductImageTag extends TagSupport {

    private static final long serialVersionUID = -3343660885135101822L;
    
    private String prdMstCd;
    private String thubnailSize;
    private String tagYn;
    
    public String getPrdMstCd() {
        return prdMstCd;
    }
    public void setPrdMstCd(String prdMstCd) {
        this.prdMstCd = prdMstCd;
    }
    public String getThubnailSize() {
        return thubnailSize;
    }
    public void setThubnailSize(String thubnailSize) {
        this.thubnailSize = thubnailSize;
    }
    public String getTagYn() {
        return tagYn;
    }
    public void setTagYn(String tagYn) {
        this.tagYn = tagYn;
    }
    @Override
    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            if ("Y".equals(StringUtil.getString(tagYn, "Y"))) {
                out.println(ProductImageRender.renderProductImageTag(prdMstCd, thubnailSize));
            } else {
                out.print(ProductImageRender.renderProductImageUrl(prdMstCd, thubnailSize));
            }
            return EVAL_PAGE;
        } catch (IOException e) {
            throw new JspException();
        }
    }
}
