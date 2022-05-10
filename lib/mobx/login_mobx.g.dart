// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginMobx on _LoginMobxStore, Store {
  late final _$usernameControllerAtom =
      Atom(name: '_LoginMobxStore.usernameController', context: context);

  @override
  TextEditingController get usernameController {
    _$usernameControllerAtom.reportRead();
    return super.usernameController;
  }

  @override
  set usernameController(TextEditingController value) {
    _$usernameControllerAtom.reportWrite(value, super.usernameController, () {
      super.usernameController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_LoginMobxStore.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$_LoginMobxStoreActionController =
      ActionController(name: '_LoginMobxStore', context: context);

  @override
  Future<dynamic> login(BuildContext context) {
    final _$actionInfo = _$_LoginMobxStoreActionController.startAction(
        name: '_LoginMobxStore.login');
    try {
      return super.login(context);
    } finally {
      _$_LoginMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usernameController: ${usernameController},
passwordController: ${passwordController}
    ''';
  }
}
