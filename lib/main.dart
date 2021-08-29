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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final srNoTEController = TextEditingController();
  final productNameTEController = TextEditingController();
  final productQtyTEController = TextEditingController();
  final priceController = TextEditingController();
  final totalPriceTEController = TextEditingController();
  int srno = 1;


  // double qunt=0;
  // double rate=0;
  // double totalPrice=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(250, 231, 219, 1.0),
              Color.fromRGBO(246, 239, 181, 1.0),
              Color.fromRGBO(255, 198, 137, 1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      //INPUT FIELDS

                      /*Padding(padding: EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Image.asset(
                              'assets/images/billing.png', height: 100),
                        ),
                      ),*/
                      Padding(padding: EdgeInsets.all(20.0),
                        child: Text('CREATE BILL',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 30.0,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w600
                          ),),),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextField(
                          onTap: null,
                          readOnly: true,
                          enabled: false,
                          controller: srNoTEController,
                          cursorColor: Color.fromRGBO(0, 9, 29, 1.0),
                          decoration: InputDecoration(
                              icon: Icon(Icons.confirmation_number,
                                color: Color.fromRGBO(
                                    0, 29, 88, 1.0),),
                              hintText: 'Sr No',
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextField(
                          onTap: null,
                          controller: productNameTEController,
                          cursorColor: Color.fromRGBO(0, 9, 29, 1.0),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.description, color: Color.fromRGBO(
                                  0, 29, 88, 1.0),),
                              hintText: 'Description',
                              border: InputBorder.none
                          ),
                          // onSaved:(input)=> _email = input!


                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextField(
                          onTap: null,
                          controller: productQtyTEController,
                          cursorColor: Color.fromRGBO(0, 9, 29, 1.0),
                          decoration: InputDecoration(
                              icon: Icon(Icons.production_quantity_limits,
                                color: Color.fromRGBO(
                                    0, 29, 88, 1.0),),
                              hintText: 'Quantity',
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextField(
                          onTap: null,
                          controller: priceController,
                          cursorColor: Color.fromRGBO(0, 9, 29, 1.0),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.rate_review, color: Color.fromRGBO(
                                  0, 29, 88, 1.0),),
                              hintText: 'Rate',
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(

                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: totalPriceTEController,
                          onTap: null, //findTotal()
                          cursorColor: Color.fromRGBO(0, 9, 29, 1.0),
                          decoration: InputDecoration(
                              icon: Icon(Icons.do_not_disturb_on_total_silence,
                                color: Color.fromRGBO(
                                    0, 29, 88, 1.0),),
                              hintText: 'Total',
                              border: InputBorder.none
                          ),
                        ),
                      ),

                      //BUTTONS
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: RaisedButton(
                          onPressed: _add,
                          textColor: Colors.white,
                          color: Colors.deepOrange,
                          splashColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 89, vertical: 15),
                          child: Text(
                            'Add Product',
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: RaisedButton(
                          onPressed: _createPDF,
                          textColor: Colors.white,
                          color: Colors.deepOrange,
                          splashColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 95, vertical: 15),
                          child: Text(
                            'Create PDF',
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }




  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('TRIDENT  SERVICES',
      PdfStandardFont(PdfFontFamily.timesRoman, 40),);

    page.graphics.drawImage(
        PdfBitmap(await _readImageData('Logokkjpg.jpg'),),
        Rect.fromLTWH(10, 60, 80, 50));

    PdfGrid grid1 = PdfGrid();
    grid1.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 15),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid1.columns.add(count: 2);
    grid1.headers.add(1);

    PdfGridRow header1 = grid1.headers[0];
    header1.cells[0].value = '';

    header1.cells[1].value =
    'Address: A\P-Sawarde, Mohire complex, 2nd floor, near'
        'main Bus stand, Tal- Chiplun, Dist. - Ratnagiri, Pin-415606';

    // ----------------------------------------------------------------
    PdfGrid gridName = PdfGrid();
    gridName.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 15),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    gridName.columns.add(count: 2);
    gridName.headers.add(1);

    PdfGridRow headerName = gridName.headers[0];
    headerName.cells[0].value = 'NAME: ';
    headerName.cells[1].value ='DATE: ';

    PdfGridRow rowName = gridName.rows.add();
    rowName.cells[0].value = 'ADDRESS: ';
    rowName.cells[1].value = 'REF NO';



    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 15),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 5);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];


    header.cells[0].value = 'Sr.No.';
    header.cells[1].value = 'Description';
    header.cells[2].value = 'Qty.';
    header.cells[3].value = 'Rate(Rs)';
    header.cells[4].value = 'Total';

    PdfGridRow row = grid.rows.add();

    //for(int i=0;i<)
    row.cells[0].value = '1';
    row.cells[1].value = 'Arya';
    row.cells[2].value = '6';
    row.cells[3].value = '100';
    row.cells[4].value = '600';

    for (int i = 0; i < productSrNo.length; i++) {
      if(i < productSrNo.length) {
        row = grid.rows.add();
        row.cells[0].value = productSrNo[i];
        row.cells[1].value = productName[i];
        row.cells[2].value = productQty[i];
        row.cells[3].value = productPrice[i];
        row.cells[4].value = productTotalPrice[i];
      }
    }


    PdfGridRow rowTotal = grid.rows.add();
    rowTotal.cells[0].rowSpan=4;
    rowTotal.cells[1].rowSpan=4;
    rowTotal.cells[1].columnSpan=2;
    rowTotal.cells[0].value='Rupees In words:';
    rowTotal.cells[1].value='';


    rowTotal=grid.rows.add();
    rowTotal.cells[3].value = 'Total: ';
    rowTotal.cells[4].value = '';

    rowTotal=grid.rows.add();
    rowTotal.cells[3].value = 'GST % : ';
    rowTotal.cells[4].value = '';

    rowTotal=grid.rows.add();
    rowTotal.cells[3].value = 'TOTAL: ';
    rowTotal.cells[4].value = '';

    rowTotal=grid.rows.add();
    rowTotal.cells[0].columnSpan=5;
    rowTotal.cells[0].value='Note: \nPayment in cheque/DD should be drawn in favor of Trident IT services.\n'
        '1) These rates are valid up to 10 days.\n'
        '2)Delivery will be within 06 days after confirmation of purchase order.\n'
        '3)50% advance amount has to be pay at the time of confirmation of purchase order.\n';

    grid1.draw(
        page: page, bounds: const Rect.fromLTWH(0, 50, 0, 0));

    gridName.draw(
        page: page, bounds: const Rect.fromLTWH(0, 140, 0, 0));

    grid.draw(
        page: page, bounds: const Rect.fromLTWH(0, 200, 0, 0));



    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<void> _add() async {
    srno++;

    srNoTEController.text = srno.toString();
    productSrNo.add(srNoTEController.text);
    productName.add(productNameTEController.text);
    productQty.add(productQtyTEController.text);
    productPrice.add(priceController.text);
    productTotalPrice.add(totalPriceTEController.text);


    srNoTEController.text = "";
    productNameTEController.text = "";
    productQtyTEController.text = "";
    priceController.text = "";
    totalPriceTEController.text = "";
  }
}


Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
