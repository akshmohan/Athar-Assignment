import 'package:athar_assignment/features/scan/domain/services/image_picker_service.dart';
import 'package:athar_assignment/features/scan/domain/services/ocr_service.dart';
import 'package:athar_assignment/features/scan/presentation/cubit/expiry_date_cubit.dart';
import 'package:athar_assignment/features/scan/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => ExpiryDateCubit(
          ImagePickerService(),
          OcrService(),
        ),
        child: const HomePage(),
      ),
    );
  }
}
