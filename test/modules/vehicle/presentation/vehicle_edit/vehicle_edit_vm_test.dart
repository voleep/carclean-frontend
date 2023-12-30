import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:voleep_carclean_frontend/core/exceptions/repository_exception.dart';
import 'package:voleep_carclean_frontend/core/fp/either.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/models/create_vehicle_model.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/data/repositories/vehicle_repository.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/domain/models/vehicle.dart';
import 'package:voleep_carclean_frontend/modules/vehicle/presentation/vehicle_edit/vehicle_edit_vm.dart';

import '../../../../provider_container.dart';

class MockVehicleRepository extends Mock implements VehicleRepository {}

void main() {
  late ProviderContainer container;
  late MockVehicleRepository mockVehicleRepository;

  setUp(() {
    mockVehicleRepository = MockVehicleRepository();
    container = createContainer(
      overrides: [
        vehicleRepositoryProvider.overrideWithValue(mockVehicleRepository)
      ],
    );
  });

  group('ViewModel: Vehicle Edit Page', () {
    test('Should create a empty vehicle case id is equals to \'new\'',
        () async {
      await expectLater(
        container.read(VehicleEditVmProvider('new').future),
        completion(
          predicate<Vehicle>((vehicle) {
            expect(vehicle.description, '');
            expect(vehicle.licensePlate, '');
            return true;
          }),
        ),
      );
    });

    test('Should get vehicle by ID when id is diff than \'new\'', () async {
      const expectedId = 'vehicle_id';
      const expectedDescription = 'My Car';
      const expectedPlate = '1234-56';
      final expectedYear = DateTime.now().toIso8601String();

      final expectedVehicle = Vehicle(
        vehicleId: expectedId,
        licensePlate: expectedPlate,
        description: expectedDescription,
        modelYear: expectedYear,
      );

      when(() => mockVehicleRepository.findById(expectedId)).thenAnswer(
        (_) async => Success(expectedVehicle),
      );

      await expectLater(
        container.read(VehicleEditVmProvider(expectedId).future),
        completion(
          predicate<Vehicle>((vehicle) {
            expect(vehicle.vehicleId, expectedId);
            expect(vehicle.description, expectedDescription);
            expect(vehicle.licensePlate, expectedPlate);
            expect(vehicle.modelYear, expectedYear);
            return true;
          }),
        ),
      );
    });

    test('Should set error state if had a failure when finding vehicle by ID',
        () async {
      const expectedId = 'my_vehicle_id';

      when(() => mockVehicleRepository.findById(expectedId)).thenAnswer(
        (_) async =>
            Failure(RepositoryException(message: ''), StackTrace.current),
      );

      await expectLater(
        container.read(VehicleEditVmProvider(expectedId).future),
        throwsException,
      );

      final state = container.read(VehicleEditVmProvider(expectedId));

      expect(state.hasError, isTrue);
      expect(state.error, isException);
    });

    test('Should be able to save a vehicle', () async {
      const expectedDescription = 'New Car';
      const expectedPlate = '12345-4';
      final expectedYear = DateTime.now().toIso8601String();

      final vehicleModel = CreateVehicleModel(
        vehicleId: 'some random id',
        description: expectedDescription,
        licensePlate: expectedPlate,
        modelYear: expectedYear,
      );

      registerFallbackValue(vehicleModel);

      when(() => mockVehicleRepository.save(any(), true))
          .thenAnswer((invocation) async {
        final CreateVehicleModel model = invocation.positionalArguments[0];
        return Success(
          Vehicle(
            vehicleId: model.vehicleId!,
            licensePlate: model.licensePlate,
            description: model.description,
            modelYear: model.modelYear,
          ),
        );
      });

      await container.read(VehicleEditVmProvider('new').future);

      await container.read(VehicleEditVmProvider('new').notifier).save(
            description: expectedDescription,
            licensePlate: expectedPlate,
            modelYear: expectedYear,
          );

      final vehicle = container.read(VehicleEditVmProvider('new')).value;

      expect(vehicle, isNotNull);
      expect(vehicle!.description, expectedDescription);
      expect(vehicle!.licensePlate, expectedPlate);
      expect(vehicle!.modelYear, expectedYear);
    });
  });

  test('Should set error state if had a failure when saving a vehicle',
      () async {
    const vehicleModel = CreateVehicleModel(
      vehicleId: 'some id',
      description: 'My car',
      licensePlate: '12345-67',
    );

    registerFallbackValue(vehicleModel);

    when(() => mockVehicleRepository.save(any(), true)).thenAnswer((_) async =>
        Failure(RepositoryException(message: ''), StackTrace.current));

    await container.read(VehicleEditVmProvider('new').future);

    await container.read(VehicleEditVmProvider('new').notifier).save(
          description: vehicleModel.description,
          licensePlate: vehicleModel.licensePlate,
          modelYear: vehicleModel.modelYear,
        );

    final state = container.read(VehicleEditVmProvider('new'));

    expect(state.hasError, isTrue);
    expect(state.error, isException);
  });

  test(
      'Should be able to check if already exists a vehicle with same license plate.',
      () async {
    const expectedPlate = '1234-567';
    const expectedExists = true;

    when(() => mockVehicleRepository.existsByPlate(
          licensePlate: expectedPlate,
          updatingVehicleId: any(named: 'updatingVehicleId'),
        )).thenAnswer((_) async => Success(expectedExists));

    await container.read(VehicleEditVmProvider('new').future);

    expectLater(
      container
          .read(VehicleEditVmProvider('new').notifier)
          .existsByPlate(expectedPlate),
      completion(
        predicate<Success<Exception, bool>>((result) {
          expect(result.value, expectedExists);
          return true;
        }),
      ),
    );
  });
}
