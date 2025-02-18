import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/providers.dart';

class search extends StatefulWidget {
  search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
   FocusNode _node = FocusNode();

  List<Map<String, dynamic>> allItems = [];

  List<Map<String, dynamic>> _searchedItems = [];
  

  void searchforIt(String value) {
    if (value.isNotEmpty) {
      setState(() {
        
      _searchedItems = allItems.where((element) => element.keys.any((element) => element.toLowerCase().contains(value.toLowerCase()),) ||
                                                    element.values.any((element) => element.toString().toLowerCase().contains(value.toLowerCase()),),).toList();
      });
    }
    else{
      setState(() {
        
      _searchedItems.clear();
      });
    }
    print(_searchedItems);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(double.maxFinite, 120), child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: context.watch<prove>().hasData == true ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          focusNode: _node,
          textAlign: TextAlign.justify,
          onTapOutside: (event) {
            if (event.down) {
              _node.unfocus();
            }
          },
          onTap: () {
            print(allItems);
          },
          onChanged: (value) {
            searchforIt(value);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
            constraints: BoxConstraints(maxWidth: 320),
            fillColor: Color.fromARGB(29, 158, 158, 158),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey, width: .05)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey, width: .05)),
          ),
        ),
        Icon(Icons.add)
      ],
    ) : null,
      )),
      body: FutureBuilder(future: FirebaseFirestore.instance.collection("users").get(), builder: (context, snapshot) {
        if(snapshot.hasData){
          
            var yehy = snapshot.data!.docs.map((e) => e.data(),).toList();
            allItems = yehy;

            context.read<prove>().hasData = true;
            return ListView.builder(
              itemCount: _searchedItems.length,
              itemBuilder: (context, index) {
              var items = yehy[index];

              return ListTile(
                leading: Icon(Icons.image),
                tileColor: Colors.grey.shade100,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30) , borderSide: BorderSide(width: 0.01, )),
                title: Text(items["name"].toString()),
                subtitle: Text(items["user"]),
              
              );
            },);
        }
        else{
          context.read<prove>().hasData = false;
          return Text("Nope");
        }
      },),
    );
  }
}