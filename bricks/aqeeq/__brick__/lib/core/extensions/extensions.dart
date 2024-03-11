import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

//ignore: depend_on_referenced_packages, implementation_imports
import 'package:riverpod/src/async_notifier.dart';

import '../models/models.dart';
import '../services/http/http_service.dart';

export 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;

{{#useAmplifyAuth}}part 'auth_extensions.dart';{{/useAmplifyAuth}}

part 'build_context_extensions.dart';

part 'color_extensions.dart';

part 'dio_extensions.dart';

part 'riverpod_extensions.dart';

part 'string_extensions.dart';

part 'text_extensions.dart';

part 'time_extensions.dart';

part 'widget_extensions.dart';
