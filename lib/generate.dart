import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  String qrData="https://github.com/ChinmayMunje";
  TextEditingController urlcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code'),backgroundColor: Colors.blue,),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlcontroler.text.isNotEmpty)
                QrImageView(data :urlcontroler.text,size: 200, ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: urlcontroler,
                  decoration: InputDecoration(
                    hintText: 'Enter The Data',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: 'Enter The Text'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                setState(() {
                  qrData = urlcontroler.text;

                });
              }, child: Text('Generate QR Code'))

            ],
          ),
        ),
      ),
    );
  }
}
