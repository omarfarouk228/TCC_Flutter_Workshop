import 'package:first_app/colors.dart';
import 'package:first_app/pages/dashboard.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  bool isPasswordObscured = true;

  // Déclaration des contrôlleurs
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Déclaration de la clé du formulaire
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create an account✨",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text('Welcome! Please enter your details.'),
              SizedBox(height: 20),
              Text("Name"),
              SizedBox(height: 5),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  } else if (value.length < 8) {
                    return "Name must be at least 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text("Email"),
              SizedBox(height: 5),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.mail_outline_rounded),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (value.contains('@') == false ||
                      value.contains('.') == false) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text("Password"),
              SizedBox(height: 5),
              TextFormField(
                controller: passwordController,
                obscureText: isPasswordObscured,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: '********',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: isPasswordObscured
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                    onPressed: () {
                      isPasswordObscured = !isPasswordObscured;
                      setState(() {});
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (val) {}),
                  Text("Must be at least 8 characters"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => handleRegister(),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Sign up"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: Divider()),
                  Text("Or sign up with"),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  _buildCard(imagePath: 'assets/images/apple.png'),
                  _buildCard(imagePath: 'assets/images/google.png'),
                  _buildCard(imagePath: 'assets/images/facebook.png'),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text("Already have an account?"),
                  Text("Log in", style: TextStyle(color: primaryColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleRegister() {
    if (formKey.currentState!.validate()) {
      String name = nameController.text;
      String email = emailController.text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(name: name, email: email),
        ),
      );
    }
  }

  Widget _buildCard({required String imagePath}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset(imagePath, width: 22, height: 22),
      ),
    );
  }
}
