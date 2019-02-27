//package wangxiaoxi.test;
//
//import com.ming.hospital.service.PrescriptionService;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//public class TestSpring {
//
//    @Test
//    public void test(){
//
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:\\com\\ming\\hospital\\config\\spring\\spring-web.xml");
//        PrescriptionService ps = (PrescriptionService) applicationContext.getBean("prescriptionService");
//        ps.queryPrescription(Integer.valueOf("1234"));
//
//    }
//}
