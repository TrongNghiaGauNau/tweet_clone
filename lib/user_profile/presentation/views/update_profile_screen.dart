import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/core/application/utils.dart';
import 'package:twitter_clone_2/core/presentation/common/common_loading.dart';
import 'package:twitter_clone_2/core/presentation/common/common_text_form_field.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/shared/providers.dart';

class UpdateProfileScreen extends HookConsumerWidget with LoadingMixin {
  const UpdateProfileScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bioController = useTextEditingController(text: user.bio);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final profilePic = useState(user.profilePic);
    final changedProfilePic = useState<File?>(null);
    void onPickImages() async {
      changedProfilePic.value = await pickImage();
    }

    void onResetBtn() {
      changedProfilePic.value = null;
      bioController.text = user.bio;
    }

    void onSubmitBtn() async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      final asyncTask =
          ref.read(userControllerProvider.notifier).updateUserProfile(
                user: user,
                profileFile: changedProfilePic.value,
                bio: bioController.text,
              );

      final res = await doAsyncTask(context, asyncTask: asyncTask);

      res.fold((l) {
        showSnackbar(context, l.messsage);
        debugPrint(l.messsage);
      }, (r) {
        if (context.mounted) {
          showSnackbar(context, 'Updated user information sucessfully');
          ref.read(userControllerProvider.notifier).getUserDetailInfo(r.uid);
          Navigator.of(context).pop();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.blue, blurRadius: 10)
                        ],
                      ),
                      child: changedProfilePic.value == null
                          ? Image.network(
                              profilePic.value == ''
                                  ? defaultAvatar
                                  : profilePic.value,
                              fit: BoxFit.cover)
                          : Image.file(changedProfilePic.value!,
                              fit: BoxFit.cover),
                    ),
                    Positioned(
                        right: 5,
                        bottom: 5,
                        child: GestureDetector(
                          onTap: onPickImages,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              )),
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                ConmmonTextFormField(
                  hintText: user.email,
                  icon: const Icon(Icons.email),
                  enabled: false,
                ),
                const SizedBox(height: 10),
                ConmmonTextFormField(
                  hintText: 'Bio',
                  icon: const Icon(Icons.chat),
                  textEditingController: bioController,
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonFormButton(
                      buttonName: 'Reset',
                      color: Colors.black,
                      backgroundColor: Colors.white,
                      onTap: onResetBtn,
                    ),
                    const SizedBox(width: 10),
                    CommonFormButton(
                      buttonName: 'Submit',
                      backgroundColor: Colors.blue,
                      onTap: onSubmitBtn,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonFormButton extends StatelessWidget {
  const CommonFormButton(
      {super.key,
      required this.buttonName,
      this.onTap,
      this.backgroundColor,
      this.color});

  final String buttonName;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 80,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
