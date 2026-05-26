import 'dart:io';

import 'package:cescpro/core/translations/en.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExportUtil {
  static Future<void> export(
    List<List<dynamic>> data,
    String fileNamePrefix,
  ) async {
    if (data.isEmpty) {
      return;
    }
    try {
      /* setState(() {
        _exporting = true;
        _progress = 0;
        _savedPath = null;
      });*/

      String directory;
      bool shareAfter = false;

      if (Platform.isIOS) {
        final docDir = await getApplicationDocumentsDirectory();
        directory = docDir.path;
        shareAfter = true;
      } else {
        const downloadPath = '/storage/emulated/0/Download/cesc2';
        final dir = Directory(downloadPath);
        if (!await dir.exists()) {
          await dir.create(recursive: true);
        }
        directory = downloadPath;
      }

      // setState(() => _progress = 0.3);

      final excel = Excel.createExcel();
      final sheet = excel["Sheet1"];

      for (int i = 0; i < data.length; i++) {
        for (int j = 0; j < data[i].length; j++) {
          final cellValue = _convertToCellValue(data[i][j]);
          final cell = sheet.cell(
            CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i),
          );
          cell.value = cellValue;

          if (j == data[i].length - 1) {
            cell.cellStyle = CellStyle(
              horizontalAlign: HorizontalAlign.Center,
              verticalAlign: VerticalAlign.Center,
            );
          }
        }
      }

      _mergeSameDateAmountCells(sheet, data);

      //setState(() => _progress = 0.7);

      final ts = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final path = p.join(directory, '${fileNamePrefix}_$ts.xlsx');

      final fileBytes = excel.encode();
      if (fileBytes != null) {
        await File(path).writeAsBytes(fileBytes);
      }

      /*setState(() {
        _savedPath = path;
        _exporting = false;
        _progress = 1;
      });*/

      // widget.onExported?.call(path);

      // if (!mounted) return;

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
      //if (!mounted) return;
      //setState(() => _exporting = false);
      await _showErrorDialog('export error', e.toString());
      //widget.onExported?.call(null);
    }
  }

  static CellValue _convertToCellValue(dynamic value) {
    if (value == null || value == '') {
      return TextCellValue('');
    } else if (value is String) {
      return TextCellValue(value);
    } else if (value is int) {
      return IntCellValue(value);
    } else if (value is double) {
      return DoubleCellValue(value);
    } else if (value is bool) {
      return BoolCellValue(value);
    } else {
      return TextCellValue(value.toString());
    }
  }

  static void _mergeSameDateAmountCells(Sheet sheet, List<List<dynamic>> data) {
    if (data.length <= 1) return;

    int rowCount = data.length;
    int dateColumnIndex = 0;
    int amountColumnIndex = data[0].length - 1;

    int i = 1;
    while (i < rowCount) {
      String currentDate = data[i][dateColumnIndex].toString();
      int startRow = i;
      int endRow = i;
      double totalAmount = 0;

      while (endRow + 1 < rowCount) {
        String nextDate = data[endRow + 1][dateColumnIndex].toString();
        if (nextDate == currentDate) {
          endRow++;
          var amountValue = data[endRow][amountColumnIndex];
          if (amountValue != null && amountValue != '') {
            if (amountValue is num) {
              totalAmount += amountValue.toDouble();
            } else {
              try {
                totalAmount += double.parse(amountValue.toString());
              } catch (_) {}
            }
          }
        } else {
          break;
        }
      }

      if (endRow > startRow) {
        final dateCell = sheet.cell(
          CellIndex.indexByColumnRow(
            columnIndex: dateColumnIndex,
            rowIndex: startRow,
          ),
        );
        dateCell.cellStyle = CellStyle(
          horizontalAlign: HorizontalAlign.Center,
          verticalAlign: VerticalAlign.Center,
        );
        sheet.merge(
          CellIndex.indexByColumnRow(
            columnIndex: dateColumnIndex,
            rowIndex: startRow,
          ),
          CellIndex.indexByColumnRow(
            columnIndex: dateColumnIndex,
            rowIndex: endRow,
          ),
        );

        final amountCell = sheet.cell(
          CellIndex.indexByColumnRow(
            columnIndex: amountColumnIndex,
            rowIndex: startRow,
          ),
        );
        amountCell.value = DoubleCellValue(totalAmount);
        amountCell.cellStyle = CellStyle(
          horizontalAlign: HorizontalAlign.Center,
          verticalAlign: VerticalAlign.Center,
        );
        sheet.merge(
          CellIndex.indexByColumnRow(
            columnIndex: amountColumnIndex,
            rowIndex: startRow,
          ),
          CellIndex.indexByColumnRow(
            columnIndex: amountColumnIndex,
            rowIndex: endRow,
          ),
        );
      }

      i = endRow + 1;
    }
  }

  static Future<void> _showInfoDialog(String title, String message) {
    return showDialog(
      context: Get.context!,
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

  static Future<void> _showErrorDialog(String title, String message) {
    return showDialog(
      context: Get.context!,
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
