import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FinancialTransaction
{
  String Date;
  String Description;
  double Amount;

 FinancialTransaction({
  required this.Date,
  required this.Description,
  required this.Amount,
 });

FinancialTransaction.empty()
      : Date = '',
        Description = '',
        Amount = 0.0;

 



Future<bool> SaveDataToFile(String fileName, String sourceOrCategory) async {
  try {
    // الحصول على مجلد التخزين الآمن
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$fileName';

    File file = File(path);

    // إنشاء الملف إذا لم يكن موجوداً
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }

    // السطر الذي سيتم حفظه
    String dataLine = '$Date,$Description,$Amount,$sourceOrCategory\n';

    // كتابة البيانات
    file.writeAsStringSync(dataLine, mode: FileMode.append);

    return true;
  } catch (e) {
    print('Error saving file: $e');
    return false;
  }
}



 Future <String> ReadDataFromFile(String FileName)async
  {
    try
    {
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/$FileName';

      File file = File(path);

      if (!file.existsSync())
      {
        return 'لا توجد بيانات محفوظة بعد.';
      }
      
        return await file.readAsString();
    } 
    catch (Exception)
    {
      return 'حدث خطأ أثناء قراءة الملف.';
    }
    
  }

}


class Income extends FinancialTransaction
{
  late String Source;

  Income() : super(Date: '', Description: '', Amount: 0.0);


  void GenerateIncome(String date,String description,double amount,String source)
  {
    this.Date = date;
    this.Description = description;
    this.Amount = amount;
    this.Source = source;

    SaveDataToFile('incomes.txt', this.Source);
   
  }

}


class Expense extends FinancialTransaction
{
  late String Category;

  Expense() : super(Date: '', Description: '', Amount: 0.0);

  void GenerateExpense(String date,String description,double amount,String category)
  {
    this.Date = date;
    this.Description = description;
    this.Amount = amount;
    this.Category = category;

    SaveDataToFile('expenses.txt', this.Category);
  }
  
}
