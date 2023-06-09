import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _obsecureText = true ;

  void login(String email , String password) async
  {
        try {
          Response response =await  post(
            Uri.parse("https://reqres.in/api/register"),
            body: {
              "email" :email,
              "password" : password,

            }



          );
         if(response.statusCode==200)
           {
             print("Created Successfully");
           }
         else
           {
             print("failed");
           }
        }

        catch(e)
    {
      print("somethig went wrong");
    }
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("SignUp Using API"),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) =>value!.contains("@") ? null : "Please enter correct email",
                controller: emailController,
                decoration: InputDecoration(
                  labelText:"Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )

                ),
              ),
              SizedBox(height: 20,),

              TextFormField(
                validator: (value) =>value!.length>4  ? null : "Please enter correct Password",
                controller: passwordController,
                obscureText: _obsecureText,
                obscuringCharacter: "*",

                decoration: InputDecoration(
                  labelText:"Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                                    

                  suffixIcon: GestureDetector(
                    onTap: (){
                    setState(() {

                      _obsecureText= ! _obsecureText;
                    });

                    },
                    child: Icon(
                      _obsecureText ? Icons.visibility : Icons.visibility_off
                    ) ,
                  )



                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){
               login(emailController.text.toString(), passwordController.text.toString());
               if(_formkey.currentState!.validate())
                 {
                   showSuccessSnackBar("Submit successfull");

                 }
               else
                 {
                   showErrorSnackBar("submit failed");
                 }




              }, child: Text("Submit"))
            ],
          ),
        ),
      )
    );
  }

  void showSuccessSnackBar(String message) {
    final snackBar = SnackBar(

      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

void showErrorSnackBar(String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
}
