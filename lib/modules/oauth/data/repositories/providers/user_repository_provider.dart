import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/modules/oauth/data/repositories/user_repository.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());
