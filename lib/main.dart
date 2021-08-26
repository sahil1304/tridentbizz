import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:myflutterapp/package/datacontainer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobile.dart' if (dart.library.html) 'web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final productNameTEController = TextEditingController();
  final productQtyTEController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                TextField(
                  onTap: null,
                  cursorColor: Colors.black,
                  controller: productNameTEController,
                ),
                TextField(
                  onTap: null,
                  //style: Text_styleTFOnWhite(),
                  cursorColor: Colors.black,
                  controller: productQtyTEController,
                ),
                TextField(
                  onTap: null,
                  //style: Text_styleTFOnWhite(),
                  cursorColor: Colors.black,
                  controller: priceController,
                ),
                ElevatedButton(
                  child: Text('Add Product'),
                  onPressed: _add,),

                ElevatedButton(
                  child: Text('Create PDF'),
                  onPressed: _createPDF,),
              ],
            ),
          ],
        ),

        ),

    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('Welcome to Tridentbizz',
        PdfStandardFont(PdfFontFamily.helvetica, 30));

    page.graphics.drawImage(
        PdfBitmap(await _readImageData('Pdf_Succinctly.jpg')),
        Rect.fromLTWH(0, 50, 50, 50));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 30),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 3);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Product Name';
    header.cells[1].value = 'Quantity';
    header.cells[2].value = 'Price';

    PdfGridRow row = grid.rows.add();

    //for(int i=0;i<)
    row.cells[0].value = '1';
    row.cells[1].value = 'Arya';
    row.cells[2].value = '6';

    for(int i=0;i<productName.length;i++)
      {
        row = grid.rows.add();
        row.cells[0].value = productName[i];
        row.cells[1].value = productQty[i];
        row.cells[2].value = productPrice[i];
      }



    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
  Future<void> _add() async {

    productName.add(productNameTEController.text);
    productQty.add(productQtyTEController.text);
    productPrice.add(priceController.text);

    productNameTEController.text="";
    productQtyTEController.text="";
    priceController.text="";
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
