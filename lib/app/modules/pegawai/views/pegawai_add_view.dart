import 'package:ifa_21312055/app/modules/pegawai/controllers/pegawai_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PegawaiAddView extends GetView<PegawaiController> {
  const PegawaiAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNP,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "NP"),
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
              onPressed: () => controller.add(
                controller.cNP.text,
                controller.cNama.text,
                controller.cStatus.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}