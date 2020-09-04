package IT16178700.servlet.dbconnecter;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kaushi
 *
 *
 **/

public class DBConnect {

    // static member holds only one instance of the JDBCSingleton class.

    private static DBConnect jdbc;

    // Logger add for DBConnect class
    private final static Logger LOGGER = Logger.getLogger(DBConnect.class.getName());

    // JDBCSingleton prevents the instantiation from any other class.
    private DBConnect() {  }

    // Now we are providing global point of access.
    public static DBConnect getInstance() {
        if (jdbc==null)
        {
            jdbc=new  DBConnect();
        }
        return jdbc;
    }

    // to get the connection from methods like insert, view etc.
    public static Connection getConnection()throws ClassNotFoundException, SQLException
    {

        Connection con=null;
        Class.forName("com.mysql.jdbc.Driver");
        con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travelbybus", "root", "");
        System.out.println("Server connected");
        LOGGER.info("Logger Name: " + LOGGER.getName());

        return con;

    }

    // to insert the record into the database
    public int insert(String name, String pass) throws SQLException
    {
        Connection c=null;

        PreparedStatement ps=null;

        int recordCounter=0;

        try {

            c=this.getConnection();
            ps=c.prepareStatement("insert into userdata(uname,upassword)values(?,?)");
            ps.setString(1, name);
            ps.setString(2, pass);
            recordCounter=ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.warning("Error : Data Inserting "+ e);
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, e);
        } finally{
            if (ps!=null){
                ps.close();
            }if(c!=null){
                c.close();
            }
        }
        return recordCounter;
    }

    // to view the data from the database
    public  void view(String name) throws SQLException
    {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con=this.getConnection();
            ps=con.prepareStatement("select * from userdata where uname=?");
            ps.setString(1, name);
            rs=ps.executeQuery();
            while (rs.next()) {
                System.out.println("Name= "+rs.getString(2)+"\t"+"Password= "+rs.getString(3));

            }

        } catch (Exception e) {
            System.out.println(e);
            LOGGER.warning("Error : Data Viewing "+ e);
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            if(rs!=null){
                rs.close();
            }if (ps!=null){
                ps.close();
            }if(con!=null){
                con.close();
            }
        }
    }

    // to update the password for the given username
    public int update(String name, String password) throws SQLException  {
        Connection c=null;
        PreparedStatement ps=null;

        int recordCounter=0;
        try {
            c=this.getConnection();
            ps=c.prepareStatement(" update userdata set upassword=? where uname='"+name+"' ");
            ps.setString(1, password);
            recordCounter=ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.warning("Error : Data Updating "+ e);
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, e);
        } finally{

            if (ps!=null){
                ps.close();
            }if(c!=null){
                c.close();
            }
        }
        return recordCounter;
    }

    // to delete the data from the database
    public int delete(int userid) throws SQLException{
        Connection c=null;
        PreparedStatement ps=null;
        int recordCounter=0;
        try {
            c=this.getConnection();
            ps=c.prepareStatement(" delete from userdata where uid='"+userid+"' ");
            recordCounter=ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            LOGGER.warning("Error : Data Deleting "+ e);
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            if (ps!=null){
                ps.close();
            }if(c!=null){
                c.close();
            }
        }
        return recordCounter;
    }
}// End of JDBCSingleton class
