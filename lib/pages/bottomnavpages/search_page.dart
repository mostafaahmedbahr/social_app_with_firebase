import 'package:flutter/material.dart';

import '../../widgets/build_no_content.dart';
import '../../widgets/build_search_field.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: buildNoContent(context),
    );
  }
}
