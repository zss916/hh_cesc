import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/page/station/detail/strategy/ai/widget/dialog_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart'
    show GradientText, GradientDirection;

class AIStrategyPreviewPage extends StatelessWidget {
  AIStrategyPreviewPage({super.key});

  String bannerContent = '基于光伏预测、负载预测、天气预报与电价动态生成次日最优策略';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.aiStrategyPreviewTitle.tr),
      backgroundColor: Color(0xFF23282E),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            _buildAIBanner(),
            _buildRevenueForecast(),
            _buildPowerChart(),
            _buildPriceForecast(),
            _buildApplySection(),
          ],
        ),
      ),
    );
  }

  /// AI banner
  Widget _buildAIBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Image.asset(Assets.imgAiPreviewTitleIcon, width: 36, height: 36),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TKey.aiSmartOptimization.tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  bannerContent,
                  style: TextStyle(fontSize: 11, color: Color(0xffaaaaaa)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueForecast() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          alignment: AlignmentDirectional.centerStart,
          width: double.maxFinite,
          child: Text(
            TKey.profitEstimation.tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(14),
          ),
          width: double.maxFinite,
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    _buildProfitCell('¥1,284', TKey.aiStrategyProfit.tr, false),
                    VerticalDivider(width: 5, color: Colors.transparent),
                    _buildProfitCell(
                      '¥962',
                      TKey.currentStrategyProfit.tr,
                      false,
                    ),
                    VerticalDivider(width: 5, color: Colors.transparent),
                    _buildProfitCell('+33.5%', TKey.improvementRate.tr, true),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Divider(
                height: 1,
                color: Color(0x1AFFFFFF),
                indent: 18,
                endIndent: 18,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        TKey.dailyExtraEarning.tr,
                        textAlign: .left,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),

                    Container(
                      margin: .only(left: 5),
                      child: Text(
                        '+ ¥322',
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff159FFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 22, color: Colors.transparent),
      ],
    );
  }

  Widget _buildPowerChart() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  TKey.powerForecastChart.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                margin: EdgeInsetsDirectional.only(start: 15),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Color(0x3328CCFF),
                  border: Border.all(color: Color(0xFF28CCFF)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GradientText(
                  gradientDirection: GradientDirection.btt,
                  TKey.recommended.tr,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  colors: [Color(0xFF40F7FE), Color(0xFF1088EB)],
                ),

                /*Text(
                      TKey.recommended.tr,
                      style: TextStyle(fontSize: 10, color: Color(0xFF40F7FE)),
                    ),*/
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(14),
          ),
          width: double.maxFinite,
          height: 270,
          child: Column(children: [Spacer(), _buildPowerLegend()]),
        ),
      ],
    );
  }

  Widget _buildPowerLegend() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 8, bottom: 15),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        children: [
          _buildLegendItem(
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: const Color(0xFF3874F2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            TKey.aiStrategyPlanning.tr,
          ),
          _buildLegendItem(
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: const Color(0xfffbbf24),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            TKey.pvForecast.tr,
          ),
          _buildLegendItem(
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: const Color(0xffff9933),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            TKey.loadForecast.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Widget icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 12.sp, color: const Color(0xD9FFFFFF)),
        ),
      ],
    );
  }

  Widget _buildPriceForecast() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          alignment: AlignmentDirectional.centerStart,
          width: double.maxFinite,
          child: Text(
            TKey.priceForecast.tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(14),
          ),
          width: double.maxFinite,
          height: 270,
          child: Column(children: [Spacer(), _buildPriceLegend()]),
        ),
      ],
    );
  }

  Widget _buildPriceLegend() {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: const Color(0xff2dd4bf),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '${TKey.electricityPrice.tr} 元/kWh',
            style: TextStyle(fontSize: 12.sp, color: const Color(0xD9FFFFFF)),
          ),
        ],
      ),
    );
  }

  Widget _buildApplySection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showStrategyDialog();
            },
            child: Container(
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff43FFFF), Color(0xff0978E9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(color: Color(0x3343ffff), blurRadius: 20),
                ],
              ),
              child: Text(
                TKey.applyAiStrategy.tr,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            TKey.applyTip.tr,
            style: TextStyle(fontSize: 10.sp, color: Color(0xd9ffffff)),
          ),
        ],
      ),
    );
  }

  Widget _buildProfitCell(String value, String label, bool isUp) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        /*decoration: BoxDecoration(
          color: const Color.fromARGB(15, 74, 158, 255),
          border: Border.all(color: const Color.fromARGB(31, 74, 158, 255)),
          borderRadius: BorderRadius.circular(10),
        ),*/
        child: Column(
          children: [
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w700,
                color: isUp ? const Color(0xff159FFF) : Colors.white,
              ),
            ),
            Divider(height: 2, color: Colors.transparent),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, color: const Color(0xff888888)),
            ),
          ],
        ),
      ),
    );
  }
}

/*class AIStrategyPreviewPage2 extends StatefulWidget {
  const AIStrategyPreviewPage2({super.key});

  @override
  State<AIStrategyPreviewPage2> createState() => _AIStrategyPreviewPageState2();
}

class _AIStrategyPreviewPageState2 extends State<AIStrategyPreviewPage2> {
  static const int tick = 5;
  static const int n = (24 * 60) ~/ tick + 1;
  late List<String> labels;
  late List<double> aiData;
  late List<double> pvData;
  late List<double> loadData;
  late List<double> priceData;
  bool _showModal = false;

  @override
  void initState() {
    super.initState();
    labels = _buildLabels();
    aiData = _buildAIData();
    pvData = _buildPVData();
    loadData = _buildLoadData();
    priceData = _buildPriceData();
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

  List<double> _buildAIData() {
    final list = <double>[];
    for (var i = 0; i < n; i++) {
      final t = i / (n - 1);
      final h = t * 24;
      final v =
          420 * exp(-pow((h - 19) / 1.4, 2)) +
          260 * exp(-pow((h - 12) / 1.2, 2)) -
          360 * exp(-pow((h - 2.5) / 1.6, 2));
      list.add(v.roundToDouble());
    }
    return list;
  }

  List<double> _buildPVData() {
    final list = <double>[];
    for (var i = 0; i < n; i++) {
      final t = i / (n - 1);
      final h = t * 24;
      final bell = exp(-pow((h - 12.5) / 3.2, 2));
      list.add((820 * bell).roundToDouble());
    }
    return list;
  }

  List<double> _buildLoadData() {
    final list = <double>[];
    for (var i = 0; i < n; i++) {
      final t = i / (n - 1);
      final h = t * 24;
      var lv = 320.0;
      lv += 280 * exp(-pow((h - 19) / 1.5, 2));
      lv += 150 * exp(-pow((h - 10) / 2.0, 2));
      lv += 90 * exp(-pow((h - 14) / 1.2, 2));
      lv -= 120 * exp(-pow((h - 3) / 1.4, 2));
      list.add(max(180, lv.roundToDouble()));
    }
    return list;
  }

  List<double> _buildPriceData() {
    final list = <double>[];
    for (var i = 0; i < n; i++) {
      final h = (i / (n - 1)) * 24;
      var v = 0.62;
      v += 0.78 * exp(-pow((h - 19) / 1.5, 2));
      v += 0.45 * exp(-pow((h - 11) / 1.8, 2));
      v -= 0.30 * exp(-pow((h - 3) / 2.0, 2));
      list.add(double.parse(v.toStringAsFixed(2)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1428),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildTopNav(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: [
                        _buildAIBanner(),
                        _buildProfitCard(),
                        _buildPowerChartCard(),
                        _buildPriceChartCard(),
                        _buildApplySection(),
                      ],
                    ),
                  ),
                ),
                //_buildTabBar(),
              ],
            ),
            if (_showModal) _buildModal(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '16:40 📍',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              const Text('📶', style: TextStyle(fontSize: 13)),
              const SizedBox(width: 6),
              const Text(
                '5G',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '69',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
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
                Navigator.pop(context);
              },
            ),
          ),
          Text(
            TKey.aiStrategyPreviewTitle.tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Positioned(right: 14, child: buildRightBar()),
        ],
      ),
    );
  }

  ///top bar 右边 icon
  Widget buildRightBar() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xffa855f7), Color(0xff6366f1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(Icons.star, color: Colors.white, size: 12),
        const SizedBox(width: 4),
        const Text(
          'AI',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );

  String bannerContent = '基于光伏预测、负载预测、天气预报与电价动态生成次日最优策略';

  /// AI banner
  Widget _buildAIBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(46, 168, 85, 247),
            Color.fromARGB(46, 99, 102, 241),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color.fromARGB(89, 168, 85, 247)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xffa855f7), Color(0xff6366f1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.smart_toy, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TKey.aiSmartOptimization.tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  bannerContent,
                  style: TextStyle(fontSize: 11, color: Color(0xffaaaaaa)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///收益预估
  Widget _buildProfitCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
          Row(
            children: [
              const Icon(Icons.trending_up, color: Color(0xff2dd4bf), size: 18),
              const SizedBox(width: 6),
              Text(
                TKey.profitEstimation.tr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(
              children: [
                _buildProfitCell('¥1,284', TKey.aiStrategyProfit.tr, true),
                VerticalDivider(width: 10, color: Colors.transparent),
                _buildProfitCell('¥962', TKey.currentStrategyProfit.tr, false),
                VerticalDivider(width: 10, color: Colors.transparent),
                _buildProfitCell('+33.5%', TKey.improvementRate.tr, true),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(31, 45, 212, 191),
                  Color.fromARGB(20, 74, 158, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: const Color.fromARGB(63, 45, 212, 191)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TKey.dailyExtraEarning.tr,
                  style: TextStyle(fontSize: 12, color: Color(0xffcccccc)),
                ),
                const Text(
                  '+ ¥322',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2dd4bf),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfitCell(String value, String label, bool isUp) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(15, 74, 158, 255),
          border: Border.all(color: const Color.fromARGB(31, 74, 158, 255)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: isUp ? const Color(0xff2dd4bf) : const Color(0xffaaaaaa),
              ),
            ),
            Divider(height: 2, color: Colors.transparent),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: const Color(0xff888888)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPowerChartCard() {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.show_chart,
                      color: Color(0xff4a9eff),
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        TKey.powerForecastChart.tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildRecommend(),
            ],
          ),
          const SizedBox(height: 8),
          Container(height: 240, child: _buildPowerChart()),
          _buildPowerLegend(),
        ],
      ),
    );
  }

  ///推荐
  Widget buildRecommend() => Container(
    margin: EdgeInsetsDirectional.only(start: 15),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: const Color.fromARGB(23, 168, 85, 247),
      border: Border.all(color: const Color.fromARGB(77, 168, 85, 247)),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      TKey.recommended.tr,
      style: TextStyle(fontSize: 10, color: Color(0xffc084fc)),
    ),
  );

  Widget _buildPowerChart() {
    return LineChart(
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
              interval: n / 10,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < labels.length) {
                  return Text(
                    labels[index],
                    style: const TextStyle(
                      fontSize: 9,
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
                  style: const TextStyle(fontSize: 9, color: Color(0xff888888)),
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
            spots: aiData
                .asMap()
                .entries
                .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                .toList(),
            isCurved: true,
            color: const Color(0xffa855f7),
            barWidth: 2.2,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: const Color.fromARGB(46, 168, 85, 247),
            ),
          ),
          LineChartBarData(
            spots: pvData
                .asMap()
                .entries
                .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                .toList(),
            isCurved: true,
            color: const Color(0xfffbbf24),
            barWidth: 1.6,
            dotData: const FlDotData(show: false),
            dashArray: [6, 6],
          ),
          LineChartBarData(
            spots: loadData
                .asMap()
                .entries
                .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                .toList(),
            isCurved: true,
            color: const Color(0xffff9933),
            barWidth: 1.6,
            dotData: const FlDotData(show: false),
            dashArray: [6, 6],
          ),
        ],
        minX: 0,
        maxX: (n - 1).toDouble(),
        minY: -500,
        maxY: 1000,
      ),
    );
  }

  Widget _buildPowerLegend() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLegendItem(
            CustomPaint(size: const Size(14, 8), painter: AiLinePainter()),
            TKey.aiStrategyPlanning.tr,
          ),
          const SizedBox(width: 14),
          _buildLegendItem(
            Container(
              width: 14,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xfffbbf24),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            TKey.pvForecast.tr,
          ),
          const SizedBox(width: 14),
          _buildLegendItem(
            Container(
              width: 14,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xffff9933),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            TKey.loadForecast.tr,
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Widget icon, String text) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: 11, color: const Color(0xffcccccc)),
        ),
      ],
    );
  }

  Widget _buildPriceChartCard() {
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
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.energy_savings_leaf_outlined,
                color: Color(0xff2dd4bf),
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                TKey.priceForecast.tr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(height: 240, child: _buildPriceChart()),
          _buildPriceLegend(),
        ],
      ),
    );
  }

  Widget _buildPriceChart() {
    return LineChart(
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
              interval: n / 10,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < labels.length) {
                  return Text(
                    labels[index],
                    style: const TextStyle(
                      fontSize: 9,
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
              reservedSize: 45,
              getTitlesWidget: (value, meta) {
                return Text(
                  '¥${value.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 9, color: Color(0xff888888)),
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
            spots: priceData
                .asMap()
                .entries
                .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                .toList(),
            isCurved: true,
            color: const Color(0xff2dd4bf),
            barWidth: 2,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(89, 45, 212, 191),
                  Color.fromARGB(5, 45, 212, 191),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        minX: 0,
        maxX: (n - 1).toDouble(),
        minY: 0,
        maxY: 1.5,
      ),
    );
  }

  Widget _buildPriceLegend() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 14,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xff2dd4bf),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '${TKey.electricityPrice.tr} 元/kWh',
            style: TextStyle(fontSize: 11, color: const Color(0xffcccccc)),
          ),
        ],
      ),
    );
  }

  Widget _buildApplySection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showModal = true;
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffa855f7), Color(0xff6366f1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(89, 168, 85, 247),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.smart_toy, color: Colors.white, size: 18),
                  VerticalDivider(width: 6, color: Colors.transparent),
                  Text(
                    TKey.applyAiStrategy.tr,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            TKey.applyTip.tr,
            style: TextStyle(fontSize: 11, color: Color(0xff888888)),
          ),
        ],
      ),
    );
  }

  Widget _buildModal() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(191, 5, 10, 20),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 320),
          margin: const EdgeInsets.symmetric(horizontal: 28),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff1a2842), Color(0xff16213a)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: const Color.fromARGB(89, 168, 85, 247)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xffa855f7), Color(0xff6366f1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(102, 168, 85, 247),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 28),
              ),
              const Text(
                '申请已提交',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '您的 AI 策略申请已成功提交，我们的运维团队 / 售前团队将尽快与您联系，确认接入细节与现场调试时间。',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xffaaaaaa),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(15, 74, 158, 255),
                  border: Border.all(
                    color: const Color.fromARGB(46, 74, 158, 255),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Color(0xff4a9eff),
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '售后热线',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff888888),
                              ),
                            ),
                            const Text(
                              '400-888-1688',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff4a9eff),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.chat,
                          color: Color(0xff4a9eff),
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '专属客户经理',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff888888),
                              ),
                            ),
                            const Text(
                              '王经理 · 138****5621',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff4a9eff),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showModal = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        backgroundColor: const Color.fromARGB(
                          15,
                          255,
                          255,
                          255,
                        ),
                        foregroundColor: const Color(0xffaaaaaa),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color.fromARGB(31, 255, 255, 255),
                          ),
                        ),
                      ),
                      child: const Text(
                        '稍后联系',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showModal = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('正在为您呼叫：400-888-1688')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        backgroundColor: const Color(0xff4a9eff),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        '立即拨打',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
        onPressed: () {},
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

class AiLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xffa855f7);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height - 6, size.width, 6),
      Paint()..color = const Color.fromARGB(64, 168, 85, 247),
    );
    canvas.drawLine(
      Offset(0, size.height - 6),
      Offset(size.width, size.height - 6),
      paint..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}*/
