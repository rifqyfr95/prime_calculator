import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prime_calculator/model/prime_calculation.dart';
import 'package:prime_calculator/screen/side_menu.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: PrimeCalculation())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CalculatorPage(title: 'Prime Calculator'),
      ),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController number1controller = TextEditingController();
  TextEditingController number2controller = TextEditingController();

  void _calculatePrime(BuildContext context, int number1, int number2) {
    Provider.of<PrimeCalculation>(context, listen: false)
        .calculatePrime(number1, number2);
  }

  @override
  Widget build(BuildContext context) {
    var result = Provider.of<PrimeCalculation>(context).getResult;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      drawer: SideMenu(),
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Please choose between 2 numbers \nto know its list of prime numbers\nbetween them',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: TextFormField(
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        hintText: 'Please enter a number'),
                    keyboardType: TextInputType.number,
                    controller: number1controller,
                  )),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: TextFormField(
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0)),
                        hintText: 'Please enter a number'),
                    keyboardType: TextInputType.number,
                    controller: number2controller,
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Visibility(
                visible: result.isNotEmpty,
                child: Text(
                  "Prime numbers between ${number1controller.text} and ${number2controller.text} are:\n$result",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          int number1 = int.parse(number1controller.text);
          int number2 = int.parse(number2controller.text);
          if (number1 == 0) {
            final snackBar =
                SnackBar(content: Text('First input must be higher then zero'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (number2 == 0) {
            final snackBar = SnackBar(
                content: Text('Second input must be higher then zero'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (number1 > number2) {
            final snackBar = SnackBar(
                content:
                    Text('Second number must be higher then first number'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            _calculatePrime(context, number1, number2);
          }
        },
        padding: EdgeInsets.all(20.0),
        textColor: Colors.white,
        minWidth: 200,
        child: Text(
          "Calculate",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        color: Colors.green,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
