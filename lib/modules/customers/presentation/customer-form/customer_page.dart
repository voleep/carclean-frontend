import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/models/customer_model.dart';
import 'package:voleep_carclean_frontend/modules/customers/domain/typedefs/customer_id.dart';
import 'package:voleep_carclean_frontend/modules/customers/presentation/customer-form/providers/customer_page_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/validators/validators.dart';
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
    ref.listen(customerPageControllerProvider(widget.customerId),
        (previous, next) {
      if (next.hasError) {
        next.showSnackBarOnError(context);
      }

      if (next.hasValue) {
        _setCustomerData(customer: next.value!);
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: VoleepAppBar(
          title: Text(widget.customerId == "new" ? "Novo cliente" : "Cliente"),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 24, top: 12, right: 24, bottom: 24),
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
                              validator: (value) => Validators.listOf([
                                () => Validators.required(value),
                                () => Validators.maxLength(value, 100)
                              ]),
                            ),
                            VoleepTextFormField(
                              controller: _dsDocumentController,
                              placeholder: "CPF ou CNPJ",
                              icon: Icons.badge_outlined,
                              validator: (value) =>
                                  Validators.maxLength(value, 20),
                            ),
                            VoleepTextFormField(
                              controller: _dsTelephoneController,
                              placeholder: "Telefone",
                              icon: Icons.phone_outlined,
                              validator: (value) =>
                                  Validators.maxLength(value, 20),
                            ),
                            VoleepTextFormField(
                              controller: _dsEmailController,
                              placeholder: "Email",
                              icon: Icons.email_outlined,
                              validator: (value) =>
                                  Validators.maxLength(value, 100),
                            ),
                            VoleepTextFormField(
                              controller: _dsNoteController,
                              placeholder: "Observações",
                              icon: Icons.description_outlined,
                              validator: (value) =>
                                  Validators.maxLength(value, 250),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ref
                .read(
                    customerPageControllerProvider(widget.customerId).notifier)
                .saveOrUpdateCustomer(
                  customerId: _idCustomer,
                  name: _dsNameController.text,
                  telephone: _dsTelephoneController.text,
                  email: _dsEmailController.text,
                  document: _dsDocumentController.text,
                  notes: _dsNoteController.text,
                  status: _stCustomer,
                );
          }
        },
        label: const Text("Salvar"),
        icon: const Icon(Icons.done_rounded),
      ),
    );
  }
}
