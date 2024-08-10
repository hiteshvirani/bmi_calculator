import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BMI APP"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 21,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight (in Kgs)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("Enter your Height (in Feet)"),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text("Enter your Height (in inch)"),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);
                    var msg = "";
                    if(bmi > 25){
                      msg = "You're OverWeight!!";
                      bgColor = Colors.orange.shade200;
                    }
                    else if(bmi < 18){
                      msg = "You're UnderWeight!!";
                      bgColor = Colors.red.shade200;
                    }else{
                      msg = "You're Healthy!!";
                      bgColor = Colors.green.shade200;
                    }

                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });
                  }else{
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }

                }, child: Text("Calculate")),
                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
