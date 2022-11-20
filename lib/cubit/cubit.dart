import 'package:bloc/bloc.dart';
import 'package:download/download.dart';
import 'package:facegenerate/cubit/states.dart';
import 'package:facegenerate/models/facemodel.dart';
import 'package:facegenerate/sahred/local/local.dart';
import 'package:facegenerate/sahred/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaceRandomCubit extends Cubit<FaceRandomStates> {
  FaceRandomCubit() : super(FaceRandomInitialState());
  static FaceRandomCubit get(context) => BlocProvider.of(context);
  String toogleGender = "";
  FaceModle? model;
  double min = 0;
  double max = 100;
  TextEditingController minText = TextEditingController();
  TextEditingController maxText = TextEditingController();
  bool toggleMode = false;
  void change({bool? change}) {
    if (change != null) {
      toggleMode = change;
      emit(ToggleModeState());
    } else {
      toggleMode = !toggleMode;
      print(toggleMode);
      Cache.setData(key: "toggle", value: toggleMode);
      emit(ToggleModeState());
    }

    print("the change:$change");
  }

  void downloadPhoto({required String url}) {
    final stream = Stream.fromIterable('Hello World!'.codeUnits);
    download(stream, url);
  }

  void slider({required double mini, required double maxi}) {
    min = mini;
    max = maxi;
    minText.text = "${mini.round()}";
    maxText.text = "${maxi.round()}";
    emit(SliderState());
  }

  bool toggle = false;
  void female() {
    toogleGender = "female";
    toggle = true;
    emit(FemaleState());
  }

  void random() {
    toggle = false;
    toogleGender = "";
    emit(RandomState());
  }

  void male() {
    toogleGender = "male";
    toggle = true;
    emit(MaleState());
  }

  void getData({
    required String gender,
    required dynamic min,
    required dynamic max,
  }) {
    emit(FaceRandomLoadingState());

    DioHelper.getData({
      "gender": toggle ? gender = toogleGender : null,
      "minimum_age": min,
      "maximum_age": max
    }).then((value) {
      model = FaceModle.fromJson(value.data);
      print(model!.gender);

      emit(FaceRandomSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(FaceRandomErrorState(error: onError.toString()));
    });
  }
}
