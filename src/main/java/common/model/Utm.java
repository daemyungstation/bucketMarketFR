package common.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class Utm implements Serializable {
    private static final long serialVersionUID = -3831858529241236326L;
    
    private String UTM_SOURCE;
    private String UTM_MEDIUM;
    private String UTM_CAMPAIGN;
    private String UTM_TERM;
    private String UTM_CONTENT;
}