// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final TextEditingController _txt1Controller = TextEditingController();
//   final TextEditingController _txt2Controller = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   double result = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Simple App'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _txt1Controller,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide:
//                       const BorderSide(width: 3, color: Colors.greenAccent)),
//                   hintText: 'number dal de'),
//               keyboardType: TextInputType.number,
//               validator: (String? value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Enter valid value';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 16,),
//             TextFormField(
//               controller: _txt2Controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide:
//                         const BorderSide(width: 3, color: Colors.greenAccent)),
//                 hintText: ' ducora number de',
//               ),
//               keyboardType: TextInputType.number,
//               validator: (String? value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Enter valid value';
//                 }
//                 return null;
//               },
//             ),
//             ButtonBar(children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     double firstNumber = parseToDouble(_txt1Controller.text.trim());
//                     double secondNumber = parseToDouble(_txt2Controller.text.trim());
//                     result = addition(firstNumber, secondNumber);
//                     setState(() {});
//                   }
//                 },
//                 icon: const Icon(Icons.add),
//                 label: const Text('Add'),
//               ),
//               // ElevatedButton.icon(
//               //   onPressed: () {},
//               //   icon: const Icon(Icons.remove),
//               //   label: const Text('Sub'),
//               // ),
//               // ElevatedButton.icon(
//               //   onPressed: () {},
//               //   icon: const Icon(Icons.add),
//               //   label: const Text('Mul'),
//               // ),
//               // ElevatedButton.icon(
//               //   onPressed: () {},
//               //   icon: const Icon(Icons.add),
//               //   label: const Text('Div'),
//               // ),
//             ]),
//             Text('Result is: $result')
//           ],
//         ),
//       ),
//     );
//   }
//   double parseToDouble(String text){
//     return double.tryParse(text) ?? 0;
//   }
//   double addition(double firstNum, double secondNum,){
//     return firstNum + secondNum;
//   }
// }
import 'package:flutter/material.dart';

/// TODO : Add multiply(*), division(/) and modulus(%)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fieldOneTEController = TextEditingController();
  final TextEditingController _fieldTwoTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fieldOneTEController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    hintText: 'Field 1'
                ),
                validator: (String? value) {
                  if (value == null) {
                    return 'Enter a value';
                  }
                  if (value.trim().isEmpty) {
                    return 'Enter a number';
                  }
                  // if (value?.trim().isEmpty ?? true) {
                  //   return 'Enter valid value';
                  // }
                  return null;
                },
              ),
              TextFormField(
                controller: _fieldTwoTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Field 2'
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter valid value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16,),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber = parseToDouble(_fieldOneTEController.text.trim());
                        double secondNumber = parseToDouble(_fieldTwoTEController.text.trim());
                        result = addition(firstNumber, secondNumber);
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber = parseToDouble(_fieldOneTEController.text.trim());
                        double secondNumber = parseToDouble(_fieldTwoTEController.text.trim());
                        result = sub(firstNumber, secondNumber);
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Sub'),
                  ),
                ],
              ),
              Text(
                'Result is : $result',
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  double parseToDouble(String text) {
    return double.tryParse(text) ?? 0;
  }

  double addition(double firstNum, double secondNum,) {
    return firstNum + secondNum;
  }

  double sub(double firstNum, double secondNum,) {
    return firstNum - secondNum;
  }

}