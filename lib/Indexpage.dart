import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Incompage.dart';
import 'Expensepage.dart';
import 'Accountpage.dart';




class Indexpage extends StatefulWidget {
const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {

int _bottomNavbar = 0;

List<Widget>_pages = [
  Homepage(),
  Incompage(),
  Expensepage(),
  Accountpage(),
];

String _gettitle(int index)
{
  switch(index)
  {
    case 0:
    return "الصفحة الرئيسية";

    case 1:
    return "صفحة الدخل";

    case 2:
    return "صفحة المصروفات";

    case 3:
    return "صفحة الحساب";

    default:
    return "Data";

  }

  
}


  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
        body: IndexedStack(
          index: _bottomNavbar,
          children: _pages,
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavbar,
          onTap: (index){
            setState(() {
              _bottomNavbar = index;
            });
          },
           unselectedItemColor: Colors.grey,
           selectedItemColor: Colors.blue,

           items:
           [
            BottomNavigationBarItem(label: 'الرئيسية',icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'الدخل',icon: Icon(Icons.attach_money)),
            BottomNavigationBarItem(label: 'المصروفات',icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(label: 'الحساب',icon: Icon(Icons.balance_outlined)),

           ],
          
          
          ),

    );
    
  }
}