import 'package:flutter/material.dart';
import 'AddExpensePage.dart';
import 'ListOfExpenses.dart';

class Expensepage extends StatelessWidget {
  const Expensepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة المصروفات'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'قائمة التنقل',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline, color: Colors.blue,),
              title: Text('إضافة مصروف'),
              subtitle: Text('إضافة مصروف جديد'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddExpensePage()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.list_alt,color: Colors.orange,),
              title: Text('عرض قائمة المصروفات'),
              subtitle: Text('عرض جميع المصروفات'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListofExpenses()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.money_off,
                size: 80,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Text(
                'إدارة مصروفاتك الخاصة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'سجل مصروفاتك اليومية وتابع ميزانيتك بسهولة.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline, size: 40, color: Colors.blue),
                  SizedBox(width: 20),
                  Icon(Icons.list_alt, size: 40, color: Colors.orange),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'عرض مصروف  |  إضافة مصروف',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
