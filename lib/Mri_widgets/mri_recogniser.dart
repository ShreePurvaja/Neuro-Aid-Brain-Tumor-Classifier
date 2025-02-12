import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_classification_app/components/commom_appbar.dart';

import 'package:image_picker/image_picker.dart';
import '../classifier/classifier.dart';
import '../styles/styles.dart';
import 'mri_photo_view.dart';

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'model_unquant.tflite';

class MRIRecogniser extends StatefulWidget {
  const MRIRecogniser({super.key});

  

  @override
  State<MRIRecogniser> createState() => _MRIRecogniserState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _MRIRecogniserState extends State<MRIRecogniser> {
  bool _isAnalyzing = false;
  final picker = ImagePicker();
  File? _selectedImageFile;

  

  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _tumorLabel = ''; // Name of Error Message
  double _accuracy = 0.0;

  late Classifier? _classifier;

  @override
  void initState() {
    super.initState();
    _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );
    _classifier = classifier;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: const CommonAppBarWithDrawer(appBarTitle: 'CHECK MRI', titleColor:  Color.fromARGB(255, 80, 198, 230)),
   drawer:const  CommonDrawer(),
   
    body: Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 20),
          _buildPhotolView(),
          const SizedBox(height: 10),
          _buildResultView(),
          if (_resultStatus == _ResultStatus.found || _resultStatus == _ResultStatus.notFound) ...[
            // Show alert box only when a result is available
            const SizedBox(height: 10),
            _buildAlertBox(),
          ],
          const SizedBox(height: 10),
          _buildPickPhotoButton(
            title: 'Take a photo',
            source: ImageSource.camera,
          ),
          _buildPickPhotoButton(
            title: 'Pick from gallery',
            source: ImageSource.gallery,
          ),
          const Spacer(),
        ],
      ),
    )
    );
  }

  Widget _buildPhotolView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        MRIPhotoView(file: _selectedImageFile),
        _buildAnalyzingText(),
      ],
    );
  }

  Widget _buildAnalyzingText() {
    if (!_isAnalyzing) {
      return const SizedBox.shrink();
    }
    return const Text('Analyzing...', style: kAnalyzingTextStyle);
  }

  

  Widget _buildPickPhotoButton({
    required ImageSource source,
    required String title,
  }) {
    return TextButton(
      onPressed: () => _onPickPhoto(source),
      child: Container(
        width: 300,
        height: 50,
        color: const Color.fromARGB(255, 63, 0, 90),
        child: Center(
            child: Text(title,
                style: const TextStyle(
                  fontFamily: kButtonFont,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ))),
      ),
    );
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }

  void _onPickPhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    final imageFile = File(pickedFile.path);
    setState(() {
      _selectedImageFile = imageFile;
    });

    _analyzeImage(imageFile);
  }

  void _analyzeImage(File image) {
    _setAnalyzing(true);

    final imageInput = img.decodeImage(image.readAsBytesSync())!;

    final resultCategory = _classifier!.predict(imageInput);

    final result = resultCategory.score >= 0.8
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final tumorLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _tumorLabel = tumorLabel;
      _accuracy = accuracy;
    });
  }

  Widget _buildResultView() {
    var title = '';

    if (_resultStatus == _ResultStatus.notFound) {
      title = 'Fail to recognise';
    } else if (_resultStatus == _ResultStatus.found) {
      title = _tumorLabel;
    } else {
      title = '';
    }

    //
    var accuracyLabel = '';
    if (_resultStatus == _ResultStatus.found) {
      accuracyLabel = 'Accuracy: ${(_accuracy * 100).toStringAsFixed(2)}%';
    }

    return Column(
      children: [
        Text(title, style: kResultTextStyle),
        const SizedBox(height: 10),
        Text(accuracyLabel, style: kResultRatingTextStyle)
      ],
    );
  }

  Widget _buildAlertBox() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.all(10),
    width: 300,
    decoration: BoxDecoration(
      color: const Color(0xFFFFE5E5), // Light red background
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: const Color(0xFFFF7A7A), // Slightly darker red border
        width: 1,
      ),
    ),
    child:const Padding(
      padding: EdgeInsets.only(right: 5,left: 7),
      child:   Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
            size: 24,
          ),
           SizedBox(width: 10),
          Expanded(
            child: Text(
              'The AI result may not be 100% accurate. Please consult a neurologist for further details.',
              style:  TextStyle(
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
