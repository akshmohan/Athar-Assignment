// ignore_for_file: avoid_print

import 'package:athar_assignment/features/scan/presentation/cubit/expiry_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Scan")),
      body: Center(
        child: BlocConsumer<ExpiryDateCubit, ExpiryDateState>(
          listener: (context, state) {
            if (state is ExpiryDateLoaded) {
            } else if (state is ExpiryDateError) {
              print('state is ExpiryDateError');
            }
          },
          builder: (context, state) {
            if (state is ExpiryDateLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                context.read<ExpiryDateCubit>().pickAndProcessImage();
              },
              child: const Text(
                'Scan Expiry Date',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
