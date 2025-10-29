import 'dart:math';

import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DeviceType { pv, battery, evCharger, powerGrid, batterySoc }

enum BoxType { pv, battery, inverter, evCharger, powerGrid }

enum SceneType {
  solarStorageCharging, // 光储充
  carport, // 车棚
  balconyPv, // 阳台光伏（可扩展）
  microgrid, // 微电网
}

class LineFlowConfig {
  final bool visible;
  final bool reversed;

  const LineFlowConfig({this.visible = false, this.reversed = false});
}

class LinePath {
  final BoxType from;
  final BoxType to;

  const LinePath(this.from, this.to);

  @override
  bool operator ==(Object other) =>
      other is LinePath && from == other.from && to == other.to;

  @override
  int get hashCode => Object.hash(from, to);
}

class ConnectedBoxes extends StatefulWidget {
  // final Map<DeviceType, double> deviceValues;
  // final Map<LinePath, LineFlowConfig> lineConfigs;
  // final SceneType sceneType;
  const ConnectedBoxes({
    super.key,
    //required this.deviceValues,
    //required this.lineConfigs,
    //required this.sceneType,
  });

  @override
  State<ConnectedBoxes> createState() => _ConnectedBoxesState();
}

class _ConnectedBoxesState extends State<ConnectedBoxes>
    with SingleTickerProviderStateMixin {
  final List<GlobalKey> _boxKeys = List.generate(5, (i) => GlobalKey());
  late final AnimationController _controller; // 动画控制器

  @override
  void initState() {
    super.initState();
    // 确保布局完成后触发重绘
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(); // 无限循环
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildNumberedLayout(),
          Positioned.fill(
            child: CustomPaint(painter: SmoothLinePainter(_boxKeys)),
          ),
          // Stack 上再覆盖一个AnimatedBuilder
          /// 在 ConnectedBoxes build 方法中，恢复动画层
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    ///1->3
                    CustomPaint(
                      painter: MovingLinePainter13(
                        _boxKeys,
                        progress: _controller.value,
                        visible: true,
                      ),
                    ),

                    ///2->3
                    CustomPaint(
                      painter: MovingLinePainter23(
                        _boxKeys,
                        progress: _controller.value,
                        reversed: false,
                        visible: true,
                      ),
                    ),

                    ///3->4
                    CustomPaint(
                      painter: MovingLinePainter34(
                        _boxKeys,
                        progress: _controller.value,
                        visible: true,
                      ),
                    ),

                    ///3->5
                    CustomPaint(
                      painter: MovingLinePainter35(
                        _boxKeys,
                        progress: _controller.value,
                        reversed: false,
                        visible: true,
                      ),
                    ),

                    ///5->4
                    CustomPaint(
                      painter: MovingLinePainter54(
                        _boxKeys,
                        progress: _controller.value,
                        visible: false,
                      ),
                    ),
                    // ← 新增
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedLayout() {
    var title = "EV charger";
    var imgPath = Assets.gplotBattery;
    /*if (widget.sceneType == SceneType.solarStorageCharging) {
      title = "Load";
      imgPath = Assets.gplotBattery;
    }*/

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 第一行：方块1和2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNumberedBox0(0, 20),
            // SizedBox(width: 20.w),
            _buildNumberedBox1(1, 10, 10),
          ],
        ),
        SizedBox(height: 70.w),
        _buildNumberedBox2(2),
        SizedBox(height: 70.w),
        // 第三行：方块4和5
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNumberedBox3(3, 20, title, imgPath),
            // SizedBox(width: 20.w),
            _buildNumberedBox4(4, 20),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberedBox0(int index, double value) {
    return Container(
      key: _boxKeys[index],
      width: 165.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Color(0xFF1D1B1F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PV",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0x80FFFFFF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "$value W",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0x80FFFFFF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Positioned(
              right: -10,
              child: Image.asset(
                Assets.gplotBattery, // 替换成你的图片路径
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedBox1(int index, double value, double soc) {
    return Container(
      key: _boxKeys[index],
      width: 165.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Color(0xFF1D1B1F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Stack(
          children: [
            SizedBox(width: 20.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Battery",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "$value W",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "$soc%",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(
                      Assets.gplotBattery, // 替换成你的图片路径
                      height: 16.h,
                      width: 16.w,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: -10,
              child: Image.asset(
                Assets.gplotBattery, // 替换成你的图片路径
                height: 100.h,
                width: 90.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedBox2(int index) {
    return Container(
      key: _boxKeys[index],
      width: 160.w,
      height: 88.h,
      decoration: BoxDecoration(
        color: Color(0xFF1D1B1F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.gplotBattery, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.3), // 可选：背景遮罩更清晰
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Text(
                "Inverter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedBox3(
    int index,
    double value,
    String title,
    String imgPath,
  ) {
    return Container(
      key: _boxKeys[index],
      width: 165.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Color(0xFF1D1B1F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "$value W",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 0,
              child: Image.asset(
                imgPath, // 替换成你的图片路径
                height: 80.h,
                width: 78.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedBox4(int index, double value) {
    return Container(
      key: _boxKeys[index],
      width: 165.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Color(0xFF1D1B1F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Power grid",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "$value W",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 0,
              child: Image.asset(
                Assets.gplotBattery, // 替换成你的图片路径
                height: 80.h,
                width: 78.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmoothLinePainter extends CustomPainter {
  final List<GlobalKey> boxKeys;

  SmoothLinePainter(this.boxKeys);

  @override
  void paint(Canvas canvas, Size size) {
    if (boxKeys.length < 5) return;

    final paint = Paint()
      ..color = Color(0x4D747272)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const radius = 10.0; // 拐角弧度

    // 提取所有box的context和renderbox
    final box1Context = boxKeys[0].currentContext;
    final box2Context = boxKeys[1].currentContext;
    final box3Context = boxKeys[2].currentContext;
    final box4Context = boxKeys[3].currentContext;
    final box5Context = boxKeys[4].currentContext;

    final stackBox = boxKeys[0].currentContext
        ?.findAncestorRenderObjectOfType<RenderBox>();
    if (box1Context == null ||
        box2Context == null ||
        box3Context == null ||
        box4Context == null ||
        box5Context == null ||
        stackBox == null) {
      return;
    }

    final stackPos = stackBox.localToGlobal(Offset.zero);

    final box1Render = box1Context.findRenderObject() as RenderBox;
    final box2Render = box2Context.findRenderObject() as RenderBox;
    final box3Render = box3Context.findRenderObject() as RenderBox;
    final box4Render = box4Context.findRenderObject() as RenderBox;
    final box5Render = box5Context.findRenderObject() as RenderBox;

    final box1Pos = box1Render.localToGlobal(Offset.zero);
    final box2Pos = box2Render.localToGlobal(Offset.zero);
    final box3Pos = box3Render.localToGlobal(Offset.zero);
    final box4Pos = box4Render.localToGlobal(Offset.zero);
    final box5Pos = box5Render.localToGlobal(Offset.zero);

    // 计算中心点，相对stack的位置
    final box1CenterBottom = Offset(
      box1Pos.dx + box1Render.size.width / 2 - stackPos.dx,
      box1Pos.dy + box1Render.size.height - stackPos.dy,
    );

    final box2CenterBottom = Offset(
      box2Pos.dx + box2Render.size.width / 2 - stackPos.dx,
      box2Pos.dy + box2Render.size.height - stackPos.dy,
    );

    final box3CenterTop = Offset(
      box3Pos.dx + box3Render.size.width / 2 - stackPos.dx,
      box3Pos.dy - stackPos.dy,
    );

    final box3CenterBottom = Offset(
      box3Pos.dx + box3Render.size.width / 2 - stackPos.dx,
      box3Pos.dy + box3Render.size.height - stackPos.dy,
    );

    final box4CenterTop = Offset(
      box4Pos.dx + box4Render.size.width / 2 - stackPos.dx,
      box4Pos.dy - stackPos.dy,
    );

    final box5CenterTop = Offset(
      box5Pos.dx + box5Render.size.width / 2 - stackPos.dx,
      box5Pos.dy - stackPos.dy,
    );

    final path = Path();

    /// --- 1 ➔ 3 ---
    path.moveTo(box1CenterBottom.dx, box1CenterBottom.dy);
    path.lineTo(box1CenterBottom.dx, box1CenterBottom.dy + 40 - radius);
    path.quadraticBezierTo(
      box1CenterBottom.dx,
      box1CenterBottom.dy + 40,
      box1CenterBottom.dx + radius,
      box1CenterBottom.dy + 40,
    );
    path.lineTo(box3CenterTop.dx - radius - 20, box1CenterBottom.dy + 40);
    path.quadraticBezierTo(
      box3CenterTop.dx - 20,
      box1CenterBottom.dy + 40,
      box3CenterTop.dx - 20,
      box1CenterBottom.dy + 40 + radius,
    );
    path.lineTo(box3CenterTop.dx - 20, box3CenterTop.dy);

    /// --- 2 ➔ 3 ---
    path.moveTo(box2CenterBottom.dx, box2CenterBottom.dy);
    path.lineTo(box2CenterBottom.dx, box2CenterBottom.dy + 40 - radius);
    path.quadraticBezierTo(
      box2CenterBottom.dx,
      box2CenterBottom.dy + 40,
      box2CenterBottom.dx - radius,
      box2CenterBottom.dy + 40,
    );
    path.lineTo(box3CenterTop.dx + radius + 20, box2CenterBottom.dy + 40);
    path.quadraticBezierTo(
      box3CenterTop.dx + 20,
      box2CenterBottom.dy + 40,
      box3CenterTop.dx + 20,
      box2CenterBottom.dy + 40 + radius,
    );
    path.lineTo(box3CenterTop.dx + 20, box3CenterTop.dy);

    /// --- 3 ➔ 4 ---
    path.moveTo(box3CenterBottom.dx, box3CenterBottom.dy);
    path.lineTo(box3CenterBottom.dx, box3CenterBottom.dy + 40);
    // path.quadraticBezierTo(
    //   box3CenterBottom.dx,
    //   box3CenterBottom.dy + 40,
    //   box3CenterBottom.dx - radius,
    //   box3CenterBottom.dy + 40,
    // );
    path.lineTo(box4CenterTop.dx + radius, box3CenterBottom.dy + 40);
    path.quadraticBezierTo(
      box4CenterTop.dx,
      box3CenterBottom.dy + 40,
      box4CenterTop.dx,
      box3CenterBottom.dy + 40 + radius,
    );
    path.lineTo(box4CenterTop.dx, box4CenterTop.dy);

    /// --- 3 ➔ 5 ---
    path.moveTo(box3CenterBottom.dx, box3CenterBottom.dy);
    path.lineTo(box3CenterBottom.dx, box3CenterBottom.dy + 40);
    // path.quadraticBezierTo(
    //   box3CenterBottom.dx,
    //   box3CenterBottom.dy + 40,
    //   box3CenterBottom.dx + radius,
    //   box3CenterBottom.dy + 40,
    // );
    path.lineTo(box5CenterTop.dx - radius, box3CenterBottom.dy + 40);
    path.quadraticBezierTo(
      box5CenterTop.dx,
      box3CenterBottom.dy + 40,
      box5CenterTop.dx,
      box3CenterBottom.dy + 40 + radius,
    );
    path.lineTo(box5CenterTop.dx, box5CenterTop.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MovingLinePainter13 extends CustomPainter {
  final List<GlobalKey> boxKeys;
  final double progress;
  final bool visible; // ✅ 新增：控制是否显示

  MovingLinePainter13(
    this.boxKeys, {
    required this.progress,
    this.visible = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible || boxKeys.length < 3) return; // ✅ 不可见时不绘制

    final context1 = boxKeys[0].currentContext;
    final context3 = boxKeys[2].currentContext;
    final stackBox = boxKeys[0].currentContext
        ?.findAncestorRenderObjectOfType<RenderBox>();

    if (context1 == null || context3 == null || stackBox == null) return;

    final box1 = context1.findRenderObject() as RenderBox;
    final box3 = context3.findRenderObject() as RenderBox;

    final start = box1.localToGlobal(
      Offset(box1.size.width / 2, box1.size.height),
      ancestor: stackBox,
    );
    final end = box3.localToGlobal(
      Offset(box3.size.width / 2, 0),
      ancestor: stackBox,
    );

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(start.dx, start.dy + 30)
      ..quadraticBezierTo(start.dx, start.dy + 40, start.dx + 10, start.dy + 40)
      ..lineTo(end.dx - 30, start.dy + 40)
      ..quadraticBezierTo(
        end.dx - 20,
        start.dy + 40,
        end.dx - 20,
        start.dy + 50,
      )
      ..lineTo(end.dx - 20, end.dy);

    final metric = path.computeMetrics().first;
    final totalLength = metric.length;

    const bulletLength = 8.0;
    final currentOffset = progress * totalLength;

    final startOffset = (currentOffset - bulletLength / 2).clamp(
      0.0,
      totalLength,
    );
    final endOffset = (currentOffset + bulletLength / 2).clamp(
      0.0,
      totalLength,
    );

    final subPath = metric.extractPath(startOffset, endOffset);

    final paint = Paint()
      ..color = Color(0xFF24B6F3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(subPath, paint);
  }

  @override
  bool shouldRepaint(covariant MovingLinePainter13 oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.visible != visible;
  }
}

class MovingLinePainter23 extends CustomPainter {
  final List<GlobalKey> boxKeys;
  final double progress;
  final bool reversed;
  final bool visible; // ✅ 新增：是否显示

  MovingLinePainter23(
    this.boxKeys, {
    required this.progress,
    this.reversed = false,
    this.visible = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible || boxKeys.length < 3) return; // ✅ 不可见时直接跳过绘制

    final context2 = boxKeys[1].currentContext;
    final context3 = boxKeys[2].currentContext;
    final stackBox = boxKeys[0].currentContext
        ?.findAncestorRenderObjectOfType<RenderBox>();

    if (context2 == null || context3 == null || stackBox == null) return;

    final box2 = context2.findRenderObject() as RenderBox;
    final box3 = context3.findRenderObject() as RenderBox;

    final start = box2.localToGlobal(
      Offset(box2.size.width / 2, box2.size.height),
      ancestor: stackBox,
    );
    final end = box3.localToGlobal(
      Offset(box3.size.width / 2, 0),
      ancestor: stackBox,
    );

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(start.dx, start.dy + 30)
      ..quadraticBezierTo(start.dx, start.dy + 40, start.dx - 10, start.dy + 40)
      ..lineTo(end.dx + 30, start.dy + 40)
      ..quadraticBezierTo(
        end.dx + 20,
        start.dy + 40,
        end.dx + 20,
        start.dy + 50,
      )
      ..lineTo(end.dx + 20, end.dy);

    final metric = path.computeMetrics().first;
    final totalLength = metric.length;

    const bulletLength = 8.0;
    final effectiveProgress = reversed ? 1.0 - progress : progress;
    final currentOffset = effectiveProgress * totalLength;

    final startOffset = (currentOffset - bulletLength / 2).clamp(
      0.0,
      totalLength,
    );
    final endOffset = (currentOffset + bulletLength / 2).clamp(
      0.0,
      totalLength,
    );

    final subPath = metric.extractPath(startOffset, endOffset);

    final paint = Paint()
      ..color = Color(0xFF24B6F3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(subPath, paint);
  }

  @override
  bool shouldRepaint(covariant MovingLinePainter23 oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.reversed != reversed ||
        oldDelegate.visible != visible; // ✅ 判断 visible 变化
  }
}

class MovingLinePainter34 extends CustomPainter {
  final List<GlobalKey> boxKeys;
  final double progress;
  final bool visible; // ✅ 新增：是否显示该线条

  MovingLinePainter34(
    this.boxKeys, {
    required this.progress,
    this.visible = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible || boxKeys.length < 5) return; // ✅ 控制绘制开关

    final context3 = boxKeys[2].currentContext;
    final context4 = boxKeys[3].currentContext;
    final stackBox = boxKeys[0].currentContext
        ?.findAncestorRenderObjectOfType<RenderBox>();

    if (context3 == null || context4 == null || stackBox == null) return;

    final box3 = context3.findRenderObject() as RenderBox;
    final box4 = context4.findRenderObject() as RenderBox;

    final start = box3.localToGlobal(
      Offset(box3.size.width / 2, box3.size.height),
      ancestor: stackBox,
    );
    final end = box4.localToGlobal(
      Offset(box4.size.width / 2, 0),
      ancestor: stackBox,
    );

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(start.dx, start.dy + 40)
      ..lineTo(end.dx + 10, start.dy + 40)
      ..quadraticBezierTo(end.dx, start.dy + 40, end.dx, start.dy + 50)
      ..lineTo(end.dx, end.dy);

    final metric = path.computeMetrics().first;
    final totalLength = metric.length;

    const bulletLength = 8.0;
    final currentOffset = progress * totalLength;
    final startOffset = (currentOffset - bulletLength / 2).clamp(
      0.0,
      totalLength,
    );
    final endOffset = (currentOffset + bulletLength / 2).clamp(
      0.0,
      totalLength,
    );

    final subPath = metric.extractPath(startOffset, endOffset);

    final paint = Paint()
      ..color = Color(0xFF24B6F3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(subPath, paint);
  }

  @override
  bool shouldRepaint(covariant MovingLinePainter34 oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.visible != visible;
  }
}

class MovingLinePainter35 extends CustomPainter {
  final List<GlobalKey> boxKeys;
  final double progress;
  final bool reversed;
  final bool visible; // ✅ 新增

  MovingLinePainter35(
    this.boxKeys, {
    required this.progress,
    this.reversed = false,
    this.visible = true, // ✅ 默认可见
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible || boxKeys.length < 5) return; // ✅ 不可见时不绘制

    final context3 = boxKeys[2].currentContext;
    final context5 = boxKeys[4].currentContext;
    final stackBox = boxKeys[0].currentContext
        ?.findAncestorRenderObjectOfType<RenderBox>();

    if (context3 == null || context5 == null || stackBox == null) return;

    final box3 = context3.findRenderObject() as RenderBox;
    final box5 = context5.findRenderObject() as RenderBox;

    final start = box3.localToGlobal(
      Offset(box3.size.width / 2, box3.size.height),
      ancestor: stackBox,
    );
    final end = box5.localToGlobal(
      Offset(box5.size.width / 2, 0),
      ancestor: stackBox,
    );

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(start.dx, start.dy + 40)
      ..lineTo(end.dx - 10, start.dy + 40)
      ..quadraticBezierTo(end.dx, start.dy + 40, end.dx, start.dy + 50)
      ..lineTo(end.dx, end.dy);

    final metric = path.computeMetrics().first;
    final totalLength = metric.length;

    const bulletLength = 8.0;
    final effectiveProgress = reversed ? 1.0 - progress : progress;
    final currentOffset = effectiveProgress * totalLength;

    final startOffset = (currentOffset - bulletLength / 2).clamp(
      0.0,
      totalLength,
    );
    final endOffset = (currentOffset + bulletLength / 2).clamp(
      0.0,
      totalLength,
    );

    final subPath = metric.extractPath(startOffset, endOffset);

    final paint = Paint()
      ..color = Color(0xFF24B6F3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(subPath, paint);
  }

  @override
  bool shouldRepaint(covariant MovingLinePainter35 oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.reversed != reversed ||
        oldDelegate.visible != visible;
  }
}

class MovingLinePainter54 extends CustomPainter {
  final List<GlobalKey> boxKeys;
  final double progress;
  final bool visible; // ✅ 新增参数

  MovingLinePainter54(
    this.boxKeys, {
    required this.progress,
    this.visible = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible || boxKeys.length < 5) return; // ✅ 控制显示/隐藏

    final context4 = boxKeys[3].currentContext;
    final context5 = boxKeys[4].currentContext;
    final context3 = boxKeys[2].currentContext;
    final stackBox = boxKeys[0].currentContext
        ?.findAncestorRenderObjectOfType<RenderBox>();

    if (context4 == null ||
        context5 == null ||
        context3 == null ||
        stackBox == null)
      return;

    final box4 = context4.findRenderObject() as RenderBox;
    final box5 = context5.findRenderObject() as RenderBox;
    final box3 = context3.findRenderObject() as RenderBox;

    final start = box5.localToGlobal(
      Offset(box5.size.width / 2, 0),
      ancestor: stackBox,
    );

    final jointY =
        box3.localToGlobal(Offset(0, box3.size.height), ancestor: stackBox).dy +
        40;

    final midPoint = Offset(start.dx, jointY);

    final end = box4.localToGlobal(
      Offset(box4.size.width / 2, 0),
      ancestor: stackBox,
    );
    final endPoint = Offset(end.dx, jointY);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(midPoint.dx, midPoint.dy)
      ..lineTo(endPoint.dx, endPoint.dy)
      ..lineTo(end.dx, end.dy);

    final metric = path.computeMetrics().first;
    final totalLength = metric.length;

    const bulletLength = 8.0;
    final currentOffset = progress * totalLength;
    final halfLength = bulletLength / 2;
    final startOffset = max(0.0, currentOffset - halfLength);
    final endOffset = min(totalLength, currentOffset + halfLength);

    final subPath = metric.extractPath(startOffset, endOffset);

    final paint = Paint()
      ..color = Color(0xFF24B6F3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(subPath, paint);
  }

  @override
  bool shouldRepaint(covariant MovingLinePainter54 oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.visible != visible;
  }
}
