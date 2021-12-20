import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formkey = GlobalKey<FormState>();
  final firstnumController = TextEditingController();
  final secondnumController = TextEditingController();
  String result = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const Text('Adding Two Number'),
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "field is empty";
                  }
                  return null;
                },
                controller: firstnumController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'First num',
                    hintText: 'Enter the first num',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        secondnumController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    )),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "field cannot be empty";
                  }
                  return null;
                },
                controller: secondnumController,
                decoration: const InputDecoration(
                  labelText: 'Second num',
                  hintText: 'Enter the second number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      int sum = int.parse(firstnumController.text) +
                          int.parse(secondnumController.text);
                      result = sum.toString();
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Something wrong!!")));
                  }
                },
                child: const Text("Sum"),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Result",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

AppBar myappbar(BuildContext context) {
  return AppBar(
    title: const Text('Form Example'),
  );
}
