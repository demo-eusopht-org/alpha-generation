import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SelectedFilesModal extends StatefulWidget {
  final List<PlatformFile> files;

  SelectedFilesModal({required this.files});

  @override
  _SelectedFilesModalState createState() => _SelectedFilesModalState();
}

Future<List<String>?> _pickMultipleImages() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true, // Allow selecting multiple files
    type: FileType.image,
  );

  if (result != null) {
    List<String> paths = result.files.map((e) => e.path ?? '').toList();
    return paths;
  }
  return null;
}

class _SelectedFilesModalState extends State<SelectedFilesModal> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.files.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: widget.files[index].path != null
                        ? Image.file(
                            File(widget.files[index].path!),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.image),
                    title: Text(widget.files[index].name ?? 'Unknown File'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          widget.files.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Add logic to pick additional images here
                List<String>? additionalImages = await _pickMultipleImages();
                if (additionalImages != null) {
                  setState(() {
                    widget.files.addAll(additionalImages.map(
                      (e) => PlatformFile(
                        path: e,
                        name: e.substring(e.lastIndexOf('/') + 1),
                        size: 20,
                      ),
                    ));
                  });
                }
              },
              child: Text('Add More Images'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }
}
