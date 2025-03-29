import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}): super(key: key);



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutteriha',
    home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Calculator> {
  String equation= '0';
  String result= '0';
   String expression= '';
   double equationFontSize = 38.0;
   double resultFontSize = 48.0;

   buttonPressed(String buttonText){
    setState(() {
      if(buttonText=='C'){
        equationFontSize=38.0;
        resultFontSize= 48.0;
        equation='0';
        result='0';
      }else if(buttonText=='DEL'){
        equationFontSize=48.0;
        resultFontSize= 38.0;  
        equation=equation.substring(0, equation.length-1) ;
        if(equation.isEmpty){
          equation='0';
        }     
      else if (buttonText == '=') {
  equationFontSize = 38.0;
  resultFontSize = 48.0;

  try {
    result = '${double.parse(equation)}';
  } catch (e) {
    result = 'خطا!';
  }
}
      }else{
        equationFontSize=48.0;
        resultFontSize=38.0;
        if(equation=='0'){
          equation=buttonText;
        }else{
          equation=equation+buttonText;
        }
      }
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: const Color.fromARGB(255, 150, 255, 255),
      ),
      body: Column(
        children: [
          // equation
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: equationFontSize)),
          ),

          // result
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child:  Text(result,style: TextStyle(fontSize: resultFontSize)),
           ),

           const Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: Colors.black,
              height: 2.0,
            ),
             ),
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton('C', 1, const Color.fromARGB(255, 252, 158, 224)),
                          buildButton('/', 1, const Color.fromARGB(255, 211, 148, 253)),
                          buildButton('*', 1, const Color.fromARGB(255, 211, 148, 253)),
                        ],
                     
                      ),
                        TableRow(
                        children: [
                          buildButton('7', 1, const Color.fromARGB(255, 250, 252, 158)),
                          buildButton('8', 1, const Color.fromARGB(255, 250, 252, 158)),
                          buildButton('9', 1, const Color.fromARGB(255, 250, 252, 158)),
                        ],
                     
                      ),
                       TableRow(
                        children: [
                          buildButton('4', 1, const Color.fromARGB(255, 255, 255, 255)),
                          buildButton('5', 1, const Color.fromARGB(255, 255, 255, 255)),
                          buildButton('6', 1, const Color.fromARGB(255, 255, 255, 255)),
                        ],
                     
                      ),
                       TableRow(
                        children: [
                          buildButton('1', 1, const Color.fromARGB(255, 255, 255, 255)),
                          buildButton('2', 1, const Color.fromARGB(255, 255, 255, 255)),
                          buildButton('3', 1, const Color.fromARGB(255, 255, 255, 255)),
                        ],
                     
                      ),
                       TableRow(
                        children: [
                          buildButton('0', 1, const Color.fromARGB(255, 255, 255, 255)),
                          buildButton('00', 1, const Color.fromARGB(255, 255, 255, 255)),
                          buildButton('.', 1, const Color.fromARGB(255, 255, 255, 255)),
                        ],
                     
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton('DEL', 1,const Color.fromARGB(255, 252, 158, 224)),
                        ],
                      ),
                       TableRow(
                        children: [
                          buildButton('-', 1, const Color.fromARGB(255, 211, 148, 253)),
                        ],
                      ),
                       TableRow(
                        children: [
                          buildButton('+', 1.5,const Color.fromARGB(255, 252, 158, 224)),
                        ],
                      ),
                       TableRow(
                        children: [
                          buildButton('=', 1.5,const Color.fromARGB(255, 252, 158, 224)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],

             ),
        ],
      ),
    );
    
  }
  
Widget buildButton(String buttonText,double buttonHeight, Color buttonColor){
  return Container(
 height: MediaQuery.of(context).size.height* 0.1 * buttonHeight,
 margin: const EdgeInsets.all(5.0),
 decoration: BoxDecoration(
  color: buttonColor,
  borderRadius: BorderRadius.circular(115.0),
boxShadow: [
  BoxShadow(
    color: Colors.black26,blurRadius: 8,offset: Offset(2, 4),
  ),
],
  border: Border.all(color: const Color.fromARGB(255, 100, 100, 100),width: 3.0,
  ),
 ),
 child: TextButton(
  onPressed: (){
    buttonPressed(buttonText);
 }, child: Center(
  child: Text(
    buttonText,
    style: const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.normal,
      color:  Color.fromARGB(218, 102, 102, 102),
    ),
  ) ,

 ),),
  );
}
}

