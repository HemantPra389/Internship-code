import 'dart:io';

void main() {
  final Directory directory = Directory('/path/to/your/local/directory');
  printFiles(directory);
}

void printFiles(Directory directory, [String parentFolderName = '']) {
  parentFolderName = parentFolderName.isNotEmpty ? '$parentFolderName/' : '';
  final List<FileSystemEntity> files = directory.listSync();

  for (final FileSystemEntity file in files) {
    if (file is File) {
      print('${parentFolderName}${file.path.split('/').last}');
    } else if (file is Directory) {
      printFiles(file, '${parentFolderName}${file.path.split('/').last}');
    }
  }
}
