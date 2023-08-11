import 'package:flutter/material.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: homepage(), )
      , debugShowCheckedModeBanner: false,
      //Scaffold
    );
  }
}


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();


  double h= 0.0;
  double w=0.0;
  double BMI=0.0;
  String res= "";
  void bmi(){
    h= double.parse(_height.text.toString());
    w= double.parse(_weight.text.toString());
    setState(() {
      BMI = w/(h*h);
      if(BMI < 18.5){res= "UNDERWEIGHT";}
      else if(BMI < 24.5){res= "NORMAL-WEIGHT";}
      else if(BMI < 30.0){res= "OVERWEIGHT";}
      else{res="obese";}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        leading: Icon(Icons.people_alt_outlined),
        actions: [
          Icon(Icons.abc),
          Container(child: IconButton(onPressed: (){ }, icon: Icon(Icons.add))),
          IconButton(onPressed: (){print("butten pressed of menu");}, icon: Icon(Icons.menu))
        ],
      ),
      body: Center(child: Container(


          child: Column(
            children: [
              TextField(controller: _height,),
              TextField(controller: _weight,),
              ElevatedButton(onPressed: (){
                bmi();
              }, child: Text("BMI")),
              Text("your BMI is $BMI"),
              Text("it is $res")

            ],
          ))
      ));
  }
}
