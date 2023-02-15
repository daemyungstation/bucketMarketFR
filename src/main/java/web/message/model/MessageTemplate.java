package web.message.model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

// 메세지 템플릿
public class MessageTemplate {

    @JsonIgnore
    private String title; // 타이틀
    @JsonIgnore
    private String message; // 메세지
    @JsonInclude(Include.NON_NULL)
    private List<MessageButton> button = null; // 버튼 목록

    // 웹 링크 버튼 추가
    public void addWebLinkButton(String name, String mobileUrl, String pcUrl) {
        if (button == null) {
            button = new ArrayList<>();
        }
        MessageButton btn = new MessageButton();
        btn.setType(MessageButtonType.WEB_LINK);
        btn.setName(name);
        btn.setUrl_mobile(mobileUrl);
        btn.setUrl_pc(pcUrl);
        this.button.add(btn);
    }
    
    public void addWebLinkButton(String name, String mobileUrl, String pcUrl, String target) {
        if (button == null) {
            button = new ArrayList<>();
        }
        MessageButton btn = new MessageButton();
        btn.setType(MessageButtonType.WEB_LINK);
        btn.setName(name);
        btn.setUrl_mobile(mobileUrl);
        btn.setUrl_pc(pcUrl);
        btn.setTarget(target);
        this.button.add(btn);
    }

    // 앱 링크 버튼 추가
    public void addAppLinkButton(String name, String iosScheme, String androidScheme) {
        if (button == null) {
            button = new ArrayList<>();
        }
        MessageButton btn = new MessageButton();
        btn.setType(MessageButtonType.APP_LINK);
        btn.setName(name);
        btn.setScheme_ios(iosScheme);
        btn.setScheme_android(androidScheme);
        this.button.add(btn);
    }

    // 메세지 전달 버튼 추가
    public void addMessageDeleveryButton(String name) {
        if (button == null) {
            button = new ArrayList<>();
        }
        MessageButton btn = new MessageButton();
        btn.setType(MessageButtonType.MESSAGE_DELEVERRY);
        btn.setName(name);
        this.button.add(btn);
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<MessageButton> getButton() {
        return button;
    }

}
