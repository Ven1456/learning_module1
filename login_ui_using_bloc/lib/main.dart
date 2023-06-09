import 'package:flutter/material.dart';
import 'package:login_ui_using_bloc/Bloc/login_bloc.dart';
import 'package:login_ui_using_bloc/screens/interface_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
bool _obsecureText=true;

  changeThePage (BuildContext context){
    Navigator.of(context).
    push(MaterialPageRoute(builder: (context)=>const Interface()));
}

  @override
  Widget build(BuildContext context) {
    final bloc =Bloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern Using UI"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration
          (
          image: DecorationImage(
            image: NetworkImage
              ("https://img.freepik.com/premium-vector/red-black-abstract-geometric-shapes-white-background-suitable-presentation-background-banner-web-landing-page-ui-mobile-app-editorial-design-flyer-banner-other-related-occasion_181182-14464.jpg?w=2000"),
              fit: BoxFit.cover
          )

        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder:(context,snapshot) =>  TextField(
                  onChanged: bloc.emailChanged,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      hintText: "Enter Email",
                      labelText: "Email",

                    errorText: snapshot.error?.toString(),

                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder:(context,snapshot) => TextField(
                  onChanged: bloc.passwordChange,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),

                        borderSide: const BorderSide(color: Colors.white,width: 2.0)
                      ),


                      hintText: "Enter Password",
                    suffixIcon: GestureDetector(onTap: (){
                      setState(() {
                        _obsecureText =! _obsecureText;
                      });

                    },
                      child:  Icon(_obsecureText ? Icons.visibility_off : Icons.visibility),


                    ),

                      labelText: "Password",


                    errorText: snapshot.error?.toString(),

                  ),
                  obscureText: _obsecureText,

                ),
              ),
              const SizedBox(height: 15),

              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder:(context,snapshot) =>
                    ElevatedButton
                      (onPressed: snapshot.hasData ? ()
                    => changeThePage(context):null,
                    child: const Text("Submit"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                      ),

                    ),
              )

              ]
          ),

        ),
      ),

    );
  }
}
