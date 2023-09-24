import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/clean_architecture/features/main/domain/entities/credits_entity.dart';

abstract class ActorCastState extends Equatable {
  final List<CastEntityDom>? actorsCast;
  final int? id;

  final Exception? error;

  const ActorCastState({this.id, this.actorsCast, this.error});

  @override
  List<Object> get props =>
      [actorsCast ?? [], error ?? Exception('No error Messaje'), id ?? ""];
}

class ActorCastLoading extends ActorCastState {
  const ActorCastLoading();
}

class ActorCastDone extends ActorCastState {
  const ActorCastDone(List<CastEntityDom> actorsCast, int id)
      : super(actorsCast: actorsCast, id: id);
}

class ActorCastError extends ActorCastState {
  const ActorCastError(Exception error) : super(error: error);
}
