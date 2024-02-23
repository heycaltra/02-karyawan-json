import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:karyawan/models/karyawan.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<Karyawan>> _loadEmployee(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/karyawan.json');
    List<dynamic> jsonList = json.decode(data);
    return jsonList.map((json) => Karyawan.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Daftar Karyawan')),
        body: FutureBuilder<List<Karyawan>>(
            future: _loadEmployee(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Karyawan> karyawan = snapshot.data!;
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(karyawan[index].nama),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Umur: ${karyawan[index].umur}'),
                              const SizedBox(height: 2),
                              Text(
                                  'Umur: ${karyawan[index].alamat.jalan}, ${karyawan[index].alamat.kota}, ${karyawan[index].alamat.provinsi}'),
                            ],
                          ));
                    },
                    itemCount: karyawan.length);
              }
            }));
  }
}
