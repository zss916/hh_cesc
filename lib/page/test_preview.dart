import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class TestPreview extends StatelessWidget {
  @Preview(name: 'Constructor TestPreview')
  const TestPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("preview", style: TextStyle(color: Colors.amber)),
    );
  }
}

@Preview(name: 'Top-level preview')
Widget preview() => const Text('Foo');

@Preview(name: 'Builder preview')
WidgetBuilder builderPreview() {
  return (BuildContext context) {
    return const Text('Builder');
  };
}

//flutter widget-preview start