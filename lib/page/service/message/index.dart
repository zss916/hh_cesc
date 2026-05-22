import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/service/device_service.dart';
import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:cescpro/http/api/message.dart';
import 'package:cescpro/http/bean/message_item_entity.dart';
import 'package:cescpro/page/service/message/detail/message_detail_dialog.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

part 'logic.dart';
part 'view.dart';
