import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ViewPost.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/components/signup_form.dart';
import '../../Signup/signup_screen.dart';
import '../../../main.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myPassword = TextEditingController();
    final myEmail = TextEditingController();
    final _auth = FirebaseAuth.instance;
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: myEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: myPassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: myEmail.text, password: myPassword.text);
                  if (user != null) {
                    // ignore: use_build_context_synchronously
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title:
                                  Text('You Successfuly login ${myEmail.text}'),
                              content:
                                  Text('You Successfuly login ${myEmail.text}'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ViewPost();
                                      },
                                    ),
                                  ),
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  }
                } on FirebaseAuthException catch (e) {
                  showAlertDialog(context, e.message.toString());
                }
                // final data = await supabase
                //     .from('users')
                //     .select()
                //     .eq('password', myPassword.text)
                //     .eq('email', myEmail.text)
                //     .then((value) => {
                //           if (value.length == 0)
                //             {
                //               showDialog<String>(
                //                   context: context,
                //                   builder: (BuildContext context) =>
                //                       AlertDialog(
                //                         title: Text('Error'),
                //                         content: Text('user does not exit'),
                //                         actions: <Widget>[
                //                           TextButton(
                //                             onPressed: () =>
                //                                 Navigator.pop(context, 'OK'),
                //                             child: const Text('OK'),
                //                           ),
                //                         ],
                //                       ))
                //             }
                //           else
                //             {

                //             }
                //         });
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
