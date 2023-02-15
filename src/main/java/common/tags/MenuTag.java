package common.tags;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import common.util.renderer.MenuRenderer;

public class MenuTag extends TagSupport {

    private static final long serialVersionUID = -2105985948054380683L;

    private String group;
    
    private List<Map<String, Object>> categoryList;
    
    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public List<Map<String, Object>> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Map<String, Object>> categoryList) {
        this.categoryList = categoryList;
    }

    @Override
    public int doEndTag() throws JspException {
        try {
            String menu = "";
            if (categoryList != null) {
                menu += MenuRenderer.renderCategoryMenu(group, categoryList);
            } else {
                menu += MenuRenderer.renderMenu(group);
            }
            pageContext.getOut().println(menu);
            return EVAL_PAGE;
        } catch (IOException e) {
            throw new JspException();
        }
    }
    
}
