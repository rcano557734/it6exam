package db2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class MySQLConnection {
    
    public Connection getConnection() {
        Connection con;
        try {     
            String myDriver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/";
            
            Class.forName(myDriver);
            con = DriverManager.getConnection(url, "root", "");    
            createDatabaseAndTables(con);   
            // Connect to the new Hotel Database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hotel_Management_DB", "root", "");
            
            return con;
        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    private void createDatabaseAndTables(Connection con) {
        try {
            Statement st = con.createStatement();
            
            st.executeUpdate("CREATE DATABASE IF NOT EXISTS Hotel_Management_DB");
            st.executeUpdate("USE Hotel_Management_DB");

            String createGuestsTable = "CREATE TABLE IF NOT EXISTS guest_tbl ("
                    + "guest_id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "fname VARCHAR(50), "
                    + "lname VARCHAR(50)"
                    + ")";
            st.executeUpdate(createGuestsTable);

            String createRoomsTable = "CREATE TABLE IF NOT EXISTS room_tbl ("
                    + "room_id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "room_type VARCHAR(50), "
                    + "price DOUBLE"
                    + ")";
            st.executeUpdate(createRoomsTable);

            String createReservationTable = "CREATE TABLE IF NOT EXISTS reservation_tbl ("
                    + "reservation_id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "guest_id INT, "
                    + "room_id INT, "
                    + "date VARCHAR(50), "
                    + "FOREIGN KEY (guest_id) REFERENCES Guests_Tbl(guest_id) ON DELETE CASCADE ON UPDATE CASCADE, "
                    + "FOREIGN KEY (room_id) REFERENCES Rooms_Tbl(room_id) ON DELETE CASCADE ON UPDATE CASCADE"
                    + ")";
            st.executeUpdate(createReservationTable);

            System.out.println("Hotel Database and tables created successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void executeSQLQuery(String query, String message) {
        Connection con = getConnection();
        Statement st;
        try {
            st = con.createStatement();
            if((st.executeUpdate(query)) == 1) {
                System.out.println("Success: " + message);
            } else {
                System.out.println("Failed: " + message);
            }
        } catch(Exception ex){
            ex.printStackTrace();
        }
    }
}