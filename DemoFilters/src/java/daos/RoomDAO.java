/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.RoomDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author Admin
 */
public class RoomDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public RoomDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }
        if (preStm != null) {
            preStm.close();
        }
    }

    public RoomDTO getRoomByID(String id) throws Exception {
        RoomDTO result = null;
        try {
            String sql = "SELECT RoomName, Building, FloorNumber\n"
                    + "FROM RoomTBL\n"
                    + "WHERE RoomID=?";
            
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next()){
                String name = rs.getString("RoomName");
                String building = rs.getString("Building");
                int floor = rs.getInt("FloorNumber");
                result = new RoomDTO(id, name, building, floor);
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
    
    public List<RoomDTO> getAllRoom() throws Exception{
        List<RoomDTO> result = null;
        try{
            String sql = "SELECT RoomID, RoomName, Building, FloorNumber\n"
                    + "FROM RoomTBL\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while(rs.next()){
                String id = rs.getString("RoomID");
                String name = rs.getString("RoomName");
                String building = rs.getString("Building");
                int floor = rs.getInt("FloorNumber");
                
                RoomDTO dto = new RoomDTO(id, name, building, floor);
                result.add(dto);
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
}
