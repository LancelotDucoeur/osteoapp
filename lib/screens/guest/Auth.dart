import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int, String) onChangedStep;
  const AuthScreen({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Column(children: [
              RichText(
                text: TextSpan(
                  text: "Application\n".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  children: [
                    TextSpan(
                      text: "d'Ostéopathie\n".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: "pour animaux".toUpperCase(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Entrer votre email'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onChanged: (value) => setState(() => _email = value),
                      validator: (value) =>
                          value!.isEmpty || !emailRegex.hasMatch(value)
                              ? "Please enter a valid email"
                              : null,
                      decoration: InputDecoration(
                        hintText: "exemple@exemple.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: !emailRegex.hasMatch(_email)
                          ? null
                          : () => {
                                if (_formKey.currentState!.validate())
                                  {widget.onChangedStep(1, _email)}
                              },
                      child: Text(
                        "continuer".toUpperCase(),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
