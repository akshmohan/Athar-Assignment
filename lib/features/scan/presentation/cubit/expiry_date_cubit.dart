import 'dart:io';
import 'package:athar_assignment/features/scan/domain/services/image_picker_service.dart';
import 'package:athar_assignment/features/scan/domain/services/ocr_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expiry_date_state.dart';

class ExpiryDateCubit extends Cubit<ExpiryDateState> {

  final ImagePickerService _imagePickerService;
  final OcrService _ocrService;

  ExpiryDateCubit(this._imagePickerService, this._ocrService) : super(ExpiryDateInitial());

  Future<void> pickAndProcessImage() async{
    try {
      emit(ExpiryDateLoading());

      final pickedImage = await _imagePickerService.pickImage();
      if(pickedImage == null) {
        emit(ExpiryDateError('No image picked'));
        return;
      }

      final expiryDate = await _ocrService.extractExpiryDate(File(pickedImage.path));  
      if(expiryDate == null) {
        emit(ExpiryDateError('No expiry date found'));
        return;
      }

      emit(ExpiryDateLoaded(expiryDate));
      
    } catch (e) {
      emit(ExpiryDateError('-------------ERROR OCCURED: $e--------------------------'));
    }
  }
}
