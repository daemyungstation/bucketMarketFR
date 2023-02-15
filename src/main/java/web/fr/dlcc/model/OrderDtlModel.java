package web.fr.dlcc.model;

import java.math.BigDecimal;

public class OrderDtlModel implements java.io.Serializable {

    private static final long serialVersionUID = -2020644860851203639L;
    
    private String ordMstIdx;
    private Integer payNo;
    private String accntNo;
    private String payDay;
    private Integer payAmt;
    private Integer payAmt1;
    private Integer payAmt2;
    private String payMthd;
    private Integer paySum;
    private BigDecimal resnAmt = BigDecimal.ZERO;
    private String delFg;
    
    public String getOrdMstIdx() {
        return ordMstIdx;
    }
    public void setOrdMstIdx(String ordMstIdx) {
        this.ordMstIdx = ordMstIdx;
    }
    public Integer getPayNo() {
        return payNo;
    }
    public void setPayNo(Integer payNo) {
        this.payNo = payNo;
    }
    public String getAccntNo() {
        return accntNo;
    }
    public void setAccntNo(String accntNo) {
        this.accntNo = accntNo;
    }
    public String getPayDay() {
        return payDay;
    }
    public void setPayDay(String payDay) {
        this.payDay = payDay;
    }
    public Integer getPayAmt() {
        return payAmt;
    }
    public void setPayAmt(Integer payAmt) {
        this.payAmt = payAmt;
    }
    public Integer getPayAmt1() {
        return payAmt1;
    }
    public void setPayAmt1(Integer payAmt1) {
        this.payAmt1 = payAmt1;
    }
    public Integer getPayAmt2() {
        return payAmt2;
    }
    public void setPayAmt2(Integer payAmt2) {
        this.payAmt2 = payAmt2;
    }
    public String getPayMthd() {
        return payMthd;
    }
    public void setPayMthd(String payMthd) {
        this.payMthd = payMthd;
    }
    public Integer getPaySum() {
        return paySum;
    }
    public void setPaySum(Integer paySum) {
        this.paySum = paySum;
    }
    public BigDecimal getResnAmt() {
        return resnAmt;
    }
    public void setResnAmt(BigDecimal resnAmt) {
        this.resnAmt = resnAmt;
    }
    public String getDelFg() {
        return delFg;
    }
    public void setDelFg(String delFg) {
        this.delFg = delFg;
    }
    
}
