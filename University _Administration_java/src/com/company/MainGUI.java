package com.company;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.Vector;


public class MainGUI {
    private JButton find_btn;
    private JPanel Main;
    private JTable resultsTable;
    private JTextField firstName_textField;
    private JLabel lastName_label;
    private JLabel firstName_label;
    private JLabel mail_label;
    private JLabel results_label;
    private JTextField lastName_textField;
    private final DefaultTableModel tableModel = new DefaultTableModel(null, new String[] {"First Name", "Last Name", "User ID", "Course", "Status", "Grade"});
    private static String connectionState = null;

    public static void main(String[] args) {

        Services con =  new Services();
        connectionState = con.ConnectToDB();

        JFrame frame = new JFrame("DataApp");
        frame.setContentPane(new MainGUI().Main);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    public MainGUI() {

        results_label.setText(connectionState);
        resultsTable.setModel(tableModel);
        find_btn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String lastName = lastName_textField.getText().toUpperCase();
                String firstName = firstName_textField.getText().toUpperCase();
                ResultSet rs;
                results_label.setText("");

                try {
                    rs  = Services.fetchStudent(lastName, firstName);
                    populateTable(rs);

                    if (!rs.first())
                        results_label.setText("Student Not Found");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        });
    }

    private  void connectionStateInfo(String connectionState) {
        results_label.setText(connectionState);
    }

    private void populateTable(ResultSet rs) throws SQLException {
        tableModel.setNumRows(0);
        rs.beforeFirst();

        while (rs.next()) {
                Vector<Object> vector = new Vector<Object>();
                for (int i = 1; i <= 6; i++) {
                    vector.add(rs.getObject(i));
                }
                tableModel.addRow(vector);
        }
        tableModel.fireTableDataChanged();
    }
}
