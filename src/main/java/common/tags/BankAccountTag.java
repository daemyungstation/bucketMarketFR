package common.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;

public class BankAccountTag extends TagSupport {

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
                    value = StringUtils.left(value, 3) + StringUtils.repeat("*", (value.length() - 6 < 1) ? 1 : value.length() - 6) + StringUtils.right(value, 3);
                    out.println(value);
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
