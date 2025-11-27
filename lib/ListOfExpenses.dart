import 'package:flutter/material.dart';
import 'classes.dart';

class ListofExpenses extends StatefulWidget {
  const ListofExpenses({super.key});

  @override
  State<ListofExpenses> createState() => _ListofExpensesState();
}

class _ListofExpensesState extends State<ListofExpenses> {

   String fileContent = "جاري التحميل...";
   FinancialTransaction Ft = FinancialTransaction.empty();
  @override

  void initState() {
    super.initState();
    _LoadDataFromFile();
  }

  Future<void> _LoadDataFromFile() async
  {
    String Data = await Ft.ReadDataFromFile('ExpenseData.txt');
    setState(()
    {
      fileContent = Data;
    });
    
      
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة المصروفات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            fileContent,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

}