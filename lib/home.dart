import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool clearText=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Text Field"),
      ),
      body:Column(
        children: [
          SizedBox(height:20),
          Text("Enter OTP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          SizedBox(height:20),
          OtpTextField(
            numberOfFields: 6,
            cursorColor: Colors.red,
            enabledBorderColor: Colors.black,
            focusedBorderColor: Colors.red,
            clearText: clearText,
            showFieldAsBox: true,
            borderRadius: BorderRadius.circular(10),
            onSubmit: (String otp){
              setState(() {
                clearText=true;
              });
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Successful"),
                      content:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("OTP: $otp"),
                          SizedBox(height:15),
                          CircleAvatar(
                            child: Icon(Icons.check,color: Colors.green,size: 50),
                            backgroundColor: Color.fromRGBO(224, 220, 220, 1.0),
                            radius: 40,
                          ),
                        ],
                      )
                    );
                  },
              );
            },
          ),
        ],
      )
    );
  }
}
