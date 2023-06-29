import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/dtos/employee_request_dto.dart';
import 'package:voleep_carclean_frontend/modules/employee/application/services/employee_service.dart';
import 'package:voleep_carclean_frontend/modules/employee/domain/models/employee_model.dart';
import 'package:voleep_carclean_frontend/shared/enums/disabled_enabled.dart';
import 'package:voleep_carclean_frontend/shared/enums/form_mode.dart';

part 'employee_form_controller.g.dart';

@riverpod
class EmployeeFormController extends _$EmployeeFormController {
  @override
  FutureOr<EmployeeModel?> build(EmployeeId? arg, FormMode mode) async {
    if (arg != null) {
      return await ref.read(employeeServiceProvider).findById(arg);
    }
    return null;
  }

  Future<void> saveOrUpdate({required String name, String? telephone, required DisabledEnabled situation}) async {
    final showProgress = ref.read(isLoadingProvider.notifier);
    showProgress.state = true;
    state = await AsyncValue.guard<EmployeeModel?>(() async {
      final employeeRequestDTO = EmployeeRequestDTO(
        employeeId: state.value?.employeeId,
        name: name,
        telephone: telephone,
        situation: situation,
      );

      final service = ref.read(employeeServiceProvider);

      if (employeeRequestDTO.employeeId != null) {
        return await service.update(employeeRequestDTO);
      }

      return await service.save(employeeRequestDTO);
    });
    showProgress.state = false;
  }
}
