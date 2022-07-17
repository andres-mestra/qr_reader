import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';

class UseProviders {
  static UiProvider uiProvider(BuildContext context, {bool listen = true}) {
    return Provider.of<UiProvider>(context, listen: listen);
  }

  static ScanListProvider scanListProvider(BuildContext context,
      {bool listen = true}) {
    return Provider.of<ScanListProvider>(context, listen: listen);
  }
}
