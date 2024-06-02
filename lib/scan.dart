import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrresult = 'Scanned Data will be appear here';
  Future<void> Scanqr()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrresult = qrCode.toString();
      });
    }on PlatformException{
      qrresult = 'Fail to read QR Code';
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR Code'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text(qrresult,style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: Scanqr, child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
