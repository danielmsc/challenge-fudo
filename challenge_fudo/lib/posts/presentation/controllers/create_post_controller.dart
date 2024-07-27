import 'package:challenge_fudo/posts/domain/use_cases/create_post.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  final CreatePost createPostUseCase;
  final formKey = GlobalKey<FormState>();
  final titleTextController = TextEditingController();
  final bodyTextController = TextEditingController();
  final userIdTextController = TextEditingController();

  CreatePostController({required this.createPostUseCase});

  String? validateTitle(String? value) {
    if (value != null) {
      if (value.isNotEmpty && !value.isBlank!) {
        return null;
      }
    }
    return 'El campo es inválido';
  }

  String? validateBody(String? value) {
    if (value != null) {
      if (value.isNotEmpty && !value.isBlank!) {
        return null;
      }
    }
    return 'El campo es inválido';
  }

  String? validateUserId(String? value) {
    final numericRegex = RegExp(r'[0-9]');

    if (value != null) {
      if (value.isNotEmpty && !value.isBlank! && numericRegex.hasMatch(value)) {
        return null;
      }
    }
    return 'El campo es inválido';
  }

  bool validateForm() => formKey.currentState!.validate();

  Future<void> createPost() async {
    final result = await createPostUseCase(
      CreatePostParams(
        title: titleTextController.text,
        body: bodyTextController.text,
        userId: int.parse(userIdTextController.text),
      ),
    );

    result.fold((l) => l.showError(),
        (r) => Fluttertoast.showToast(msg: 'Post creado satisfactoriamente'));
  }

  @override
  void dispose() {
    titleTextController.dispose();
    bodyTextController.dispose();
    userIdTextController.dispose();
    super.dispose();
  }
}
