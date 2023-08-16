package util;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import model.medicosExames.MedicosExames;

@WebListener
public class DestruirSessaoMedicosExames implements HttpSessionListener {

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		MedicosExames medicosExames = (MedicosExames) session.getAttribute("medicosExames");

		if (medicosExames != null) {
			dao.MedicosExamesDAO.excluir(medicosExames);
		}
	}

}