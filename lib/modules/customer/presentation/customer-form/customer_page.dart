import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/core/states/providers/is_loading.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customer/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customer/presentation/customer-form/providers/customer_page_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class CustomersPage extends ConsumerStatefulWidget {
  final CustomerId? customerId;

  const CustomersPage({Key? key, this.customerId}) : super(key: key);
  @override
  ConsumerState<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends ConsumerState<CustomersPage> {
  final _formKey = GlobalKey<FormState>();
  String? _idCustomer;
  int _stCustomer = 1;
  final _dsNameController = TextEditingController();
  final _dsTelephoneController = TextEditingController();
  final _dsEmailController = TextEditingController();
  final _dsDocumentController = TextEditingController();
  final _dsNoteController = TextEditingController();

  _setCustomerData({required CustomerModel customer}) {
    _idCustomer = customer.customerId;
    _dsNameController.text = customer.dsName;
    _dsTelephoneController.text = customer.dsTelephone ?? "";
    _dsEmailController.text = customer.dsEmail ?? "";
    _dsDocumentController.text = customer.dsDocument ?? "";
    _dsNoteController.text = customer.dsNote ?? "";
    _stCustomer = customer.stCustomer;
  }

  late FocusNode _dsNameFocusNode;
  @override
  void initState() {
    super.initState();
    _dsNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _dsNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: VoleepAppBar(
        title: Text(widget.customerId == "new" ? "Novo cliente" : "Cliente"),
      ),
      body: ScrollableView(
        child: Consumer(builder: (context, ref, child) {
          ref.listen(customerPageControllerProvider(widget.customerId), (previous, next) {
            if (next.isLoading) {
              ref.read(isLoadingProvider.notifier).state = true;
            } else {
              ref.read(isLoadingProvider.notifier).state = false;
            }

            if (next.hasError) {
              next.showSnackBarOnError(context);
              context.pop();
            }

            if (next.hasValue) {
              _setCustomerData(customer: next.value!);
            }
          });

          return Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VoleepTextFormField(
                        focusNode: _dsNameFocusNode,
                        controller: _dsNameController,
                        placeholder: "Nome",
                        icon: Icons.person_outline_rounded,
                        validator: (value) => Validators.listOf([() => Validators.required(value), () => Validators.maxLength(value, 100)]),
                      ),
                      VoleepTextFormField(
                        controller: _dsDocumentController,
                        placeholder: "CPF ou CNPJ",
                        icon: Icons.badge_outlined,
                        keyboardType: TextInputType.phone,
                        validator: (value) => Validators.maxLength(value, 20),
                      ),
                      VoleepTextFormField(
                        controller: _dsTelephoneController,
                        placeholder: "Telefone",
                        keyboardType: TextInputType.phone,
                        icon: Icons.phone_outlined,
                        validator: (value) => Validators.maxLength(value, 20),
                      ),
                      VoleepTextFormField(
                        controller: _dsEmailController,
                        placeholder: "Email",
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email_outlined,
                        validator: (value) => Validators.maxLength(value, 100),
                      ),
                      VoleepTextFormField(
                        controller: _dsNoteController,
                        placeholder: "Observações",
                        keyboardType: TextInputType.text,
                        icon: Icons.description_outlined,
                        validator: (value) => Validators.maxLength(value, 250),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            ref.read(isLoadingProvider.notifier).state = true;
            await ref.read(customerPageControllerProvider(widget.customerId).notifier).saveOrUpdateCustomer(
                  customerId: _idCustomer,
                  name: _dsNameController.text,
                  telephone: _dsTelephoneController.text,
                  email: _dsEmailController.text,
                  document: _dsDocumentController.text,
                  notes: _dsNoteController.text,
                  status: _stCustomer,
                );
            if (!ref.read(customerPageControllerProvider(widget.customerId)).hasError && context.mounted) {
              context.pop(true);
            }
          }
        },
        label: const Text("Salvar"),
        icon: const Icon(Icons.done_rounded),
      ),
    );
  }
}
