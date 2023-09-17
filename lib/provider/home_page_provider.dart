import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePageProvider extends ChangeNotifier {
  int possibleFirstResult = 0;
  int possibleSecondResult = 0;
  String input = "";
  bool isloading = false;
  List<String> outputResult = [];
  SupabaseClient? supabase;

  Future<void> initSupabase() async {
    if (supabase == null) {
      await Supabase.initialize(
        url: 'https://kkanfbustgzxmbmaodmb.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtrYW5mYnVzdGd6eG1ibWFvZG1iIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ2MjcxNDEsImV4cCI6MjAxMDIwMzE0MX0.Lqeie2_nRLKuKvVXKJOQWsgOHCIyTEYJLoDroLU9SUE',
      );
      supabase = Supabase.instance.client;
    }
  }

  void onChangeTextField(String data) {
    input = data;
    if (input.length == 2) {
      calculator();
    }
  }

  void onChangeTextBox(String value,String target){}

  List<int> calculate(int a, int b) {
    List<int> listn1 = [1, 2, 3, 6, 7];
    List<int> listn2 = [8, 4, 5, 9, 0];
    List<int> listp1 = [1, 2, 3, 4, 5];
    List<int> listp2 = [6, 7, 8, 9, 0];
    int sum = a + b;
    int inca = int.parse(sum.toString().substring(sum.toString().length - 1));
    int incb = 0;
    if (inca == 8) {
      incb = 0;
    } else if (inca == 9) {
      incb = 1;
    } else {
      incb = inca + 2;
    }

    int netkhat = 0;
    for (int i = 0; i < listn1.length; i++) {
      if (incb == listn1[i]) {
        netkhat = listn2[i];
      } else if (incb == listn2[i]) {
        netkhat = listn1[i];
      }
    }
    int power = 0;
    for (int i = 0; i < listn2.length; i++) {
      if (incb == listp1[i]) {
        power = listp2[i];
      } else if (incb == listp2[i]) {
        power = listp1[i];
      }
    }
    int prenetresult = netkhat + incb;
    int prepowresult = power + incb;
    int powerresulta = 0;
    int powerresultb = 0;

    if (prenetresult == 15) {
      powerresulta = 5;
    } else {
      powerresulta = prenetresult;
    }
    if (prepowresult == 13) {
      powerresultb = 3;
    } else if (prepowresult == 11) {
      powerresultb = 1;
    } else {
      powerresultb = prepowresult;
    }
    int finala = 0;
    int finalb = 0;

    for (int i = 0; i < listp1.length; i++) {
      if (powerresulta == listp1[i]) {
        finala = listp2[i];
      } else if (powerresulta == listp2[i]) {
        finala = listp1[i];
      }
    }
    for (int i = 0; i < listp1.length; i++) {
      if (powerresultb == listp1[i]) {
        finalb = listp2[i];
      } else if (powerresultb == listp2[i]) {
        finalb = listp1[i];
      }
    }
    return [finala, finalb];
  }

  void calculator() async {
    isloading = true;
    notifyListeners();
    List<int> intList = calculate(
        double.parse(input[0]).toInt(), double.parse(input[1]).toInt());
    possibleFirstResult = intList[0];
    possibleSecondResult = intList[1];
    outputResult = [...generateNumbers("${intList[0]}"),...generateNumbers("${intList[1]}")];
    await Future.delayed(const Duration(seconds: 3));
    isloading = false;
    notifyListeners();
  }

  List<String> generateNumbers(String input) {
    List<String> outputList = [];
    int num = int.parse(input);
    for (int i = 0; i <= 9; i++) {
      int tensDigit = (i + num) % 10;
      int onesDigit = (i % 10);
      outputList.add('$tensDigit$onesDigit');
    }
    return outputList;
  }
}
