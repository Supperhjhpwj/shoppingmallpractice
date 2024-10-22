import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class testdb {

    // Database credentials and URL
    static final String DB_URL = "jdbc:mysql://localhost:3306/shopping_person";
    static final String USER = "root";
    static final String PASS = "1234";

    public static void main(String[] args) {
        // SQL query to fetch data
        String query = "SELECT * FROM members";

        // Step 1: Establishing a connection
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS)) {

            // Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            // Step 3: Execute the query, get a ResultSet object
            ResultSet resultSet = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object
            while (resultSet.next()) {
                // Retrieve by column name
                String username = resultSet.getString(1);
                String password = resultSet.getString(2);

                // Display values
                System.out.println("Username: " + username + ", Password: " + password);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
