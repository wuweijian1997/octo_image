import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/helpers/mock_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Set Demo',
      theme: ThemeData(),
      home: OctoImagePage(
        sets: <OctoSet>[
          OctoSet.blurHash(
            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
          ),
          OctoSet.circleAvatar(
            backgroundColor: Colors.red,
            text: Text(
              "M",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          OctoSet.simple(),
          OctoSet.simple(showProgress: true),
        ],
      ),
    );
  }
}

class OctoImagePage extends StatelessWidget {
  final List<OctoSet> sets;
  const OctoImagePage({Key key, this.sets}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Demo'),
      ),
      body: ListView(
        children: sets.map((element) => _row(element)).toList()
      ),
    );
  }

  Widget _row(OctoSet octoSet) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 269 / 173,
            child: OctoImage.fromSet(
              image: MockImageProvider(useCase: TestUseCase.loadAndFail),
              octoSet: octoSet,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 269 / 173,
            child: OctoImage.fromSet(
              image: MockImageProvider(useCase: TestUseCase.loadAndSuccess),
              octoSet: octoSet,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
