import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:voleep_carclean_frontend/shared/widgets/can_deactivate_dialog/can_deactivate_dialog.dart';
import 'package:voleep_carclean_frontend/shared/widgets/scrollable_view/scrollable_view.dart';
import 'package:voleep_carclean_frontend/shared/widgets/voleep_appbar.dart';

class ScaffoldWithForm extends StatefulWidget {
  const ScaffoldWithForm({
    super.key,
    required this.title,
    required this.onSubmit,
    required this.child,
    this.formKey,
    this.onValidate,
  });

  final String title;

  final FutureOr<void> Function() onSubmit;

  final Widget child;

  final GlobalKey<FormState>? formKey;

  final FutureOr<bool> Function()? onValidate;

  @override
  State<ScaffoldWithForm> createState() => _ScaffoldWithFormState();
}

class _ScaffoldWithFormState extends State<ScaffoldWithForm> {
  late GlobalKey<FormState> formKey;
  final isLoadingVN = ValueNotifier(false);

  @override
  void initState() {
    formKey = widget.formKey ?? GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        appBar: VoleepAppBar(
          title: Text(widget.title),
        ),
        body: ScrollableView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              canPop: false,
              onPopInvoked: onPopInvoked,
              child: widget.child,
            ),
          ),
        ),
        floatingActionButton: ValueListenableBuilder(
          valueListenable: isLoadingVN,
          builder: buildActionButton,
        ),
      ),
    );
  }

  Widget buildActionButton(BuildContext context, bool isLoading, Widget? _) {
    return FloatingActionButton.extended(
      onPressed: () async {
        final formState = formKey.currentState!;

        if (isLoading || !formState.validate()) return;

        try {
          isLoadingVN.value = true;

          if (await widget.onValidate?.call() == false) {
            return;
          }

          await widget.onSubmit();
        } finally {
          isLoadingVN.value = false;
        }
      },
      label: const Text("Salvar"),
      icon: Container(
        height: 18,
        width: 18,
        margin: const EdgeInsets.only(right: 5),
        child: isLoading
            ? const CircularProgressIndicator(strokeWidth: 2.0)
            : const Icon(Icons.done_rounded),
      ),
    );
  }

  Future<void> onPopInvoked(bool didPop) async {
    final canPop = await showDialog(
      context: context,
      builder: (context) => const CanDeactivateDialog(),
    );

    if (canPop && context.mounted) {
      context.pop();
    }
  }

  @override
  void dispose() {
    isLoadingVN.dispose();

    super.dispose();
  }
}
