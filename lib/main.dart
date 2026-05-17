import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_app/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // هذا يتم إنشاؤه عند إضافة التطبيق على Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // اختبار الاتصال
  try {
    var snapshot = await FirebaseFirestore.instance.collection('products').get();
    print('عدد المنتجات في Firebase: ${snapshot.docs.length}');
  } catch (e) {
    print('خطأ عند الاتصال بـ Firebase: $e');
  }


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
    );
  }
}