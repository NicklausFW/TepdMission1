import 'package:flutter/material.dart';

class BookmarkForm extends StatefulWidget {
  @override
  _BookmarkFormState createState() => _BookmarkFormState();
}

class _BookmarkFormState extends State<BookmarkForm> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  bool validate = false;

  void sendForm() {
    AlertDialog alertDialog = AlertDialog(
      title: Text(
        "Booking Confirmation",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FlatButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        )
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Full Name : ${name.text}"),
              Text("Email Address : ${email.text}"),
              Text("Phone Number : ${phone.text}"),
              Text("City : ${city.text}"),
            ],
          ),
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  void sendError() {
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            Text(
              "Booking Failed",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Please fill all form fields"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.blue),
                ),
                color: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Form'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                Forum(
                  control: name,
                  smallIcon: Icon(Icons.account_circle),
                  hint: 'Full Name',
                  label: 'Full Name',
                ),
                SizedBox(
                  height: 50,
                ),
                Forum(
                  smallIcon: Icon(Icons.email),
                  control: email,
                  hint: 'Email Address',
                  label: 'Email Address',
                ),
                SizedBox(
                  height: 50,
                ),
                Forum(
                  smallIcon: Icon(Icons.phone_android),
                  control: phone,
                  inputType: TextInputType.number,
                  hint: 'Phone Number',
                  label: 'Phone Number',
                ),
                SizedBox(
                  height: 50,
                ),
                Forum(
                  smallIcon: Icon(Icons.location_city),
                  control: city,
                  hint: 'City',
                  label: 'City',
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text('Book Now'),
                  color: Colors.cyan,
                  onPressed: () {
                    if (name.text.isEmpty ||
                        email.text.isEmpty ||
                        phone.text.isEmpty ||
                        city.text.isEmpty) {
                      sendError();
                    } else {
                      sendForm();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Forum extends StatelessWidget {
  const Forum(
      {@required this.hint,
      @required this.label,
      @required this.control,
      @required this.smallIcon,
      this.inputType});
  final String hint;
  final String label;
  final TextEditingController control;
  final Widget smallIcon;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      controller: control,
      decoration: InputDecoration(
        prefixIcon: smallIcon,
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
