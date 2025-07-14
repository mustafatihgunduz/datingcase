import 'dart:io';

import 'package:datingcase/core/model/user.dart';
import 'package:datingcase/core/services/auth_service.dart';
import 'package:datingcase/core/services/logger_service.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

class AuthRegisterRequest extends AuthEvent {
  final String email;
  final String password;
  final String name;

  AuthRegisterRequest({
    required this.email,
    required this.password,
    required this.name,
  });
}

class AuthCompleteProfileRequested extends AuthEvent {
  final User user;
  final File? imageFile;
  AuthCompleteProfileRequested({required this.user, this.imageFile});
}

class AuthLogoutRequest extends AuthEvent {
  final String token;

  AuthLogoutRequest({required this.token});
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SecureStorageService storageService;

  AuthBloc({required this.storageService}) : super(AuthInitial()) {
    on<AuthLoginRequested>(_handleLogin);
    on<AuthRegisterRequest>(_handleRegister);
    on<AuthLogoutRequest>(_handleLogout);
    on<AuthCompleteProfileRequested>(_handleCompleteProfile);
  }

  Future<void> _handleLogin(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    CaseLogger.info('AuthBloc: Login request received');
    emit(AuthLoading());
    try {
      final navigationService = NavigationService();
      final user = await login(event.email, event.password);
      if (user.token != null) {
        await storageService.saveToken(user.token!);
        CaseLogger.info('AuthBloc: Token saved securely');
        navigationService.pushReplacement('/home');
      }
      emit(AuthSuccess(user));
    } catch (e, s) {
      CaseLogger.error('AuthBloc: Login failed', e, s);
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _handleRegister(
    AuthRegisterRequest event,
    Emitter<AuthState> emit,
  ) async {
    CaseLogger.info('AuthBloc: Register request received');
    emit(AuthLoading());
    try {
      final navigationService = NavigationService();
      final user = await register(event.email, event.password, event.name);
      if (user.token != null) {
        CaseLogger.info('AuthBloc: Token saved securely');
        navigationService.navigateTo('/userInformation', arguments: user);
      }
      emit(AuthSuccess(user));
    } catch (e, stack) {
      CaseLogger.error('AuthBloc: Register failed', e, stack);
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _handleCompleteProfile(
    AuthCompleteProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    CaseLogger.info('AuthBloc: Profile Completion request received');
    emit(AuthLoading());
    try {
      String? finalPhotoUrl = event.user.photoUrl;

      if (event.imageFile != null) {
        final uploadedUrl = await updatePhoto(event.imageFile!);
        finalPhotoUrl = uploadedUrl;
        CaseLogger.info('AuthBloc: Photo uploaded: $uploadedUrl');
      }

      if (event.user.token != null) {
        await storageService.saveToken(event.user.token!);
        CaseLogger.info('AuthBloc: Token saved securely');
      } else {
        throw Exception('Token not found in user object');
      }
      final updatedUser = event.user.copyWith(photoUrl: finalPhotoUrl);
      emit(AuthSuccess(updatedUser));
    } catch (e, s) {
      CaseLogger.error('AuthBloc: Profile Completion failed', e, s);
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _handleLogout(
    AuthLogoutRequest event,
    Emitter<AuthState> emit,
  ) async {
    CaseLogger.info('AuthBloc: Logout request received');
    emit(AuthLoading());
    try {
      await logout();
      emit(AuthInitial());
    } catch (e, s) {
      CaseLogger.error('AuthBloc: Logout failed', e, s);
      emit(AuthFailure(e.toString()));
    }
  }
}
