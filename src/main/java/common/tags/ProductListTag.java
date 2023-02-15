package common.tags;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import common.util.renderer.ProductListRender;

public class ProductListTag extends TagSupport {

    private static final long serialVersionUID = 505238206869851929L;
    
    private Map<String, Object> info;
    private String thubnailSize;
    private String type;

    public Map<String, Object> getInfo() {
        return info;
    }
    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
    public String getThubnailSize() {
        return thubnailSize;
    }
    public void setThubnailSize(String thubnailSize) {
        this.thubnailSize = thubnailSize;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    
    @Override
    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.println(ProductListRender.renderProductListTag(info, thubnailSize, type));
            return EVAL_PAGE;
        } catch (IOException e) {
            throw new JspException();
        }
    }
}
