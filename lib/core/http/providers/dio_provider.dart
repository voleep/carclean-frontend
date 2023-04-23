import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;

final dioProvider = Provider<Dio>((ref) => Dio());
