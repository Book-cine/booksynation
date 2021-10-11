// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // InjectableConfigGenerator
// // **************************************************************************

// import 'dart:async' as _i9;

// import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
// import 'package:dartz/dartz.dart' as _i10;
// import 'package:firebase_auth/firebase_auth.dart' as _i3;
// import 'package:get_it/get_it.dart' as _i1;
// import 'package:google_sign_in/google_sign_in.dart' as _i14;
// import 'package:injectable/injectable.dart' as _i2;
// import 'package:kt_dart/kt.dart' as _i12;

// import 'application/admin_control/vaccine_actor/bloc/vaccine_actor_bloc.dart'
//     as _i18;
// import 'application/admin_control/vaccine_forms/bloc/vaccine_forms_bloc.dart'
//     as _i20;
// import 'application/admin_control/vaccine_watcher/bloc/vaccine_watcher_bloc.dart'
//     as _i21;
// import 'application/auth/bloc/auth_bloc.dart' as _i24;
// import 'application/auth/sign_in_form/bloc/sign_in_form_bloc.dart' as _i17;
// import 'application/patient_form/form_actor/bloc/form_actor_bloc.dart' as _i5;
// import 'application/patient_form/form_forms/bloc/form_forms_bloc.dart' as _i7;
// import 'application/patient_form/form_watcher/bloc/form_watcher_bloc.dart'
//     as _i8;
// import 'domain/admin_control/i_vaccine_repository.dart' as _i19;
// import 'domain/admin_control/vaccine.dart' as _i23;
// import 'domain/admin_control/vaccine_failure.dart' as _i22;
// import 'domain/auth/i_auth_facade.dart' as _i15;
// import 'domain/patient_form/form.dart' as _i13;
// import 'domain/patient_form/form_failure.dart' as _i11;
// import 'domain/patient_form/i_form_repository.dart' as _i6;
// import 'infrastructure/auth/firebase_auth_facade.dart' as _i16;
// import 'infrastructure/core/firebase_injectable_module.dart'
//     as _i25; // ignore_for_file: unnecessary_lambdas

// // ignore_for_file: lines_longer_than_80_chars
// /// initializes the registration of provided dependencies inside of [GetIt]
// _i1.GetIt $initGetIt(_i1.GetIt get,
//     {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
//   final gh = _i2.GetItHelper(get, environment, environmentFilter);
//   final firebaseInjectableModule = _$FirebaseInjectableModule();
//   gh.lazySingleton<_i3.FirebaseAuth>(
//       () => firebaseInjectableModule.firebaseAuth);
//   gh.lazySingleton<_i4.FirebaseFirestore>(
//       () => firebaseInjectableModule.firestore);
//   gh.factory<_i5.FormActorBloc>(
//       () => _i5.FormActorBloc(get<_i6.IFormRepository>()));
//   gh.factory<_i7.FormFormsBloc>(
//       () => _i7.FormFormsBloc(get<_i6.IFormRepository>()));
//   gh.factory<_i8.FormWatcherBloc>(() => _i8.FormWatcherBloc(
//       get<_i6.IFormRepository>(),
//       get<
//           _i9.StreamSubscription<
//               _i10.Either<_i11.FormFailure, _i12.KtList<_i13.Form>>>>()));
//   gh.lazySingleton<_i14.GoogleSignIn>(
//       () => firebaseInjectableModule.googleSignIn);
//   gh.lazySingleton<_i15.IAuthFacade>(() => _i16.FirebaseAuthFacade(
//       get<_i3.FirebaseAuth>(), get<_i14.GoogleSignIn>()));
//   gh.factory<_i17.SignInFormBloc>(
//       () => _i17.SignInFormBloc(get<_i15.IAuthFacade>()));
//   gh.factory<_i18.VaccineActorBloc>(
//       () => _i18.VaccineActorBloc(get<_i19.IVaccineRepository>()));
//   gh.factory<_i20.VaccineFormsBloc>(
//       () => _i20.VaccineFormsBloc(get<_i19.IVaccineRepository>()));
//   gh.factory<_i21.VaccineWatcherBloc>(() => _i21.VaccineWatcherBloc(
//       get<_i19.IVaccineRepository>(),
//       get<
//           _i9.StreamSubscription<
//               _i10.Either<_i22.VaccineFailure, _i12.KtList<_i23.Vaccine>>>>()));
//   gh.factory<_i24.AuthBloc>(() => _i24.AuthBloc(get<_i15.IAuthFacade>()));
//   return get;
// }

// class _$FirebaseInjectableModule extends _i25.FirebaseInjectableModule {}
