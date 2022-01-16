import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _length = TextEditingController();
  final _girth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Container(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PIG WEIGHT',
                  style: TextStyle(
                      fontSize: 60.0, color: Colors.pinkAccent),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'CALCULATOR',
                  style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.pinkAccent,fontWeight: FontWeight.bold),
                       textAlign: TextAlign.center,
                ),
                Image.asset("assets/images/pig.png",
                  width: 300.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 150,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      color: Colors.white,
                      child: Column(
                        children:[
                          Text('LENGTH \n (cm)',style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(controller: _length,textAlign: TextAlign.center),

                          ),
                        ],
                      ),

                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        height: 150,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        color: Colors.white,
                        child: Column(
                          children:[
                            Text('GIRTH \n (cm)',style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(controller: _girth),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ],
                ),







                Padding(

                  padding :const EdgeInsets.all(100.0),

                  child:
                  ElevatedButton(

                  onPressed: (){
                    var length_text = _length.text;
                    var girth_text = _girth.text;
                    double? Slength = double.tryParse(length_text);
                    double? Sgirth = double.tryParse(girth_text);



                         if (Slength == null || Sgirth == null) {
                               showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("ERROR",style: TextStyle(
                                            color: Colors.black,fontWeight: FontWeight.bold)),
                                               content: const Text("Invalid input"),
                                               actions: [

                                                   TextButton(
                                                      child: const Text('OK'),
                                                  onPressed: () {

                                                   Navigator.of(context).pop();
                                                          },
                                                      ),
                                                          ],
                                                          );
                                                            },
                                                        );
                                                        } else {
                                                          double weight =
                                                    (Sgirth / 100) * (Sgirth / 100) * (Slength / 100) * 69.3;
                                                     double price = weight * 112.50;
                                                      double WeigthMax = (0.03 * weight) + weight;
                                                      double pricemax = (0.03 * price) + price;
                                                      double WeightMin = weight - (0.03 * weight);
                                                      double pricemin = price - (0.03 * price);
                                                          showDialog(
                                                         context: context,
                                                            builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                              title: Padding(
                                                                   padding: const EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                           children: [
                                                                                      Image.asset('assets/images/ic_pig.png',
                                                                                          width: 30, height: 30),
                                                                                              Text('  RESULT',style: TextStyle(
                                                                                                  color: Colors.black,fontWeight: FontWeight.bold)),
                                                                                          ],
                                                                                              ),
                                                                                          ),
                                                                                              content: Text(
                                                                                                    'Weight: ${WeightMin.round()} - ${WeigthMax.round()} kg\nPrice: ${pricemin.round()} - ${pricemax.round()} Baht'),
                                                                                                            actions: [

                                                                                                    TextButton(
                                                                                                        child: const Text('OK'),
                                                                                                            onPressed: () {

                                                                                                                 Navigator.of(context).pop();
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                 );
                                                                                                 },
                                                                                            );
                                                                                           }
                                                                                         },
                                                                                                child: Text('CALCULATE')),
                                                                            ),
                                                                          ],
                                                                ),
                                                   ),
    ),
      ),
                               );
                            }
                }