import 'package:flutter/material.dart';
import 'classes.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {

   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _amountController = TextEditingController();
   final TextEditingController _SourceController = TextEditingController();

    void _submitData() async {
      String enteredTitle = _titleController.text;
      double enteredAmount = double.tryParse(_amountController.text) ?? 0.0;
      String enteredSource = _SourceController.text;
      String currentDate = DateTime.now().toLocal().toString();
  
      if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredSource.isEmpty) {
        return;
      }
      
      FinancialTransaction Ft = FinancialTransaction
      (Amount: enteredAmount,
      Description: enteredTitle,
      Date: currentDate);
  
      bool result = await Ft.SaveDataToFile('ExpenseData.txt', enteredSource);
  
      if (result) { 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حفظ المصروف بنجاح!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
      ),
    );
    setState(() {
      _titleController.clear();
      _amountController.clear();
      _SourceController.clear();
    });

  
      }
      
    

    else
    {
    
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل حفظ المصروف!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
    
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة مصروف جديد'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'الوصف'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'المبلغ'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _SourceController,
              decoration: InputDecoration(
                labelText: 'الفئة',
                hintText: 'مثل: طعام، مواصلات، ترفيه',
                ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('حفظ المصروف'),
            ),
          ],
        ),
      ),
    );
  }
}