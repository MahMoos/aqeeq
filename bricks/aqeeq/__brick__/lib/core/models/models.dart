{{#useAmplifyAuth}}import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';{{/useAmplifyAuth}}
{{#useFirebaseAuth}}import 'package:firebase_auth/firebase_auth.dart' as firebase;{{/useFirebaseAuth}}

import '../extensions/extensions.dart';
import '../services/http/http_service.dart';
import '../services/storage/storage_service.dart';

part 'auth/auth_providers.dart';
part 'auth/user.dart';
part 'data_sources/data_source.dart';
part 'data_sources/local_data_source.dart';
part 'data_sources/remote_data_source.dart';
part 'params/no_params.dart';
part 'params/paginated_params.dart';
part 'params/query_params.dart';
part 'repositories/base_repository.dart';
part 'use_cases/stream_use_case.dart';
part 'use_cases/use_case.dart';
