import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_practise/Provider/LoginProvider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> toggel = ValueNotifier<bool>(false);
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      appBar: AppBar(
        title: const Center(child: Text("Login ")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              child: Image.asset('images/download.jpg'),
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email",
                    focusColor: Colors.blue,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue)))),
          ),
          const SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                  valueListenable: toggel,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: toggel.value,
                      decoration: InputDecoration(
                          hintText: "Password",
                          focusColor: Colors.blue,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          suffixIcon: InkWell(
                              onTap: () {
                                toggel.value = !toggel.value;
                              },
                              child: Icon(toggel.value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue))),
                    );
                  })),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                String result = await auth.auth(emailController.text.toString(),
                    passwordController.text.toString());
                final snackBar = SnackBar(content: Text(result));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: auth.loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Enter")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
