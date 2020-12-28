package in.co.sunrays.proj4.model.test;

import in.co.sunrays.proj4.bean.UserBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.exception.RecordNotFoundException;
import in.co.sunrays.proj4.model.UserModel;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;

/**
 * User Model Test classes
 *
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */
public class UserModelTest {

    /**
     * Model object to test
     */

    public static UserModel model = new UserModel();

    /**
     * Main method to call test methods.
     *
     * @param args
     * @throws Exception 
     */
    public static void main(String[] args) throws Exception {
         //testAdd();
         //testDelete();
         //testUpdate();
        // testFindByPK();
        // testFindByLogin();
        // testSearch();
        // testGetRoles();
         //testList();
        // testAuthenticate();
        // testRegisterUser();
        // testchangePassword();
         testforgetPassword();
        //testresetPassword();

    }

    /**
     * Tests add a User
     * @throws Exception 
     */
    public static void testAdd() throws Exception {

        try {
            UserBean bean = new UserBean();
            SimpleDateFormat sdf = new SimpleDateFormat("MM-DD-yyy");

            // bean.setId(5234L);
            bean.setFirstName("adity");
            bean.setLastName("pal");
            bean.setLogin("aditypal@gmail.com");
            bean.setPassword("12345");
            bean.setDob(sdf.parse("22-09-1993"));
            bean.setRoleId(1L);
            bean.setUnSuccessfulLogin(2);
            bean.setGender("Male");
            bean.setLastLogin(new Timestamp(new Date().getTime()));
            bean.setLock("Yes");
            bean.setConfirmPassword("12345");
            bean.setMobileNo("9826212991");
            long pk = model.add(bean);
            UserBean addedbean = model.findByPK(pk);
            System.out.println("Test add succ");
            if (addedbean == null) {
                System.out.println("Test add fail");
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }

    /**
     * Tests delete a User
     */
    public static void testDelete() {

        try {
            UserBean bean = new UserBean();
            long pk = 0L;
            bean.setId(pk);
            model.delete(bean);
            System.out.println("Test Delete succ" + bean.getId());
            UserBean deletedbean = model.findByPK(pk);
            if (deletedbean == null) {
                System.out.println("Test Delete fail");
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }

    /**
     * Tests update a User
     * @throws Exception 
     */
    public static void testUpdate() throws Exception {
        
            UserBean bean = model.findByPK(3L);
            bean.setFirstName("sumit");
            bean.setLastName("malwe");
            bean.setLogin("malwesumit@gmail.com");
            bean.setPassword("pass123");

            model.update(bean);

            UserBean updatedbean = model.findByPK(3L);
            if (!"ranjit".equals(updatedbean.getLogin())) {
                System.out.println("Test Update fail");
            }
      
    }

    /**
     * Tests find a User by PK.
     */
    public static void testFindByPK() {
        try {
            UserBean bean = new UserBean();
            long pk = 1L;
            bean = model.findByPK(pk);
            if (bean == null) {
                System.out.println("Test Find By PK fail");
            }
            System.out.println(bean.getId());
            System.out.println(bean.getFirstName());
            System.out.println(bean.getLastName());
            System.out.println(bean.getLogin());
            System.out.println(bean.getPassword());
            System.out.println(bean.getDob());
            System.out.println(bean.getRoleId());
            System.out.println(bean.getUnSuccessfulLogin());
            System.out.println(bean.getGender());
            System.out.println(bean.getLastLogin());
            System.out.println(bean.getLock());
        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }

    /**
     * Tests find a User by Login.
     */
    public static void testFindByLogin() {
        try {
            UserBean bean = new UserBean();
            bean = model.findByLogin("545");
            if (bean == null) {
                System.out.println("Test Find By PK fail");
            }
            System.out.println(bean.getId());
            System.out.println(bean.getFirstName());
            System.out.println(bean.getLastName());
            System.out.println(bean.getLogin());
            System.out.println(bean.getPassword());
            System.out.println(bean.getDob());
            System.out.println(bean.getRoleId());
            System.out.println(bean.getUnSuccessfulLogin());
            System.out.println(bean.getGender());
            System.out.println(bean.getLastLogin());
            System.out.println(bean.getLock());
        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }

    /**
     * Tests get Roles.
     */
    public static void testGetRoles() {

        try {
            UserBean bean = new UserBean();
            List list = new ArrayList();
            bean.setRoleId(2L);
            list = model.getRoles(bean);
            if (list.size() < 0) {
                System.out.println("Test Get Roles fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (UserBean) it.next();
                System.out.println(bean.getId());
                System.out.println(bean.getFirstName());
                System.out.println(bean.getLastName());
                System.out.println(bean.getLogin());
                System.out.println(bean.getPassword());
                System.out.println(bean.getDob());
                System.out.println(bean.getRoleId());
                System.out.println(bean.getUnSuccessfulLogin());
                System.out.println(bean.getGender());
                System.out.println(bean.getLastLogin());
                System.out.println(bean.getLock());
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }

    /**
     * Tests get Search
     */
    public static void testSearch() {

        try {
            UserBean bean = new UserBean();
            List list = new ArrayList();
            bean.setFirstName("ranjeet");
            list = model.search(bean, 0, 0);
            if (list.size() < 0) {
                System.out.println("Test Serach fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (UserBean) it.next();
                System.out.println(bean.getId());
                System.out.println(bean.getFirstName());
                System.out.println(bean.getLastName());
                System.out.println(bean.getLogin());
                System.out.println(bean.getPassword());
                System.out.println(bean.getDob());
                System.out.println(bean.getRoleId());
                System.out.println(bean.getUnSuccessfulLogin());
                System.out.println(bean.getGender());
                System.out.println(bean.getLastLogin());
                System.out.println(bean.getLock());
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }

    /**
     * Tests get List.
     */
    public static void testList() {

        try {
            UserBean bean = new UserBean();
            List list = new ArrayList();
            list = model.list(1, 10);
            if (list.size() < 0) {
                System.out.println("Test list fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (UserBean) it.next();
                System.out.println(bean.getId());
                System.out.println(bean.getFirstName());
                System.out.println(bean.getLastName());
                System.out.println(bean.getLogin());
                System.out.println(bean.getPassword());
                System.out.println(bean.getDob());
                System.out.println(bean.getRoleId());
                System.out.println(bean.getUnSuccessfulLogin());
                System.out.println(bean.getGender());
                System.out.println(bean.getLastLogin());
                System.out.println(bean.getLock());
                System.out.println(bean.getMobileNo());
                System.out.println(bean.getCreatedBy());
                System.out.println(bean.getModifiedBy());
                System.out.println(bean.getCreatedDatetime());
                System.out.println(bean.getModifiedDatetime());
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }

    /**
     * Tests authenticate User.
     * @throws Exception 
     */
    public static void testAuthenticate() throws Exception {

        try {
            UserBean bean = new UserBean();
            bean.setLogin("kumar@g.com");
            bean.setPassword("rr");
            bean = model.authenticate(bean.getLogin(), bean.getPassword());
            if (bean != null) {
                System.out.println("Successfully login");

            } else {
                System.out.println("Invalied login Id & password");
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }

    /**
     * Tests add a User register
     * @throws Exception 
     */

    public static void testRegisterUser() throws Exception {
        try {
            UserBean bean = new UserBean();
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

            // bean.setId(8L);
            bean.setFirstName("vipin");
            // bean.setLastName("kumawat");
            bean.setLogin("rranjitch11ou1dhay@gmail.com");
            bean.setPassword("rr");
            bean.setConfirmPassword("4444");
            bean.setDob(sdf.parse("11/20/2015"));
            bean.setGender("Male");
            bean.setRoleId(2);
            long pk = model.registerUser(bean);
            System.out.println("Successfully register");
            System.out.println(bean.getFirstName());
            System.out.println(bean.getLogin());
            System.out.println(bean.getLastName());
            System.out.println(bean.getDob());
            UserBean registerbean = model.findByPK(pk);
            if (registerbean != null) {
                System.out.println("Test registation fail");
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        } catch (DuplicateRecordException e) {
            e.printStackTrace();
        }
    }

    /**
     * Tests changepassword
     * @throws Exception 
     *
     * @throws ParseException
     */
    public static void testchangePassword() throws Exception {

        try {
            UserBean bean = model.findByLogin("ranjitchoudhary20@gmail.com");
            String oldPassword = bean.getPassword();
            bean.setId(15l);
            bean.setPassword("88");
            bean.setConfirmPassword("kk");
            String newPassword = bean.getPassword();
            try {
                model.changePassword(15L, oldPassword, newPassword);
                System.out.println("password has been change successfully");
            } catch (RecordNotFoundException e) {
                e.printStackTrace();
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }

    /**
     * Tests fogetPassword
     * @throws MessagingException 
     *
     * @throws ParseException
     */
    public static void testforgetPassword() throws MessagingException {
        try {
            boolean b = model.forgetPassword("malwesumit@gmail.com");

            System.out.println("Suucess : Test Forget Password Success");

        } catch (RecordNotFoundException e) {
            e.printStackTrace();
        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }

    /**
     * Tests resetPassword
     * @throws Exception 
     *
     * @throws ParseException
     */
    public static void testresetPassword() throws Exception {
        UserBean bean = new UserBean();
        try {
            bean = model.findByLogin("ranjitchoudhary20@gmail.com");
            if (bean != null) {
                boolean pass = model.resetPassword(bean);
                if (pass = false) {
                    System.out.println("Test Update fail");
                }
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }
}
