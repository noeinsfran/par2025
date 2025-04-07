import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

public class Test02 {
    public static void main(String[] args) {
        // URL para probar HTTP
        String httpUrl = "http://grado.pol.una.py";
        // URL para probar HTTPS
        String httpsUrl = "https://grado.pol.una.py";

        System.out.println("Haciendo solicitud HTTP:");
        try {
            hacerHttpRequest(httpUrl);
        } catch (IOException e) {
            System.out.println("Error en la solicitud HTTP: " + e.getMessage());
        }

        System.out.println("\nHaciendo solicitud HTTPS:");
        try {
            hacerHttpsRequest(httpsUrl);
        } catch (IOException e) {
            System.out.println("Error en la solicitud HTTPS: " + e.getMessage());
        }
    }

    // Función para hacer una llamada HTTP
    private static void hacerHttpRequest(String urlString) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // Configuración de la solicitud HTTP
        connection.setRequestMethod("GET");

        // Comprobación del código de respuesta
        int responseCode = connection.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            System.out.println("HTTP Error: " + responseCode);
            return;
        }

        // Lectura de la respuesta
        try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            System.out.println(response.toString());
        } finally {
            // Cerrar la conexión
            connection.disconnect();
        }
    }

    // Función para hacer una llamada HTTPS
    private static void hacerHttpsRequest(String urlString) throws IOException {
        URL url = new URL(urlString);
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();

        // Configuración de la solicitud HTTPS
        connection.setRequestMethod("GET");

        // Comprobación del código de respuesta
        int responseCode = connection.getResponseCode();
        if (responseCode != HttpsURLConnection.HTTP_OK) {
            System.out.println("HTTPS Error: " + responseCode);
            return;
        }

        // Lectura de la respuesta
        try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            System.out.println(response.toString());
        } finally {
            // Cerrar la conexión
            connection.disconnect();
        }
    }
}
