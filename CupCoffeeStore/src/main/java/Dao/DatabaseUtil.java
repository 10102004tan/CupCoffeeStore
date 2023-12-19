package Dao;
import java.sql.DriverManager;
import com.mysql.jdbc.Connection;
public class DatabaseUtil {
    public static Connection getConnection()
    {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_db?useUnicode=yes&characterEncoding=UTF-8","root","");
        } catch (Exception e) {
            System.err.println(e);
        }
        return con;
    }
    

    

            
}
