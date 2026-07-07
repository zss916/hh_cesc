import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
                  /* int i = _filters.indexWhere((e) => e == _selectedFilter);
                _tabController.animateTo(i);*/
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
                  color: _selectedFilter == index ? null : Color(0x3372FAFF),
                  border: Border.all(
                    color: _selectedFilter == index
                        ? Colors.transparent
                        : Color(0x3372FAFF),
                  ),
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
