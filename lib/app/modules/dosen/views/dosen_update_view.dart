import 'package:ifa_21312055/app/modules/dosen/controllers/dosen_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DosenUpdateView extends GetView<DosenController> {
  const DosenUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Dosen'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNIDN.text = data['nidn'];
            controller.cNama.text = data['nama'];
            controller.cStatus.text = data['status'];
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNIDN,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "NIDN"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNama,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Nama"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cStatus,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Status"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.Update(
                      controller.cNIDN.text,
                      controller.cNama.text,
                      controller.cStatus.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}