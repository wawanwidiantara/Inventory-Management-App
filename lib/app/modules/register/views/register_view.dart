import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';
import 'package:jendral_muda_app/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 32),
                  const Text('Daftar',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: SvgPicture.asset("assets/images/login.svg"),
                    ),
                  ),
                  const Text('Nama',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryBlack,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: TextFormField(
                      controller: controller.nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: AppColors.primaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 24),
                        hintText: 'Masukkan nama Anda',
                        hintStyle: const TextStyle(
                            color: AppColors.greyText,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        filled: true,
                        fillColor: AppColors.formFill,
                        focusColor: AppColors.mainBackground,
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryBlack, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.formFill),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('No WA',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryBlack,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: TextFormField(
                      controller: controller.waController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No WA tidak boleh kosong';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: AppColors.primaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 24),
                        hintText: 'Masukkan No WA Anda',
                        hintStyle: const TextStyle(
                            color: AppColors.greyText,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        filled: true,
                        fillColor: AppColors.formFill,
                        focusColor: AppColors.mainBackground,
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryBlack, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.formFill),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Kata sandi',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryBlack,
                          fontWeight: FontWeight.normal)),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: TextFormField(
                      controller: controller.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi tidak boleh kosong';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: AppColors.primaryBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 24),
                        hintText: 'Masukkan kata sandi Anda',
                        hintStyle: const TextStyle(
                            color: AppColors.greyText,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        filled: true,
                        fillColor: AppColors.formFill,
                        focusColor: AppColors.mainBackground,
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryBlack, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.formFill),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  controller.register();
                                  FocusScope.of(context).unfocus();
                                },
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.mainBackground),
                                )
                              : const Text("Daftar",
                                  style: TextStyle(
                                      color: AppColors.mainBackground,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Sudah punya akun? ',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryBlack,
                        ),
                        children: <InlineSpan>[
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: GestureDetector(
                              onTap: () {
                                Get.offAndToNamed(Routes.LOGIN);
                              },
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
