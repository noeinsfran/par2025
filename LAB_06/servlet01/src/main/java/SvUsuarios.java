package py.una.pol.par;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Ejemplo de lista de usuarios en texto (podés reemplazar por base de datos más adelante)
        String[][] usuarios = {
            {"123", "Noelia", "Insfran", "123456"},
            {"456", "Carlos", "Lopez", "987654"},
            {"789", "Maria", "Gomez", "555666"}
        };

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body>");
            out.println("<h1>Lista de Usuarios</h1>");
            out.println("<table border='1'>");
            out.println("<tr><th>CI</th><th>Nombre</th><th>Apellido</th><th>Teléfono</th></tr>");
            for (String[] usuario : usuarios) {
                out.println("<tr>");
                out.println("<td>" + usuario[0] + "</td>");
                out.println("<td>" + usuario[1] + "</td>");
                out.println("<td>" + usuario[2] + "</td>");
                out.println("<td>" + usuario[3] + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</body></html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Redirigir la petición POST al método GET para reutilizar la lógica
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "SvUsuarios Servlet";
    }
}
