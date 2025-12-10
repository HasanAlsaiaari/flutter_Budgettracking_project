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
   final TextEditingController _CatoegryController = TextEditingController();

    void _submitData() async {
      String enteredTitle = _titleController.text;
      double enteredAmount = double.tryParse(_amountController.text) ?? 0.0;
      String enteredCatogry = _CatoegryController.text;
      String currentDate = DateTime.now().toLocal().toString();
  
      if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredCatogry.isEmpty) {
        return;
      }
      
      FinancialTransaction Ft = FinancialTransaction
      (Amount: enteredAmount,
      Description: enteredTitle,
      Date: currentDate);

  
      bool result = await Ft.SaveDataToFile('ExpenseData.txt', enteredCatogry);
  
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
      _CatoegryController.clear();
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
              decoration: InputDecoration(
                labelText: 'الوصف',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )
                ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'المبلغ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),

            SizedBox(height: 20),

            TextField(
              controller: _CatoegryController,
              decoration: InputDecoration(
                labelText: 'الفئة',
                hintText: 'مثل: طعام، مواصلات، ترفيه',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              )
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('حفظ المصروف',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}