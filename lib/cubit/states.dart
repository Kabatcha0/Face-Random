abstract class FaceRandomStates {}

class FaceRandomInitialState extends FaceRandomStates {}

class FaceRandomSuccessState extends FaceRandomStates {}

class FemaleState extends FaceRandomStates {}

class MaleState extends FaceRandomStates {}

class RandomState extends FaceRandomStates {}

class SliderState extends FaceRandomStates {}

class FaceRandomLoadingState extends FaceRandomStates {}

class ToggleModeState extends FaceRandomStates {}

class FaceRandomErrorState extends FaceRandomStates {
  String? error;
  FaceRandomErrorState({required this.error});
}
