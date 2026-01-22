import 'dart:async';

import 'package:cescpro/components/blur_widget.dart';
import 'package:cescpro/core/enum/app_enum.dart';
import 'package:cescpro/core/service/device_service.dart';
import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/api/admin.dart';
import 'package:cescpro/http/api/site.dart';
import 'package:cescpro/http/bean/currency_entity.dart';
import 'package:cescpro/http/bean/site_data_entity.dart';
import 'package:cescpro/http/bean/user_info_entity.dart';
import 'package:cescpro/page/alarm/index/index.dart';
import 'package:cescpro/page/home/index.dart';
import 'package:cescpro/page/main/widget/alarm_drawer.dart';
import 'package:cescpro/page/main/widget/station_drawer.dart';
import 'package:cescpro/page/service/index/index.dart';
import 'package:cescpro/page/station/index/index.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

part 'binding.dart';
part 'logic.dart';
part 'view.dart';
