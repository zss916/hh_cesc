import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> get _filters => [
    TKey.allTab.tr,
    TKey.switchTab.tr,
    TKey.adjustTab.tr,
    TKey.stopTab.tr,
  ];
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(start: 12, top: 3, bottom: 3),
        itemCount: _filters.length,
        itemBuilder: (BuildContext context, int index) {
          return UnconstrainedBox(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  gradient: _selectedFilter == index
                      ? const LinearGradient(
                          colors: [Color(0x3372FAFF), Color(0x3372FAFF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: _selectedFilter == index ? null : Color(0x5986A3C1),
                  border: _selectedFilter == index
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF73FBFF), Color(0xFF128DED)],
                          ),
                          width: 1,
                        )
                      : Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _filters[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedFilter == index
                        ? const Color(0xFF72FAFF)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const VerticalDivider(width: 14, color: Colors.transparent),
      ),
    );
  }
}
