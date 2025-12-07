import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Text("الصفحة الرئيسية"),
        centerTitle: true,
        backgroundColor: Color(0xFF1E88E5),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet,
                size: 80,
                color: Color(0xFF1E88E5),
              ),
              SizedBox(height: 20),
              Text(
                "تتبع مصاريفك بكل سهولة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "قم بتسجيل دخلك ومصاريفك اليومية لتعرف كيف تتحكم في أموالك وتحقق أهدافك المالية.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF555555),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attach_money, size: 40, color: Color(0xFF43A047)),
                  SizedBox(width: 20),
                  Icon(Icons.shopping_cart, size: 40, color: Color(0xFFE53935)),
                  SizedBox(width: 20),
                  Icon(Icons.bar_chart, size: 40, color: Color(0xFFFFA726)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
