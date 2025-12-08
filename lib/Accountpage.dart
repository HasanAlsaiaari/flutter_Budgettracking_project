import 'package:flutter/material.dart';
import 'package:flutter_ui_project/classes.dart';


class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage>
{
  double _balance = 0.0;
  double _totalIncome = 0.0;
  double _totalExpenses = 0.0;
  FinancialTransaction Ft = FinancialTransaction.empty();
  @override
  void initState() {
    super.initState();
    _loadAccountData();
  }


  Future<void> _loadAccountData()async
  {
    String Data = await Ft.ReadDataFromFile('IncomeData.txt');
    List<String> incomeLines = Data.split('\n');
    double totalIncome = 0.0;
    for (String line in incomeLines)
    {
      var lineParts = line.split(',');
        if (lineParts.length >= 3) {
          double amount = double.tryParse(lineParts[2]) ?? 0.0;
          totalIncome += amount;
        }
      
    }

    _totalIncome = totalIncome;

    Data = await Ft.ReadDataFromFile('ExpenseData.txt');
    List<String> expenseLines = Data.split('\n');
    double totalExpenses = 0.0;
    for (String line in expenseLines)
    {
      var lineParts = line.split(',');
        if (lineParts.length >= 3) {
          double amount = double.tryParse(lineParts[2]) ?? 0.0;
          totalExpenses += amount;
        }
      
    }

    _totalExpenses = totalExpenses;


  
  setState(() {
    _balance = _totalIncome - _totalExpenses;
  });
  


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("صفحة الحساب"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.account_balance_wallet,
                  size: 50, color: Colors.blue),
            ),

            SizedBox(height: 25),

            Text(
              "ملخص حسابك",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),


            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_circle_up, size: 40, color: Colors.green),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("إجمالي الدخل",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('$_totalIncome ', style: TextStyle(fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 20),


            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_circle_down, size: 40, color: Colors.red),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("إجمالي المصروفات",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('$_totalExpenses ', style: TextStyle(fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 20),


            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Icon(Icons.account_balance, size: 40, color: Colors.blue),
                  SizedBox(height: 10),
                  Text("الرصيد المتبقي",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    '$_balance ',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  
  }

}