import 'package:contacs_application/data/entity/kisiler.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Kisiler kisi;

  DetailPage({required this.kisi});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var nameController = TextEditingController();
  var phoneNoController = TextEditingController();

  Future<void> Update(int kisi_id, String kisi_ad, String kisi_tel) async{
    print("$kisi_id, $kisi_ad and $kisi_tel is updated");
  }

  @override
  void initState() {
    nameController.text = widget.kisi.kisi_ad;
    phoneNoController.text = widget.kisi.kisi_tel;
    super.initState();
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
                Update(widget.kisi.kisi_id, nameController.text, phoneNoController.text);
              });}, child: const Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
