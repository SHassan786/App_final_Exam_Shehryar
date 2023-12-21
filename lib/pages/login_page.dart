import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the LoginBloc that was provided using BlocProvider
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Incorrect email or password"),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is LoginSuccess) {
            //Navigator to navigate to the respected page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfilesListPage()),
            // );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: state is LoginLoading
                          ? null
                          : () {
                              loginBloc.add(LoginSubmitted(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ));
                            },
                      child: state is LoginLoading
                          ? const CircularProgressIndicator()
                          : const Text('LOGIN'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
