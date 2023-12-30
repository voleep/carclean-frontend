import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/models/create_employee_model.dart';
import 'package:voleep_carclean_frontend/modules/employee/data/repositories/employee_repository.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';

part 'employee_edit_vm.g.dart';

@riverpod
class EmployeeEditVm extends _$EmployeeEditVm {
  bool get isNew => id == 'new';

  @override
  FutureOr<Employee> build(String id) async {
    if (isNew) {
      return Employee(
        employeeId: const Uuid().v1(),
        name: '',
        registrationDate: DateTime.now(),
        situation: DisabledEnabled.enabled,
      );
    }

    final getResult = await ref.read(employeeRepositoryProvider).findById(id);

    return switch (getResult) {
      Success(:final value) => value,
      Failure(:final exception) => throw exception
    };
  }

  Future<void> save({
    required String name,
    required DisabledEnabled situation,
    String? telephone,
  }) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;

    final createEmployeeModel = CreateEmployeeModel(
      employeeId: state.value?.employeeId,
      name: name,
      telephone: telephone,
      situation: situation,
    );

    final saveResult = await ref
        .read(employeeRepositoryProvider)
        .save(createEmployeeModel, isNew);

    state = switch (saveResult) {
      Success(:final value) => AsyncValue.data(value),
      Failure(:final exception, :final stackTrace) =>
        state.mergeWith(AsyncError(exception, stackTrace))
    };

    showProgress.state = false;
  }
}
