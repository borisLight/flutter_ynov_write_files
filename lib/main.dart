import 'package:flutter/material.dart';
import 'package:persistence_write_files/counter_storage.dart';
import 'package:persistence_write_files/flutter_file_storage_exemple.dart';

void main() {
  runApp(MaterialApp(
    title: "Lecture ecriture de fichiers",
    home: FlutterFileStorage(storage: CounterStorage(),),
  ));
}

