import 'package:dart_style/dart_style.dart';
import 'package:flutter/widgets.dart';
import 'package:webviewx/webviewx.dart';

class DartSnippetView extends StatefulWidget {
  final double height;
  final double width;
  final String code;
  final bool runFormatter;
  const DartSnippetView({
    super.key,
    required this.height,
    required this.width,
    required this.code,
    this.runFormatter = false,
  });

  @override
  State<DartSnippetView> createState() => _DartSnippetViewState();
}

class _DartSnippetViewState extends State<DartSnippetView> {
  String? code;
  @override
  void initState() {
    if (widget.runFormatter) {
      code = DartFormatter().format(widget.code);
    } else {
      code = widget.code;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewX(
      height: widget.height,
      width: widget.width,
      initialSourceType: SourceType.html,
      onWebViewCreated: (controller) {
        controller.loadContent(
          'packages/dart_snippet_view/assets/code_viewer.html',
          SourceType.html,
          fromAssets: true,
        );
        // Image.asset('name',package: '',);

        Future.delayed(const Duration(seconds: 2), () {
          controller.callJsMethod('updateCodeContent', [code]);
        });
      },
    );
  }
}
