
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/counter.txt");
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Lecture du fichier
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e){
      // Retourner 0 en cas d'erreur
      return 0;
    }
  }

  Future <File> writeCounter(int counter) async {
    final file = await _localFile;
    // Ecrire le fichier
    return file.writeAsString('$counter');
  }



}