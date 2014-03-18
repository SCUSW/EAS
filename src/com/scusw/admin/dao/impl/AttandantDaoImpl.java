package com.scusw.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.scusw.admin.dao.AttandantDao;
import com.scusw.model.CourseInfo;
import com.scusw.model.StaffAttandant;
import com.scusw.model.StudentAttendant;

public class AttandantDaoImpl extends HibernateDaoSupport implements
		AttandantDao {

	public List<StaffAttandant> queryStaffAttendant(int currentPage,
			int pageSize, String staffName, String staffNo) {
		// TODO Auto-generated method stub
		Query query = this
				.getSession()
				.createQuery(
						"from StaffAttandant sa "
								+ "where sa.staffInfo.staffName like :staffName  and sa.staffInfo.staffNo like :staffNo "
								+ "order by sa.attendantTime desc");
		query.setParameter("staffName", "%" + staffName + "%");
		query.setParameter("staffNo", "%" + staffNo + "%");
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StaffAttandant> list = query.list();
		return list;
	}

	public List<StaffAttandant> queryStaffAttendantByDepartment(
			int currentPage, int pageSize, int departmentId, String staffName,
			String staffNo) {
		// TODO Auto-generated method stub
		Query query = this
				.getSession()
				.createQuery(
						"from StaffAttandant sa "
								+ "where sa.staffInfo.positionInfo.departmentInfo.departmentId=:departmentId "
								+ "and sa.staffInfo.staffName like :staffName  and sa.staffInfo.staffNo like :staffNo "
								+ "order by sa.attendantTime desc");
		query.setParameter("departmentId", departmentId);
		query.setParameter("staffName", "%" + staffName + "%");

		query.setParameter("staffNo", "%" + staffNo + "%");
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StaffAttandant> list = query.list();
		return list;
	}

	public int getTotleStaffAttendant(String staffName, String staffNo) {
		// TODO Auto-generated method stub
		List<StaffAttandant> list = (List<StaffAttandant>) this
				.getSession()
				.createQuery(
						"from StaffAttandant sa where sa.staffInfo.staffName like :staffName and sa.staffInfo.staffNo like :staffNo")
				.setParameter("staffName", "%" + staffName + "%")
				.setParameter("staffNo", "%" + staffNo + "%")
				.setParameter("staffNo", "%" + staffNo + "%").list();

		return list.size();
	}

	public int getTotleStaffAttendant(String staffName, int departmentId,
			String staffNo) {
		// TODO Auto-generated method stub
		List<StaffAttandant> list = (List<StaffAttandant>) this
				.getSession()
				.createQuery(
						"from StaffAttandant sa where sa.staffInfo.staffName like :staffName and sa.staffInfo.staffNo like :staffNo and sa.staffInfo.positionInfo.departmentInfo.departmentId=:departmentId")
				.setParameter("staffName", "%" + staffName + "%")
				.setParameter("staffNo", "%" + staffNo + "%")
				.setParameter("departmentId", departmentId).list();

		return list.size();
	}

	public int getTotleStuAttendant(String studentName, String studentNo) {
		// TODO Auto-generated method stub
		List<StudentAttendant> list = (List<StudentAttendant>) this
				.getSession()
				.createQuery(
						"from StudentAttendant sa where sa.registerInfo.studentInfo.studentName like :studentName and sa.registerInfo.studentInfo.studentNo like :studentNo ")
				.setParameter("studentName", "%" + studentName + "%")
				.setParameter("studentNo", "%" + studentNo + "%").list();

		return list.size();
	}

	public int getTotleStuAttendantByGrade(String studentName,
			String studentNo, int gradeId) {
		// TODO Auto-generated method stub
		List<StudentAttendant> list = (List<StudentAttendant>) this
				.getSession()
				.createQuery(
						"from StudentAttendant sa where sa.registerInfo.studentInfo.studentName like :studentName and sa.registerInfo.studentInfo.studentNo like :studentNo and sa.registerInfo.studentInfo.classInfo.gradeInfo.gradeId=:gradeId")
				.setParameter("studentName", "%" + studentName + "%")
				.setParameter("studentNo", "%" + studentNo + "%")
				.setParameter("gradeId", gradeId).list();

		return list.size();
	}

	public int getTotleStuAttendantByCourse(String studentName,
			String studentNo, int courseId) {
		// TODO Auto-generated method stub
		List<StudentAttendant> list = (List<StudentAttendant>) this
				.getSession()
				.createQuery(
						"from StudentAttendant sa where sa.registerInfo.studentInfo.studentName like :studentName and sa.registerInfo.studentInfo.studentNo like :studentNo and sa.registerInfo.courseInfo.courseId=:courseId")
				.setParameter("studentName", "%" + studentName + "%")
				.setParameter("studentNo", "%" + studentNo + "%")
				.setParameter("courseId", courseId).list();

		return list.size();
	}

	public int getTotleStuAttendant(String studentName, String studentNo,
			int gradeId, int courseId) {
		// TODO Auto-generated method stub
		List<StudentAttendant> list = (List<StudentAttendant>) this
				.getSession()
				.createQuery(
						"from StudentAttendant sa where sa.registerInfo.studentInfo.studentName like :studentName and sa.registerInfo.studentInfo.studentNo like :studentNo and sa.registerInfo.studentInfo.classInfo.gradeInfo.gradeId=:gradeId and sa.registerInfo.courseInfo.courseId=:courseId")
				.setParameter("studentName", "%" + studentName + "%")
				.setParameter("studentNo", "%" + studentNo + "%")
				.setParameter("gradeId", gradeId)
				.setParameter("courseId", courseId).list();

		return list.size();
	}

	public List<StudentAttendant> queryStuAttendant(int currentPage,
			int pageSize, String studentName, String studentNo) {
		// TODO Auto-generated method stub
		Query query = this
				.getSession()
				.createQuery(
						"from StudentAttendant sa "
								+ "where sa.registerInfo.studentInfo.studentName like :studentName "
								+ "and sa.registerInfo.studentInfo.studentNo like :studentNo "
								+ "order by sa.attendantTime desc");
		query.setParameter("studentName", "%" + studentName + "%");
		query.setParameter("studentNo", "%" + studentNo + "%");
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StudentAttendant> list = query.list();
		return list;
	}

	public List<StudentAttendant> queryStuAttendantByGrade(int currentPage,
			int pageSize, String studentName, String studentNo, int gradeId) {
		// TODO Auto-generated method stub
		Query query = this
				.getSession()
				.createQuery(
						"from StudentAttendant sa "
								+ "where sa.registerInfo.studentInfo.studentName like :studentName "
								+ "and sa.registerInfo.studentInfo.studentNo like :studentNo "
								+ "and sa.registerInfo.studentInfo.classInfo.gradeInfo.gradeId=:gradeId "
								+ "order by sa.attendantTime desc");
		query.setParameter("studentName", "%" + studentName + "%");
		query.setParameter("studentNo", "%" + studentNo + "%");
		query.setParameter("gradeId", gradeId);
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StudentAttendant> list = query.list();
		return list;
	}

	public List<StudentAttendant> queryStuAttendantByCourse(int currentPage,
			int pageSize, String studentName, String studentNo, int courseId) {
		// TODO Auto-generated method stub
		Query query = this
				.getSession()
				.createQuery(
						"from StudentAttendant sa "
								+ "where sa.registerInfo.studentInfo.studentName like :studentName "
								+ "and sa.registerInfo.studentInfo.studentNo like :studentNo "
								+ "and sa.registerInfo.courseInfo.courseId=:courseId "
								+ "order by sa.attendantTime desc");
		query.setParameter("studentName", "%" + studentName + "%");
		query.setParameter("studentNo", "%" + studentNo + "%");
		query.setParameter("courseId", courseId);
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StudentAttendant> list = query.list();
		return list;
	}

	public List<StudentAttendant> queryStuAttendant(int currentPage,
			int pageSize, String studentName, String studentNo, int gradeId,
			int courseId) {
		// TODO Auto-generated method stub
		Query query = this
				.getSession()
				.createQuery(
						"from StudentAttendant sa "
								+ "where sa.registerInfo.studentInfo.studentName like :studentName "
								+ "and sa.registerInfo.studentInfo.studentNo like :studentNo "
								+ "and sa.registerInfo.studentInfo.classInfo.gradeInfo.gradeId=:gradeId "
								+ "and sa.registerInfo.courseInfo.courseId=:courseId "
								+ "order by sa.attendantTime desc");
		query.setParameter("studentName", "%" + studentName + "%");
		query.setParameter("studentNo", "%" + studentNo + "%");
		query.setParameter("courseId", courseId);
		query.setParameter("gradeId", gradeId);
		int startRow = (currentPage - 1) * pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<StudentAttendant> list = query.list();
		return list;
	}

	public List<CourseInfo> queryCourseInfo() {
		// TODO Auto-generated method stub
		return this.getSession().createQuery("from CourseInfo").list();
	}

}
