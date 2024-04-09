import 'dart:async';
import 'package:craftybay/presentation/state_holders/verify_otp_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:craftybay/presentation/ui/widgets/app_logo.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int timerSeconds = 120;
  bool isButtonEnabled = false;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          isButtonEnabled = true;
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void resend() {
    setState(() {
      timerSeconds = 120;
      isButtonEnabled = false;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const AppLogo(
                  height: 90,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: AppColors.primaryColor,
                    selectedFillColor: Colors.transparent,
                    selectedColor: Colors.purple,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,

                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<VerifyOtpController>(
                      builder: (verifyOtpController) {
                    return Visibility(
                      visible: verifyOtpController.inProgress == false,
                      replacement: CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await verifyOtpController
                                .verifyOTP(widget.email, _otpTEController.text);
                            if (response) {
                              if (verifyOtpController
                                  .shouldNavigateCompleteProfile) {
                                Get.to(() => const CompleteProfileScreen());
                              } else {}
                            } else {
                              Get.showSnackbar(
                                GetSnackBar(
                                  title: 'OTP verification failed',
                                  message: verifyOtpController.errorMessage,
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      const TextSpan(text: 'This code will expired in '),
                      TextSpan(
                        text: '$timerSeconds s',
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: isButtonEnabled ? resend : null,
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
