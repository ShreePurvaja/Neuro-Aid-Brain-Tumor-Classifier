import 'dart:io';
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class MRIPhotoView extends StatelessWidget {
  final File? file;
  const MRIPhotoView({super.key, this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      color: Colors.blueGrey,
      child: (file == null)
          ? _buildEmptyView()
          : Image.file(file!, fit: BoxFit.cover),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
        child: Text(
      'Please pick a photo',
      style: kAnalyzingTextStyle,
    ));
  }
}
