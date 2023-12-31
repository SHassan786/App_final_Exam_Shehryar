import 'package:finalexam/pages/sample_ui.dart';
import 'package:finalexam/pages/transaction_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc/item_bloc.dart';
import 'bloc/login_bloc.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';
import 'repository/auth_repository.dart';
import 'repository/item_repository.dart';

void main() async {
  //initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Define Repositories here
    final AuthRepository authRepository = AuthRepository();
    final ItemRepository itemRepository = ItemRepository();

    //Use multiblock provider to use multiple blocs
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(authRepository: authRepository),
        ),
        BlocProvider<ItemBloc>(
          create: (context) => ItemBloc(itemrepository: itemRepository),
        ),
        // Add more BlocProviders if needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //Define initial route
        home: TransactionListScreen(),
        routes: {
          // Define your app's routes here
          '/login': (context) => LoginPage(),
          // Add more routes as needed
        },
      ),
    );
  }
}
