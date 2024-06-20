import 'package:flutter/material.dart';

var menuDefaultBackground = Colors.white;
const kPrimaryColor = Color(0xFF3D82AE);
const kTextColor = Color(0xFF202E2E);
const kBackgroundColor = Color(0xFFF5F6F9);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
var myDrawer = Drawer(
  elevation: 0,
  
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.zero
    
  ),
  backgroundColor: menuDefaultBackground,
  child: Padding(
    padding: const EdgeInsets.only(left: 20, top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Image.asset(
            'assets/logotipo.png',
            height: 40,
          ),
          SizedBox(width: 10),
          Text(
            'SILOÉ',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        SizedBox(height: 30),
        Text(
          'MAIN MENU',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 15),
        _buildDrawerItem(Icons.dashboard, 'Dashboard', true),
        _buildDrawerItem(Icons.people, 'Ministros', false),
        _buildDrawerItem(Icons.group, 'Membros', false),
        Spacer(),
        _buildDrawerItem(Icons.settings, 'Settings', false),
        _buildDrawerItem(Icons.logout, 'Log Out', false),
        SizedBox(height: 20),
      ],
    ),
  ),
);

Widget _buildDrawerItem(IconData icon, String title, bool isSelected) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: isSelected ? kPrimaryColor : Colors.transparent,
    ),
    width: double.infinity,
    child: ListTile(
      leading: Icon(icon, color: isSelected ? Colors.white : kTextColor),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : kTextColor),
      ),
      onTap: () {
        // Handle tap
      },
    ),
  );
}
