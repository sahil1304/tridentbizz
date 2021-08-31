import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/package/datacontainer.dart';

import 'create_bill.dart';

class ShowBillScreen extends StatefulWidget {
  const ShowBillScreen({Key key}) : super(key: key);
  @override
  _ShowBillScreenState createState() => _ShowBillScreenState();
}

class _ShowBillScreenState extends State<ShowBillScreen> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventary Management',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange
      ),
      home: Scaffold(
       appBar: AppBar(
          title: Text(
              'Home'
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 170, 1, 1.0),
                  Color.fromRGBO(226, 96, 2, 1.0),
                  Color.fromRGBO(255, 0, 0, 1.0),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
        ),
        body: Container(
          child: productName.length > 0
              ? ListView.builder(
              shrinkWrap: true,
              // physics: BouncingScrollPhysics(),
              physics: NeverScrollableScrollPhysics(),
              itemCount:productName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title : Text('${productName[index]}'),
                    subtitle: Text('${productPrice[index]}'),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) {
                        var menuOptions = ['Edit', 'Delete', 'Cancel'];
                        var icons = [Icons.edit, Icons.delete, Icons.clear];
                        return menuOptions
                            .map((e) => PopupMenuItem(
                          value: menuOptions.indexOf(e),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(e),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                              )
                            ],
                          ),
                        ))
                            .toList();
                      },
                      onSelected: (i) async {
                        if (i == 0) {

                        } else if (i == 1) {

                        } else {

                        }
                      },
                    ),
                  ),
                );
                // return MaidCard(mhc.dayWiseDetail[index]);
              })
              : NothingPresent(),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(
              builder: (context)=>CreateBill(),
          ),),
          child: const Icon(Icons.add),

          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget NothingPresent() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "No Data Found",
          ),
        ],
      ),
    );
  }

}


