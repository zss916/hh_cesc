import 'dart:math';

import 'package:cescpro/page/station/detail/strategy/ai/ai_strategy_preview_page.dart';
import 'package:cescpro/page/station/detail/strategy/history/strategy_history_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StrategyPage extends StatefulWidget {
  const StrategyPage({super.key});

  @override
  State<StrategyPage> createState() => _StrategyPageState();
}

class _StrategyPageState extends State<StrategyPage> {
  static const int tick = 5;
  static const int n = (24 * 60) ~/ tick + 1;
  late List<String> labels;
  late List<double> strategyData;
  late List<double> actualData;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    labels = _buildLabels();
    strategyData = _buildStrategy();
    actualData = _buildActual();
  }

  List<String> _buildLabels() {
    final list = <String>[];
    for (var i = 0; i < n; i++) {
      final h = ((i * tick) / 60).floor();
      final m = (i * tick) % 60;
      list.add(
        '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}',
      );
    }
    return list;
  }

  List<double> _buildStrategy() {
    final list = <double>[];
    for (var i = 0; i < n; i++) {
      final t = i / (n - 1);
      final h = t * 24;
      final v =
          380 * exp(-pow((h - 18) / 1.6, 2)) +
          220 * exp(-pow((h - 11) / 1.4, 2)) -
          300 * exp(-pow((h - 3) / 1.8, 2));
      list.add(v.roundToDouble());
    }
    return list;
  }

  List<double> _buildActual() {
    return strategyData.asMap().entries.map((entry) {
      final i = entry.key;
      final v = entry.value;
      return (v +
              sin(i * 0.7) * 25 +
              cos(i * 0.31) * 25 +
              (_random.nextDouble() - 0.5) * 30)
          .roundToDouble();
    }).toList();
  }

  void showHint(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: const Color(0xff0f192d),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xff4a9eff), width: 1),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1428),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopNav(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    _buildSiteInfo(),
                    _buildStrategyCard(),
                    _buildActions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNav() {
    return Container(
      width: double.maxFinite,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 14,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          const Text(
            '策略',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  ///站点信息
  Widget _buildSiteInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff1a2842), Color(0xff16213a)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color.fromARGB(31, 74, 158, 255)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff4a9eff), Color(0xff2c6fd1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.location_on, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '上海浦东储能示范站 #01 ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Divider(height: 2, color: Colors.transparent),
                const Text(
                  '装机 1MW / 2MWh · 削峰填谷策略中',
                  style: TextStyle(fontSize: 11, color: Color(0xff888888)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrategyCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff1a2842), Color(0xff16213a)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color.fromARGB(31, 74, 158, 255)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          _buildStrategyHeader(),
          Divider(height: 10, color: Colors.transparent),
          _buildModeRow(),
          Divider(height: 14, color: Colors.transparent),
          _buildSectionLabel('策略保护参数'),
          _buildParams(),
          Divider(height: 14, color: Colors.transparent),
          _buildSectionLabel('功率曲线'),
          _buildChart(),
          _buildLegend(),
        ],
      ),
    );
  }

  ///策略 icon
  Widget _buildStrategyHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: CustomPaint(painter: StrategyIconPainter()),
            ),
            const SizedBox(width: 8),
            const Text(
              '策略',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xff2dd4bf),
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(color: Color(0xff2dd4bf), blurRadius: 8),
                ],
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              '运行中',
              style: TextStyle(fontSize: 12, color: Color(0xffcccccc)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildModeRow() {
    return SizedBox(
      width: double.maxFinite,
      child: Wrap(
        //spacing: 10,
        //runSpacing: 10,
        children: [
          buildCurrentMode(),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
            child: const Text(
              '|',
              style: TextStyle(fontSize: 13, color: Color(0xff444444)),
            ),
          ),
          buildOperatingStatus(),
        ],
      ),
    );
  }

  ///当前模式
  Widget buildCurrentMode() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '当前模式：',
          style: TextStyle(fontSize: 13, color: Color(0xffcccccc)),
        ),
        const Text(
          '削峰填谷',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xff4a9eff),
          ),
        ),
      ],
    );
  }

  ///运行状态
  Widget buildOperatingStatus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '运行状态：',
          style: TextStyle(fontSize: 13, color: Color(0xffcccccc)),
        ),
        const Text(
          '执行中',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xff2dd4bf),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionLabel(String text) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 12,
          decoration: BoxDecoration(
            color: const Color(0xff4a9eff),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: const Color(0xff888888)),
        ),
      ],
    );
  }

  Widget _buildParams() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildParam('80%', 'SOC 上限'),
          const SizedBox(width: 8),
          _buildParam('20%', 'SOC 下限'),
          const SizedBox(width: 8),
          _buildParam('500kW', '最大功率'),
        ],
      ),
    );
  }

  Widget _buildParam(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          color: const Color.fromARGB(20, 74, 158, 255),
          border: Border.all(color: const Color.fromARGB(38, 74, 158, 255)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: const Color(0xff888888)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 220,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: const Color(0xff1a1a1a), strokeWidth: 0.5),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: n / 12,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < labels.length) {
                    return Text(
                      labels[index],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xff888888),
                      ),
                    );
                  }
                  return const Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xff888888),
                    ),
                  );
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: Color(0xff2a2a2a)),
              bottom: BorderSide(color: Color(0xff2a2a2a)),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: strategyData
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                  .toList(),
              isCurved: true,
              color: const Color(0xff4a9eff),
              barWidth: 2,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: const Color.fromARGB(46, 74, 158, 255),
              ),
            ),
            LineChartBarData(
              spots: actualData
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                  .toList(),
              isCurved: true,
              color: const Color(0xff2dd4bf),
              barWidth: 1.6,
              dotData: const FlDotData(show: false),
            ),
          ],
          minX: 0,
          maxX: (n - 1).toDouble(),
          minY: -400,
          maxY: 500,
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLegendItem(const Color(0xff4a9eff), '策略曲线'),
          const SizedBox(width: 18),
          _buildLegendItem(const Color(0xff2dd4bf), '实际运行'),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: const Color(0xffcccccc)),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              Icons.history,
              '策略历史',
              false,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StrategyHistoryPage(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildActionButton(
              Icons.smart_toy,
              'AI 策略预览',
              true,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AIStrategyPreviewPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String text,
    bool primary,
    VoidCallback onPressed,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        gradient: primary
            ? const LinearGradient(
                colors: [Color(0xff4a9eff), Color(0xff2c6fd1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : const LinearGradient(
                colors: [Color(0xff1a2842), Color(0xff16213a)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        border: Border.all(
          color: primary
              ? const Color.fromARGB(127, 74, 158, 255)
              : const Color.fromARGB(63, 74, 158, 255),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(235, 15, 25, 45),
        border: const Border(
          top: BorderSide(color: Color.fromARGB(38, 74, 158, 255)),
        ),
      ),
      child: Row(
        children: [
          _buildTab('概览', Icons.home, false),
          _buildTab('监控', Icons.monitor, false),
          _buildTab('策略', Icons.show_chart, true),
          _buildTab('告警', Icons.notifications, false),
        ],
      ),
    );
  }

  Widget _buildTab(String label, IconData icon, bool active) {
    return Expanded(
      child: TextButton(
        onPressed: () => showHint('进入 $label 模块'),
        child: Column(
          children: [
            Icon(
              icon,
              color: active ? const Color(0xff4a9eff) : const Color(0xff666666),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: active
                    ? const Color(0xff4a9eff)
                    : const Color(0xff888888),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StrategyIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff4a9eff)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.15, size.height * 0.5);
    path.lineTo(size.width * 0.35, size.height * 0.2);
    path.lineTo(size.width * 0.55, size.height * 0.5);
    path.lineTo(size.width * 0.7, size.height * 0.15);
    path.lineTo(size.width * 0.9, size.height * 0.55);

    final path2 = Path();
    path2.moveTo(size.width * 0.15, size.height * 0.85);
    path2.lineTo(size.width * 0.9, size.height * 0.85);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
