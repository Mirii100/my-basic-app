import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mybasicapp/screens/homepage.dart';
import 'package:mybasicapp/screens/utils/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {
    if (kIsWeb) {
      Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyB5cpinsrXoQDr_hffZvijjKhKIC6jziuo",
            appId: "1:800744280249:web:83e3c03cccab8cb225cb68",
            messagingSenderId: "800744280249",
            projectId: "mydolist-931d5",
            authDomain: "mydolist-931d5.firebaseapp.com",
            storageBucket: "mydolist-931d5.firebasestorage.app",

          )
// onst firebaseConfig = {
//   apiKey: "AIzaSyB5cpinsrXoQDr_hffZvijjKhKIC6jziuo",
//   authDomain: "mydolist-931d5.firebaseapp.com",
//
//   storageBucket: "mydolist-931d5.firebasestorage.app",
//
//   appId: "1:800744280249:web:83e3c03cccab8cb225cb68"
// };

      );
    }
    else {
      await Firebase.initializeApp();
    }
  }

  catch (e){
    print('firebase intialization error $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list ',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),

    );
  }
}


