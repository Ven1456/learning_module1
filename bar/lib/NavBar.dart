import'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child:ListView(
      padding:EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text("VENKAT"), accountEmail: Text("VENKATS@GMAIL.COM"),
          currentAccountPicture: CircleAvatar(
            child:ClipOval(
              child:Image.network("https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
              height: 80,
                  width:80,
                  fit:BoxFit.cover
                  ),


            ),


          ),
decoration: BoxDecoration(
  image:DecorationImage(
    image:NetworkImage("https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000"),
    fit:BoxFit.cover,
  ),
),

          ),
ListTile(
  leading:Icon(Icons.home),
  title: Text("home"),
  onTap: ()=>null,
),
          ListTile(
            leading:Icon(Icons.notifications),
            title:Text("notification"),
            onTap: () => null,

          ),


          ListTile(
            leading:Icon(Icons.settings),
            title:Text("notification"),
            onTap: () => null,

          ),

          ListTile(
            leading:Icon(Icons.bluetooth),
            title:Text("notification"),
            onTap: () => null,

          ),

          ListTile(
            leading:Icon(Icons.audio_file),
            title:Text("notification"),
            onTap: () => null,

          ),

          ListTile(
            leading:Icon(Icons.mail),
            title:Text("notification"),
            onTap: () => null,

          ),

          ListTile(
            leading:Icon(Icons.privacy_tip),
            title:Text("notification"),
            onTap: () => null,

          ),

        ],
      )
    );
  }
}