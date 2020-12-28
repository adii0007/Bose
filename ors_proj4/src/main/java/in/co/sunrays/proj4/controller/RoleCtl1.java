package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.util.jar.Attributes.Name;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.RoleBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.RoleModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;
import junit.framework.Protectable;

public class RoleCtl1 extends BaseCtl {

	@Override
	protected boolean validate(HttpServletRequest request) {
		// TODO Auto-generated method stub
		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("name"))) {
			request.setAttribute("name", PropertyReader.getValue("error.require ", "Name"));
			pass = false;

		} else if (!DataValidator.isFname(DataUtility.getString(request.getParameter("name")))) {
			request.setAttribute("name", PropertyReader.getValue("error.lname", " Name "));
			pass = false;

		}

		if (DataValidator.isNull(request.getParameter("description"))) {
			request.setAttribute("description", PropertyReader.getValue("error.require", "Description"));
			pass = false;

		} else if (!DataValidator.isFname(DataUtility.getString(request.getParameter("description")))) {
			request.setAttribute("description", PropertyReader.getValue("error.Fname", "Description"));
			pass = false;
		}
		return pass;
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		RoleBean bean = new RoleBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setName(DataUtility.getString(request.getParameter("Name")));
		bean.setDescription(DataUtility.getString(request.getParameter("description")));

		populateDTO(bean, request);

		return bean;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op = DataUtility.getString(request.getParameter("operation"));

		RoleModel model = new RoleModel();

		long id = DataUtility.getLong(request.getParameter("id"));

		if (id > 0 || op != null) {

			RoleBean bean;

			try {

				bean = model.findByPK(id);
				ServletUtility.setBean(bean, request);

			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				return;

			}
		}

		ServletUtility.forward(getView(), request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op = DataUtility.getString(request.getParameter("operation"));

		RoleModel model = new RoleModel();

		long id = DataUtility.getLong(request.getParameter("id"));

		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {

			RoleBean Bean = new RoleBean();

			try {
				if (id > 0) {
					model.update(Bean);
					ServletUtility.setBean(Bean, request);
					ServletUtility.setSuccessMessage("Data is sucessfully update", request);
				} else {
					long pk = model.add(Bean);
					Bean.setId(pk);
					ServletUtility.setSuccessMessage("Data is successfully", request);
				}
			} catch (ApplicationException e) {
				ServletUtility.setBean(Bean, request);
				ServletUtility.setSuccessMessage("Data is successfully saved", request);

			}

			catch (DuplicateRecordException e) {
				ServletUtility.setBean(Bean, request);
				ServletUtility.setErrorMessage("role already exist", request);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			RoleBean bean = (RoleBean) populateBean(request);
			try {
				model.delete(bean);
				ServletUtility.redirect(ORSView.ROLE_LIST_CTL, request, response);
				return;

			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.Role_list_CTL, request, response);
			return;

		}

		ServletUtility.forward(getView1(), request, response);

	}

	@Override
	protected String getView1() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return null;
	}

}
