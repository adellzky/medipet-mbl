import 'package:flutter/material.dart';
import 'package:pbl_mobile/model/ApiService.dart';
import '../login/login.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool isChecked = false;
  bool _isObscure = true;
  bool _Obscure = true;

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
            )),
        const Text(
          "Your Pet’s Health Assistant",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0XFFBE83B2)),
        ),
        Container(
          padding: const EdgeInsets.only(top: 50),
          child: TextField(
            controller: namaController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0XFFE1DAF5),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: "Full Name",
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(21)),
              ),
              prefixIcon: const Icon(Icons.person),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 21),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0XFFE1DAF5),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: "Email",
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(21)),
              ),
              prefixIcon: const Icon(Icons.email),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 21),
          child: TextField(
            controller: passController,
            obscureText: _isObscure,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFE1DAF5),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(21)),
              ),
              hintText: "password",
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 21, bottom: 25),
          child: TextField(
            controller: confirmpassController,
            obscureText: _Obscure,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFE1DAF5),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(21)),
              ),
              hintText: "password",
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                  icon:
                      Icon(_Obscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _Obscure = !_Obscure;
                    });
                  }),
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
            const Text('By creating an account\n'
                'you are agree to the Terms and\n'
                'Conditions and Privacy Policy'),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ElevatedButton(
            onPressed: () async {
              try {
                final auth = await Api().register(
                    namaController.text,    
                    emailController.text,
                    passController.text,
                    confirmpassController.text,
                    );
                Navigator.pushReplacementNamed(context, '/home');
              } catch (e) {
                print(e);
              }
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                backgroundColor: Color(0XFFBE83B2),
                fixedSize: Size(240, 45)),
            child: const Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text("Already have an Account? Log In",
                style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }
}
