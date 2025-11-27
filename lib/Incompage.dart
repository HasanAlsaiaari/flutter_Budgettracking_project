import 'package:flutter/material.dart';
import 'AddIncomepage.dart';
import 'ListOfIncoms.dart';


class Incompage extends StatelessWidget {
  const Incompage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة الدخل'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('قائمة التنقل'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline,color: Colors.blue,),
              title: Text('إضافة دخل'),
              subtitle: Text('إضافة مصدر دخل جديد'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddIncomepage()),
                );
              },
              ),

              ListTile(
                leading: Icon(Icons.list_alt,color: Colors.orange,),
                title: Text('عرض قائمة الدخل'),
                subtitle: Text('عرض مصادر الدخل'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Listofincoms()),
                    ); 
                },
              )
          ],
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.attach_money,
                size: 80,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Text(
                'إدارة مصادر الدخل الخاصة بك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'أضف دخلك اليومي وراقب نمو أموالك بسهولة.',
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
                'عرض دخل      |      إضافة الدخل',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              )
            ],
          ),
        ),
      ),
    );
  }
}