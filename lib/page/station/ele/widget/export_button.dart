import 'dart:convert';
import 'dart:io';

import 'package:cescpro/core/translations/en.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

typedef ExportCallback = void Function(String? path);

class ExportButton extends StatefulWidget {
  final List<List<dynamic>> data;
  final String fileNamePrefix;
  final ExportCallback? onExported;
  final bool showProgress;

  const ExportButton({
    super.key,
    required this.data,
    this.fileNamePrefix = 'export',
    this.onExported,
    this.showProgress = true,
  });

  @override
  State<ExportButton> createState() => _ExportButtonState();
}

class _ExportButtonState extends State<ExportButton> {
  bool _exporting = false;
  double _progress = 0;
  String? _savedPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 15),
      child: InkWell(
        onTap: _exporting ? null : _export,
        child: _exporting
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.save_alt_outlined, color: Colors.white),
      ),
    );
  }

  Future<void> _export() async {
    if (widget.data.isEmpty) {
      return;
    }
    try {
      setState(() {
        _exporting = true;
        _progress = 0;
        _savedPath = null;
      });

      String directory;
      bool shareAfter = false;

      if (Platform.isIOS) {
        final docDir = await getApplicationDocumentsDirectory();
        directory = docDir.path;
        shareAfter = true;
      } else {
        const downloadPath = '/storage/emulated/0/Download/cesc';
        final dir = Directory(downloadPath);
        if (!await dir.exists()) {
          await dir.create(recursive: true);
        }
        directory = downloadPath;
      }

      setState(() => _progress = 0.3);

      final csvStr = const ListToCsvConverter(eol: '\n').convert(widget.data);
      final ts = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final path = p.join(directory, '${widget.fileNamePrefix}_$ts.csv');

      setState(() => _progress = 0.7);

      const utf8Bom = '\uFEFF';
      await File(
        path,
      ).writeAsString(utf8Bom + csvStr, encoding: Encoding.getByName('utf-8')!);

      setState(() {
        _savedPath = path;
        _exporting = false;
        _progress = 1;
      });

      widget.onExported?.call(path);

      if (!mounted) return;

      if (shareAfter) {
        final params = ShareParams(files: [XFile(path)]);
        await SharePlus.instance.share(params);
        await _showInfoDialog(
          TKey.exportSuccessful.tr,
          TKey.exportSaved.trArgs([path]),
        );
      } else {
        await _showInfoDialog(
          TKey.exportSuccessful.tr,
          TKey.exportSaved.trArgs([path]),
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _exporting = false);
      await _showErrorDialog('export error', e.toString());
      widget.onExported?.call(null);
    }
  }

  Future<void> _showInfoDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF23282E),
        title: Text(title, style: TextStyle(color: Colors.white)),
        content: Text(message, style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(TKey.confirm.tr, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> _showErrorDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF23282E),
        title: Text(title, style: TextStyle(color: Colors.white)),
        content: Text(message, style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(TKey.confirm.tr, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
