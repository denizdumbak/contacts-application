import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var nameController = TextEditingController();
  var phoneNoController = TextEditingController();

  Future<void> Register(String kisi_ad, String kisi_tel) async{
    print("*****************$kisi_ad registered with the phone number of $kisi_tel*******************");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50, left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              TextField(
                controller: phoneNoController,
                decoration: const InputDecoration(hintText: "Number"),
              ),
              ElevatedButton(onPressed: () {setState(() {
                Register(nameController.text, phoneNoController.text);
              });}, child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
