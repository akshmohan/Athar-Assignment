// ignore_for_file: avoid_print

import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OcrService {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  Future<String?> extractExpiryDate(File imageFile) async {
  try {
     final InputImage inputImage = InputImage.fromFile(imageFile);

   final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);

   final text = recognizedText.text;

   print('---------------RECOGNIZED TEXT: $text-------------------');

   if(text.isEmpty) {
     return null;
   }

   return _extractExpiryDateFromText(text);
  } catch (e) {
    print('--------------ERROR DURING OCR: $e--------------------------');
    return null;
  }
  
  }

  String? _extractExpiryDateFromText(String text) {

    final expiryDatePattern = RegExp(r'(\d{1,2}/\d{1,2}/\d{4}|\d{1,2}-\d{1,2}-\d{4}|\d{1,2}\s+[a-zA-Z]+\s+\d{4})');
    final match = expiryDatePattern.firstMatch(text);

    return match?.group(0);
  }
 }