import 'package:flutter/material.dart';
import 'classes.dart';


class AddIncomepage extends StatefulWidget {
  const AddIncomepage({super.key});

  @override
  State<AddIncomepage> createState() => _AddincomepageState();
}

class _AddincomepageState extends State<AddIncomepage> {

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

     bool result = await Ft.SaveDataToFile('IncomeData.txt', enteredSource);

     if (result) {

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('تم حفظ الدخل بنجاح!'),
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
      content: Text('فشل حفظ الدخل!'),
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
        title: Text('إضافة دخل جديد'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'الوصف',
                hintText: 'مثال: راتب شهر يناير',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
                ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'المبلغ',
                hintText: 'مثال: 1500.00', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ), 
                ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),

            SizedBox(height: 20),

            TextField(
              controller: _SourceController,
              decoration: InputDecoration(
                labelText: 'المصدر',
                hintText: 'مثال: العمل، مشروع، استثمار',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              )
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('حفظ الدخل',
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),  
            ),
            )
          ],
        ),
      ),
    );
    
  }
}