import 'package:dart_snippet_view/dart_snippet_view.dart';
import 'package:flutter/material.dart';

class CodeViewer extends StatefulWidget {
  const CodeViewer({super.key});

  @override
  State<CodeViewer> createState() => _CodeViewerState();
}

class _CodeViewerState extends State<CodeViewer> {
  @override
  Widget build(BuildContext context) {
    return DartSnippetView(
      height: 500,
      width: 800,
      code: code(),
    );
  }

  String code() {
    return '''
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dart_style/dart_style.dart';
import 'package:example/fy_gen/sample.fsg.dart';
import 'package:example/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('code finder test', () {
    DartFormatter formatter = DartFormatter();
    String formattedCode =
        formatter.format(FSGCode.getCodeByType<Home>() ?? '');
    print(formattedCode);
  });
}
''';
  }
}
