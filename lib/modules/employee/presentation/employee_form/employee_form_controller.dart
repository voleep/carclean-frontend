import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/models/create_employee_model.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/repositories/employee_repository.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/typedefs/employee_id.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

part 'employee_form_controller.g.dart';

@riverpod
class EmployeeFormController extends _$EmployeeFormController {
  @override
  AsyncValue<Employee?> build(EmployeeId? arg, FormMode mode) {
    if (arg != null) {
      findById(arg);
    }

    return const AsyncValue.data(null);
  }

  Future<void> findById(EmployeeId employeeId) async {
    final getEmplyeeResult = await ref.read(employeeRepositoryProvider).findById(employeeId);

    state = switch (getEmplyeeResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };
  }

  Future<void> saveOrUpdate({required String name, String? telephone, required DisabledEnabled situation}) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;

    final createEmployeeModel = CreateEmployeeModel(
      employeeId: state.value?.employeeId,
      name: name,
      telephone: telephone,
      situation: situation,
    );

    final saveEmployeeResult = await ref.read(employeeRepositoryProvider).saveOrUpdate(createEmployeeModel);

    state = switch (saveEmployeeResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) => AsyncValue.error(exception, stackTrace)
    };

    showProgress.state = false;
  }
}
