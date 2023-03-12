import "package:flutter/material.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  //Uniquely identify form state and particular form.
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  void formVal(){
    if(keyForm.currentState!.validate()){
      print("Ok");
    }else{
      print("Not Ok");
    }
  }

  Widget build(BuildContext context){
    return MaterialApp(
      title:"Personal Details Form",
      home: Scaffold(
        appBar: AppBar(title: Text("Form"),),
        body: Stack(
           alignment: Alignment.center,
           children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("images/avatar.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key:keyForm,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.mail_lock_outlined)
                          ),
                          validator: (val){
                            if(val == null || val.isEmpty){
                              return "Required";
                            }else{
                              return null;
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: formVal,
                              child: Text("Submit"),
                            ),)
                      ],
                    ),
                  ),
                )
              ],
            ),
           ],
         )
        ),
    );
  }
}