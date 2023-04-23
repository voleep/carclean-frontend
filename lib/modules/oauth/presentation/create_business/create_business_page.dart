import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voleep_carclean_frontend/core/extensions/async_value_ui.dart';
import 'package:voleep_carclean_frontend/modules/oauth/presentation/create_business/providers/create_business_page_controller_provider.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_button.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_text_form_field.dart';

class CreateBusinessPage extends StatelessWidget {
  const CreateBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final businessNameController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CarClean"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          reverse: true,
          child: Container(
            alignment: Alignment.center,
            height: constraints.maxHeight,
            child: Flexible(
              child: IntrinsicHeight(
                child: SafeArea(
                    child: Container(
                  height: constraints.maxHeight,
                  constraints:
                      const BoxConstraints(maxWidth: 400, maxHeight: 700),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                            "assets/illustrations/first_create_business.svg",
                            semanticsLabel: "Startup",
                            height: 235,
                            fit: BoxFit.fitWidth),
                      ),
                      const Spacer(),
                      const Text(
                        "Quase lá!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 35),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Agora vamos precisar do nome da sua empresa para preparar o sistema. Outros dados você poderá adicionar depois",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      const Spacer(),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VoleepTextFormField(
                              controller: businessNameController,
                              placeholder: "Nome da empresa",
                              icon: Icons.business_rounded,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira um Email válido';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Consumer(
                                builder: (context, ref, widget) {
                                  final controller = ref.watch(
                                      createBusinessPageControllerProvider);

                                  ref.listen<AsyncValue<void>>(
                                      createBusinessPageControllerProvider,
                                      (_, state) =>
                                          state.showSnackBarOnError(context));

                                  return VoleepButton(
                                    disabled: controller.isLoading,
                                    child: const Text(
                                      'Finalizar',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        ref
                                            .read(
                                                createBusinessPageControllerProvider
                                                    .notifier)
                                            .createBusiness(
                                              businessName:
                                                  businessNameController.text,
                                            );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ),
        );
      }),
    );
  }
}
