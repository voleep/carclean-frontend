import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/extensions/bool_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/exception_extension.dart';
import 'package:voleep_carclean_frontend/core/extensions/inline_extension.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/core/providers/uuid.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/commands/create_employee_command.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/entities/employee_status.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/states/employee_state.dart';
import 'package:voleep_carclean_frontend/modules/employee/infra/employee_provider.dart';

part 'employee_edit_vm.g.dart';

@riverpod
class EmployeeEditVm extends _$EmployeeEditVm {
  bool get isNew => id == 'new';

  @override
  EmployeeState build(String id) {
    if (!isNew) {
      _loadById();
    }

    return EmployeeState(
      id: ref.read(uuidProvider).v4(),
      name: '',
      registrationDate: DateTime.now(),
      status: EmployeeStatus.enabled,
    );
  }

  changeName(String name) {
    state = state.copyWith(name: name);
  }

  changePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  changeStatus(bool status) {
    final employeeStatus = EmployeeStatus.from(status);
    state = state.copyWith(status: employeeStatus);
  }

  Future<void> save() async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;

    final saveResult = await isNew.ifTrueElse(
      () {
        final command = CreateEmployeeCommand.from(state);
        return ref.read(createEmployeeUseCaseProvider).execute(command);
      },
      () {
        final command = CreateEmployeeCommand.from(state);
        return ref.read(createEmployeeUseCaseProvider).execute(command);
      },
    );

    switch (saveResult) {
      case Failure(:final exception):
        {
          state = state.copyWith(saveFeedback: exception.message);
        }
      default:
    }

    showProgress.state = false;
  }

  _loadById() async {
    final result = await ref.read(getEmployeeByIdUseCaseProvider).execute(id);

    switch (result) {
      case Success(:final value):
        {
          if (value.isNull) {
            state = state.copyWith(getFeedback: "Colaborador não encontrado");
            return;
          }
          state = EmployeeState.from(value!);
        }
      case Failure(:final exception):
        {
          state = state.copyWith(saveFeedback: exception.message);
        }
    }
  }
}
