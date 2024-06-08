import 'package:flutter/material.dart';

import 'package:get/get.dart';

class KonfirmasiView extends GetView {
  const KonfirmasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KonfirmasiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KonfirmasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
