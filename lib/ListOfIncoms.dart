import 'package:flutter/material.dart';
import 'classes.dart';


class Listofincoms extends StatefulWidget {
  const Listofincoms({super.key});

  @override
  State<Listofincoms> createState() => _ListofincomsState();
}

class _ListofincomsState extends State<Listofincoms> {

   String fileContent = "جاري التحميل...";
   FinancialTransaction Ft = FinancialTransaction.empty();
  @override

  void initState() {
    super.initState();
    _LoadDataFromFile();
  }


  Future<void> _LoadDataFromFile() async
  {
    String Data = await Ft.ReadDataFromFile('IncomeData.txt');

    setState(()
    {
      fileContent = Data;
    }
    );
    
      
    
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة الدخل'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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