import 'dart:io';

import 'package:flutter/material.dart';
import 'package:persistence_write_files/counter_storage.dart';

class FlutterFileStorage extends StatefulWidget {
  const FlutterFileStorage({super.key, required this.storage});

  final CounterStorage storage;

  @override
  State<FlutterFileStorage> createState() => _FlutterFileStorageState();
}

class _FlutterFileStorageState extends State<FlutterFileStorage> {

  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter(){
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture ecriture de fichiers'),
      ),
      body: Center(
        child: Text('Bouton cliquer $_counter foi${_counter == 1 ? '' : 's'}.'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementer',
        child: const Icon(Icons.add),
      ),
    );
  }
}
