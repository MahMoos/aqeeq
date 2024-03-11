import 'dart:async';
import 'dart:developer';

{{#useAmplifyAuth}}import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';{{/useAmplifyAuth}}
{{#useFirebaseAuth}}import 'package:firebase_core/firebase_core.dart';{{/useFirebaseAuth}}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/design_kit/{{name.snakeCase()}}_theme.dart';
import '../common/router/{{name.snakeCase()}}_router.dart';
import '../core/extensions/extensions.dart';
import '../core/widgets/widgets.dart';
{{#useAmplifyAuth}}import 'amplifyconfiguration.dart';{{/useAmplifyAuth}}
{{#useFirebaseAuth}}import 'firebase_options.dart';{{/useFirebaseAuth}}

part 'bootstrap.dart';
part 'view/app.dart';
