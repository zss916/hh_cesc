import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/router/index.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/bean/strategy_protected_entity.dart';
import 'package:cescpro/page/station/detail/strategy/logic.dart';
import 'package:cescpro/page/station/detail/strategy/widget/strategy_power_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class StrategyPage extends StatelessWidget {
  const StrategyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.strategy.tr),
      backgroundColor: Color(0xFF23282E),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: GetBuilder<StrategyPageLogic>(
          init: StrategyPageLogic(),
          builder: (logic) {
            return Column(
              children: [
                _buildSiteInfo(logic: logic),
                _buildStrategyStatus(protected: logic.protected),
                _buildPowerCurve(logic: logic),
                _buildActions(logic: logic),
              ],
            );
          },
        ),
      ),
    );
  }

  ///站点信息
  Widget _buildSiteInfo({required StrategyPageLogic logic}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Image.asset(Assets.imgStrategyLocation, width: 36, height: 36),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  logic.siteName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Divider(height: 2, color: Colors.transparent),
                Wrap(
                  spacing: 8,
                  children: [
                    Text(
                      logic.activeType,
                      style: TextStyle(fontSize: 10, color: Color(0xFF72D3FF)),
                    ),
                    if (logic.running)
                      Text(
                        TKey.running.tr,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF22EEBD),
                        ),
                      ),
                  ],
                ),
                Divider(height: 2, color: Colors.transparent),
                Text(
                  logic.siteInfo,
                  style: TextStyle(fontSize: 10, color: Color(0xff888888)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrategyStatus({StrategyProtectedEntity? protected}) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 14),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            width: double.maxFinite,
            child: Text(
              TKey.safeStrategy.tr,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 12, bottom: 8),
            width: double.maxFinite,
            child: Wrap(
              spacing: 10,
              runSpacing: 8,
              children: [
                _buildProtection(
                  title: TKey.volProtection.tr,
                  isOpen: (protected?.volEnabled ?? false),
                ),
                _buildProtection(
                  title: TKey.socProtection.tr,
                  isOpen: (protected?.socEnabled ?? false),
                ),
                _buildProtection(
                  title: TKey.tempProtection.tr,
                  isOpen: (protected?.temEnabled ?? false),
                ),
                _buildProtection(
                  title: TKey.antiProtection.tr,
                  isOpen: (protected?.backEnabled ?? false),
                ),
                _buildProtection(
                  title: TKey.needProtection.tr,
                  isOpen: (protected?.needEnabled ?? false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///保护
  Widget _buildProtection({required String title, required bool isOpen}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isOpen
            ? Colors.blueAccent.withValues(alpha: 0.2)
            : Colors.grey.withValues(alpha: 0.2),
        border: Border.all(
          color: isOpen
              ? Colors.blueAccent
              : Colors.grey.withValues(alpha: 0.5),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: isOpen ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPowerCurve({required StrategyPageLogic logic}) {
    return RepaintBoundary(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 14),
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              width: double.maxFinite,
              child: Text(
                TKey.powerCurve.tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Divider(height: 12, color: Colors.transparent),
            _buildChart(logic: logic),
          ],
        ),
      ),
    );
  }

  Widget _buildParam(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        /*decoration: BoxDecoration(
          color: const Color.fromARGB(20, 74, 158, 255),
          border: Border.all(color: const Color.fromARGB(38, 74, 158, 255)),
          borderRadius: BorderRadius.circular(8),
        ),*/
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Divider(height: 2, color: Colors.transparent),
            Text(
              label,
              style: TextStyle(fontSize: 12.sp, color: const Color(0xff888888)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart({required StrategyPageLogic logic}) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: double.maxFinite,
          height: 360,
          padding: EdgeInsetsDirectional.only(
            start: 6,
            end: 15,
            top: 15,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 0),
                  child: Text(
                    "(kW)",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                  ),
                ),
              ),
              Expanded(
                child: StrategyPowerLineChart(
                  data: logic.series,
                  minT: logic.minT,
                  maxT: logic.maxT,
                  axis: logic.axis,
                  colors: [Color(0xff4a9eff), Color(0xff2dd4bf)],
                ),
              ),
            ],
          ),
        ),
        if (logic.series.isNotEmpty)
          PositionedDirectional(
            top: 8,
            end: 8,
            child: InkWell(
              onTap: () {
                Get.toNamed(APages.hStrategyChart);
              },
              child: Icon(
                Icons.zoom_out_map_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildActions({required StrategyPageLogic logic}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              Assets.imgStrategyHistory,
              TKey.strategyHistory.tr,
              false,
              () => PageTools.toStrategyHistory(siteId: logic.id),
            ),
          ),
          if (logic.site?.enableStrategy == true)
            const SizedBox(width: 10)
          else
            SizedBox.shrink(),
          if (logic.site?.enableStrategy == true)
            Expanded(
              child: _buildActionGradientButton(
                Assets.imgAiPreview,
                TKey.aiStrategyPreview.tr,
                true,
                () => PageTools.toAiPreview(
                  siteId: logic.id,
                  isDaysEnough: logic.isFullDay,
                  runningDays: logic.runningDays,
                  modeType: logic.modelCtrl?.activeType,
                ),
              ),
            )
          else
            SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String icon,
    String text,
    bool primary,
    VoidCallback onPressed,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
        decoration: BoxDecoration(
          color: Color(0xFF313540),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 24, height: 24),
            VerticalDivider(width: 5, color: Colors.transparent),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionGradientButton(
    String icon,
    String text,
    bool primary,
    VoidCallback onPressed,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
        decoration: BoxDecoration(
          color: Color(0xFF313540),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 24, height: 24),
            VerticalDivider(width: 5, color: Colors.transparent),
            GradientText(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              colors: [Color(0xFF6AF0FD), Color(0xFF168FED)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStrategyCard() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 14),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            width: double.maxFinite,
            child: Text(
              TKey.protectionParams.tr,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Divider(height: 12, color: Colors.transparent),
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFF313540),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  _buildParam('80%', TKey.socUpperLimit.tr),
                  VerticalDivider(width: 8, color: Colors.transparent),
                  _buildParam('20%', TKey.socLowerLimit.tr),
                  VerticalDivider(width: 8, color: Colors.transparent),
                  _buildParam('500kW', TKey.maxPower.tr),
                ],
              ),
            ),
          ),
          Divider(height: 8, color: Colors.transparent),
        ],
      ),
    );
  }
}
