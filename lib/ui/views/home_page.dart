import 'package:contacs_application/data/entity/kisiler.dart';
import 'package:contacs_application/ui/views/detail_page.dart';
import 'package:contacs_application/ui/views/register_page.dart';
import 'package:flutter/material.dart';

import '../../data/entity/kisiler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  Future<void> search(String word) async {
    print("Search Result is $word");
  }

  Future<List<Kisiler>> loadContacts() async {
    var contactList = <Kisiler>[];
    var c1 = Kisiler(kisi_id: 0, kisi_ad: "Deniz", kisi_tel: "0533");
    var c2 = Kisiler(kisi_id: 1, kisi_ad: "Doğa", kisi_tel: "0530");
    var c3 = Kisiler(kisi_id: 2, kisi_ad: "Ercan", kisi_tel: "0505");

    contactList.add(c1);
    contactList.add(c2);
    contactList.add(c3);

    return contactList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (result) {
                  search(result);
                },
              )
            : const Text("Contacts"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  },
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterPage()));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Kisiler>>(
        future: loadContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var loadContacts = snapshot.data;
            return ListView.builder(
              itemCount: loadContacts!.length,
              itemBuilder: (context, index) {
                var contact = loadContacts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(kisi: contact)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                contact.kisi_ad,
                                style: const TextStyle(fontSize: 19),
                              ),
                              Text(contact.kisi_tel,
                                  style: const TextStyle(fontSize: 19)),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("$contact will be deleted."),
                                    action: SnackBarAction(
                                      label: "Accept",
                                      onPressed: () {
                                        print("${contact.kisi_ad} is deleted.");
                                      },
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.clear))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
