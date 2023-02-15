package common.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;

import common.util.StringUtil;

public class PhoneTag extends TagSupport {

    private static final long serialVersionUID = 3460657555728620319L;

    private String value;

    public void setValue(String value) {
        this.value = value;
    }

    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            try {
                if (StringUtils.isNotBlank(value)) {
                    value = StringUtil.fillRight(value, 11, " ");
                    out.println(StringUtils.join(StringUtil.splitPhoneNumber(value), "-"));
                } else {
                    out.println("");
                }
            } catch (Exception e) {
                out.println(value);
            }
            return EVAL_PAGE;
        } catch (IOException e) {
            throw new JspException();
        }
    }
}
