/*
import 'package:flutter/material.dart';
import 'package:to_csv/to_csv.dart' as export_csv;

class ToCsvButton extends StatefulWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final String title;

  const ToCsvButton({
    super.key,
    required this.title,
    required this.headers,
    required this.rows,
  });

  @override
  State<ToCsvButton> createState() => _ToCsvButtonState();
}

class _ToCsvButtonState extends State<ToCsvButton> {
  bool _exporting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 20),
      child: InkWell(
        onTap: _exporting ? null : _export,
        child: _exporting
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsetsDirectional.all(10),
                child: const Icon(Icons.download_rounded, color: Colors.white),
              ),
      ),
    );
  }

  Future<void> _export() async {
    if (widget.headers.isEmpty || widget.rows.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No data to export')));
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _exporting = true);
    try {
      await export_csv.myCSV(
        widget.headers,
        widget.rows,
        fileName:
            '${widget.title}export-${DateTime.now().millisecondsSinceEpoch}',
        includeNoRow: false,
      );
      if (!mounted) return;
      messenger.showSnackBar(
        const SnackBar(content: Text('Excel file exported successfully!')),
      );
    } catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text('Export failed: $e')));
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }
}
*/
