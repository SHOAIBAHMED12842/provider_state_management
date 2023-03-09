
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/Auth_Prioider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final authProvider =Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                //obscureText: toogle.value,
                //enabled: toogle.value,
                decoration: const InputDecoration(
                  hintText: "Email",
                  suffix: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                //enabled: toogle.value,
                decoration: const InputDecoration(
                  hintText: "Password",
                  suffix: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  authProvider.login(emailController.text.toString(), passController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child:authProvider.loading? const CircularProgressIndicator(color: Colors.white,):Text('Login'),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
