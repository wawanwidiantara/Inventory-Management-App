import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddSupplierView extends GetView {
  const AddSupplierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddSupplierView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddSupplierView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
