import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/edit_profile_cubit.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Edit your name" from the account settings.
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<SessionCubit>().state.user;
    return BlocProvider(
      create: (_) => EditProfileCubit(sl(), user: user),
      child: const _EditProfileView(),
    );
  }
}

class _EditProfileView extends StatelessWidget {
  const _EditProfileView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listenWhen: (a, b) => a.status != b.status && b.status.isSuccess,
      listener: (context, state) {
        final user = state.updatedUser;
        if (user != null) context.read<SessionCubit>().updateUser(user);
        AppToast.show(context, l10n.profileNameSaved, type: ToastType.success);
        context.pop();
      },
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        return AccountFormScaffold(
          title: l10n.profileEditName,
          subtitle: l10n.profileEditNameSubtitle,
          children: [
            AppTextField(
              initialValue: state.initialFirstName,
              hint: l10n.authFirstNameHint,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.givenName],
              onChanged: cubit.firstNameChanged,
            ),
            const SizedBox(height: 16),
            AppTextField(
              initialValue: state.initialLastName,
              hint: l10n.authLastNameHint,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.familyName],
              errorText: state.failure?.localizedMessage(l10n),
              onChanged: cubit.lastNameChanged,
              onSubmitted: (_) => cubit.submit(),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: l10n.commonSaveChanges,
              isLoading: state.status.isSubmitting,
              onPressed: state.canSubmit ? cubit.submit : null,
            ),
          ],
        );
      },
    );
  }
}
