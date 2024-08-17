import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future saveFile(dynamic response, String fileName) async {
  // where response is the file data from api ex: bytes data
  try {
    Directory? tempDir;

    if (Platform.isAndroid) {
      tempDir = await getExternalStorageDirectory();

      String newPath = "";
      List<String> folders = tempDir!.path.split("/");

      for (var i = 1; i < folders.length; i++) {
        String folder = folders[i];
        if (folder != "Android") {
          newPath += "/" + folder;
          print(newPath);
        } else {
          break;
        }
      }
      String mufratyPath = join(newPath, "warehouse_management");
      Directory muframtyDir = Directory(mufratyPath);
      print("successed install1");
      if (!muframtyDir.existsSync()) {
        print("successed install2");
        await muframtyDir.create(recursive: true);
      }

      String filePath = join(muframtyDir.path, fileName);
      print("successed install");
      print(filePath);
      File file = File(filePath);
      await file.writeAsBytes(response);
    } else {
      Directory? tempDir2 = await getApplicationDocumentsDirectory();
      print(tempDir2.path);
      String mufratyPath = join(tempDir2.path, "warehouse_management");
      Directory muframtyDir = Directory(mufratyPath);

      if (!muframtyDir.existsSync()) {
        await muframtyDir.create(recursive: true);
      }

      String filePath = join(muframtyDir.path, fileName);

      print(filePath);
      File file = File(filePath);
      await file.writeAsBytes(response);
    }

    // }
  } catch (e) {
    print(e.toString());
  }
}
