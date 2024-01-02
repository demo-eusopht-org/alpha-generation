import 'package:flutter/material.dart';

class ViewSelectedFile extends StatefulWidget {
  final String filePath;
  const ViewSelectedFile({super.key, required this.filePath});

  @override
  State<ViewSelectedFile> createState() => _ViewSelectedFileState();
}

class _ViewSelectedFileState extends State<ViewSelectedFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('File Path: ${widget.filePath}'),
      ),
    );
  }
}
