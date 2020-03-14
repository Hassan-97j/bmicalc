import 'package:flutter/material.dart';
import 'themes.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        backgroundColor: secondaryColor,
        scaffoldBackgroundColor: secondaryColor,
        cursorColor: primaryColor,
        accentColor: primaryColor,
       
        appBarTheme: AppBarTheme(
          color: primaryColor,
          brightness: Brightness.light,
          textTheme: TextTheme(
            title: TextStyle(
              color: primaryTextColor,
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double meters = 0.0;
  double result = 0.0;
  String _resultread = '';
  String _finalresult = '';
  void _calcBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      meters = height * 0.3048;
      double weight = double.parse(_weightController.text);
      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || meters > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (meters * meters);
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultread = 'underweight';
          print(_resultread);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultread = 'normal';
          print(_resultread);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25 &&
            result < 30) {
          _resultread = 'overweight';
          print(_resultread);
        } else if (double.parse(result.toStringAsFixed(1)) < 30) {
          _resultread = 'obese';
          print(_resultread);
        }
      } else {
        result = 0.0;
      }
    });

    _finalresult = 'your BMI is ${result.toStringAsFixed(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Body Mass Index',
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(padding: EdgeInsets.all(2.5), children: <Widget>[
             Image.asset('images/bmi.jpg',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height *0.35
              ),
            
            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter your age',
                      //hintText: '',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))
                       ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'enter your height',
                      hintText: 'In feet',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'enter your weight',
                      hintText: 'In KGs',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                          
                ),
              ]),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      _calcBMI();
                    },
                    child: Text(
                      'Calculate ',
                      style: setTextStyle(size: 20, color: primaryColor, weight: FontWeight.w800)
                    ),
                    color: Color(0xFF67690A),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Column(children: <Widget>[
              Text(
                ' $_finalresult ',
                style: setTextStyle(size: 24, color: primaryTextColor, weight: FontWeight.normal)
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                ' $_resultread ',
                style: setTextStyle(size: titleFontSize, color: primaryTextColor, weight: FontWeight.normal)
              ),
              // Text(
              //   ' $meters ',
              //   style: Theme.of(context).textTheme.headline,)
            ])
          ]),
        ));
  }
}
