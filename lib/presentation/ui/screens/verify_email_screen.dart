import 'package:craftybay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                height: 160,
              ),
              AppLogo(
                height: 90,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Welcome back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Please Enter your Email Address',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 24,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text('Next'),)),
            ],
          ),
        ),
      ),
    );
  }
}
