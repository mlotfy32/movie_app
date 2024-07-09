part of 'get_next_image_cubit.dart';

@immutable
abstract class GetNextImageState {}

class GetNextImageInitial extends GetNextImageState {}

class GetNextImagestate extends GetNextImageState {
  final int index;
  GetNextImagestate({required this.index});
}
