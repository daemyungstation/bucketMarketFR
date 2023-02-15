package common.exception;

import common.code.Const;
import common.code.Contract;
import common.code.Product;
import lombok.Getter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Getter
public class CustomHandleException extends RuntimeException {

    private static final long serialVersionUID = 2843698820057599074L;
    
    private Object error;
    private Object step;
    private String msg;
    
    public CustomHandleException (Object error) {
        this.error = error;
    }
    
    public CustomHandleException (Object error, Class<?> clazz) {
        this.error = error;
        if (clazz.equals(Const.class)) {
            errorLogging((common.code.Const.ERROR) error);
        } else if (clazz.equals(Product.class)) {
            errorLogging((common.code.Product.ERROR) error);
        } else if (clazz.equals(Contract.class)) {
            errorLogging((common.code.Contract.ERROR) error);
        }
    }
    
    public CustomHandleException (Object error, Object step, Class<?> clazz) {
        this.error = error;
        this.step = step;
        if (clazz.equals(Const.class)) {
            errorLogging((common.code.Const.ERROR) error);
        } else if (clazz.equals(Product.class)) {
            errorLogging((common.code.Product.ERROR) error);
        } else if (clazz.equals(Contract.class)) {
            errorLogging((common.code.Contract.ERROR) error);
        }
    }
    public CustomHandleException (Object error, String msg, Object step, Class<?> clazz) {
        this.error = error;
        this.step = step;
        this.msg = msg;
        if (clazz.equals(Const.class)) {
            errorLogging((common.code.Const.ERROR) error);
        } else if (clazz.equals(Product.class)) {
            errorLogging((common.code.Product.ERROR) error);
        } else if (clazz.equals(Contract.class)) {
            errorLogging((common.code.Contract.ERROR) error);
        }
    }
    
    private void errorLogging (common.code.Const.ERROR error) {
        log.error("============================== Common ERROR ==============================");
        log.error("ERROR CODE : [{}]", error.getCode());
        log.error("ERROR MESSAGE : [{}]", error.getMessage());
        log.error("============================================================================");
    }
    private void errorLogging (common.code.Product.ERROR error) {
        log.error("============================== Product ERROR ==============================");
        log.error("ERROR CODE : [{}]", error.getCode());
        log.error("ERROR MESSAGE : [{}]", error.getMessage());
        log.error("============================================================================");
    }
    private void errorLogging (common.code.Contract.ERROR error) {
        log.error("============================== Contract ERROR ==============================");
        log.error("ERROR CODE : [{}]", error.getCode());
        log.error("ERROR MESSAGE : [{}]", error.getMessage());
        log.error("============================================================================");
    }
}
