// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estado_reporte.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EstadoReporte {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EstadoReporte);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EstadoReporte()';
}


}

/// @nodoc
class $EstadoReporteCopyWith<$Res>  {
$EstadoReporteCopyWith(EstadoReporte _, $Res Function(EstadoReporte) __);
}


/// Adds pattern-matching-related methods to [EstadoReporte].
extension EstadoReportePatterns on EstadoReporte {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Pendiente value)?  pendiente,TResult Function( Verificado value)?  verificado,TResult Function( Alerta value)?  alerta,TResult Function( Descartado value)?  descartado,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Pendiente() when pendiente != null:
return pendiente(_that);case Verificado() when verificado != null:
return verificado(_that);case Alerta() when alerta != null:
return alerta(_that);case Descartado() when descartado != null:
return descartado(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Pendiente value)  pendiente,required TResult Function( Verificado value)  verificado,required TResult Function( Alerta value)  alerta,required TResult Function( Descartado value)  descartado,}){
final _that = this;
switch (_that) {
case Pendiente():
return pendiente(_that);case Verificado():
return verificado(_that);case Alerta():
return alerta(_that);case Descartado():
return descartado(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Pendiente value)?  pendiente,TResult? Function( Verificado value)?  verificado,TResult? Function( Alerta value)?  alerta,TResult? Function( Descartado value)?  descartado,}){
final _that = this;
switch (_that) {
case Pendiente() when pendiente != null:
return pendiente(_that);case Verificado() when verificado != null:
return verificado(_that);case Alerta() when alerta != null:
return alerta(_that);case Descartado() when descartado != null:
return descartado(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@Assert('reportesEnLaZona >= 0', 'la cantidad no puede ser negativa')  int reportesEnLaZona)?  pendiente,TResult Function( double promedio,  double desviacion)?  verificado,TResult Function( double sobrecostoPorcentual,  double montoJusto)?  alerta,TResult Function(@Assert('motivo != ""', 'descartar exige motivo')  String motivo)?  descartado,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Pendiente() when pendiente != null:
return pendiente(_that.reportesEnLaZona);case Verificado() when verificado != null:
return verificado(_that.promedio,_that.desviacion);case Alerta() when alerta != null:
return alerta(_that.sobrecostoPorcentual,_that.montoJusto);case Descartado() when descartado != null:
return descartado(_that.motivo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@Assert('reportesEnLaZona >= 0', 'la cantidad no puede ser negativa')  int reportesEnLaZona)  pendiente,required TResult Function( double promedio,  double desviacion)  verificado,required TResult Function( double sobrecostoPorcentual,  double montoJusto)  alerta,required TResult Function(@Assert('motivo != ""', 'descartar exige motivo')  String motivo)  descartado,}) {final _that = this;
switch (_that) {
case Pendiente():
return pendiente(_that.reportesEnLaZona);case Verificado():
return verificado(_that.promedio,_that.desviacion);case Alerta():
return alerta(_that.sobrecostoPorcentual,_that.montoJusto);case Descartado():
return descartado(_that.motivo);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@Assert('reportesEnLaZona >= 0', 'la cantidad no puede ser negativa')  int reportesEnLaZona)?  pendiente,TResult? Function( double promedio,  double desviacion)?  verificado,TResult? Function( double sobrecostoPorcentual,  double montoJusto)?  alerta,TResult? Function(@Assert('motivo != ""', 'descartar exige motivo')  String motivo)?  descartado,}) {final _that = this;
switch (_that) {
case Pendiente() when pendiente != null:
return pendiente(_that.reportesEnLaZona);case Verificado() when verificado != null:
return verificado(_that.promedio,_that.desviacion);case Alerta() when alerta != null:
return alerta(_that.sobrecostoPorcentual,_that.montoJusto);case Descartado() when descartado != null:
return descartado(_that.motivo);case _:
  return null;

}
}

}

/// @nodoc


class Pendiente extends EstadoReporte {
  const Pendiente(@Assert('reportesEnLaZona >= 0', 'la cantidad no puede ser negativa') this.reportesEnLaZona): super._();
  

@Assert('reportesEnLaZona >= 0', 'la cantidad no puede ser negativa') final  int reportesEnLaZona;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendienteCopyWith<Pendiente> get copyWith => _$PendienteCopyWithImpl<Pendiente>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pendiente&&(identical(other.reportesEnLaZona, reportesEnLaZona) || other.reportesEnLaZona == reportesEnLaZona));
}


@override
int get hashCode => Object.hash(runtimeType,reportesEnLaZona);

@override
String toString() {
  return 'EstadoReporte.pendiente(reportesEnLaZona: $reportesEnLaZona)';
}


}

/// @nodoc
abstract mixin class $PendienteCopyWith<$Res> implements $EstadoReporteCopyWith<$Res> {
  factory $PendienteCopyWith(Pendiente value, $Res Function(Pendiente) _then) = _$PendienteCopyWithImpl;
@useResult
$Res call({
@Assert('reportesEnLaZona >= 0', 'la cantidad no puede ser negativa') int reportesEnLaZona
});




}
/// @nodoc
class _$PendienteCopyWithImpl<$Res>
    implements $PendienteCopyWith<$Res> {
  _$PendienteCopyWithImpl(this._self, this._then);

  final Pendiente _self;
  final $Res Function(Pendiente) _then;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reportesEnLaZona = null,}) {
  return _then(Pendiente(
null == reportesEnLaZona ? _self.reportesEnLaZona : reportesEnLaZona // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Verificado extends EstadoReporte {
  const Verificado(this.promedio, this.desviacion): super._();
  

 final  double promedio;
 final  double desviacion;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificadoCopyWith<Verificado> get copyWith => _$VerificadoCopyWithImpl<Verificado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Verificado&&(identical(other.promedio, promedio) || other.promedio == promedio)&&(identical(other.desviacion, desviacion) || other.desviacion == desviacion));
}


@override
int get hashCode => Object.hash(runtimeType,promedio,desviacion);

@override
String toString() {
  return 'EstadoReporte.verificado(promedio: $promedio, desviacion: $desviacion)';
}


}

/// @nodoc
abstract mixin class $VerificadoCopyWith<$Res> implements $EstadoReporteCopyWith<$Res> {
  factory $VerificadoCopyWith(Verificado value, $Res Function(Verificado) _then) = _$VerificadoCopyWithImpl;
@useResult
$Res call({
 double promedio, double desviacion
});




}
/// @nodoc
class _$VerificadoCopyWithImpl<$Res>
    implements $VerificadoCopyWith<$Res> {
  _$VerificadoCopyWithImpl(this._self, this._then);

  final Verificado _self;
  final $Res Function(Verificado) _then;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? promedio = null,Object? desviacion = null,}) {
  return _then(Verificado(
null == promedio ? _self.promedio : promedio // ignore: cast_nullable_to_non_nullable
as double,null == desviacion ? _self.desviacion : desviacion // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class Alerta extends EstadoReporte {
  const Alerta(this.sobrecostoPorcentual, this.montoJusto): super._();
  

 final  double sobrecostoPorcentual;
 final  double montoJusto;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertaCopyWith<Alerta> get copyWith => _$AlertaCopyWithImpl<Alerta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Alerta&&(identical(other.sobrecostoPorcentual, sobrecostoPorcentual) || other.sobrecostoPorcentual == sobrecostoPorcentual)&&(identical(other.montoJusto, montoJusto) || other.montoJusto == montoJusto));
}


@override
int get hashCode => Object.hash(runtimeType,sobrecostoPorcentual,montoJusto);

@override
String toString() {
  return 'EstadoReporte.alerta(sobrecostoPorcentual: $sobrecostoPorcentual, montoJusto: $montoJusto)';
}


}

/// @nodoc
abstract mixin class $AlertaCopyWith<$Res> implements $EstadoReporteCopyWith<$Res> {
  factory $AlertaCopyWith(Alerta value, $Res Function(Alerta) _then) = _$AlertaCopyWithImpl;
@useResult
$Res call({
 double sobrecostoPorcentual, double montoJusto
});




}
/// @nodoc
class _$AlertaCopyWithImpl<$Res>
    implements $AlertaCopyWith<$Res> {
  _$AlertaCopyWithImpl(this._self, this._then);

  final Alerta _self;
  final $Res Function(Alerta) _then;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sobrecostoPorcentual = null,Object? montoJusto = null,}) {
  return _then(Alerta(
null == sobrecostoPorcentual ? _self.sobrecostoPorcentual : sobrecostoPorcentual // ignore: cast_nullable_to_non_nullable
as double,null == montoJusto ? _self.montoJusto : montoJusto // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class Descartado extends EstadoReporte {
  const Descartado(@Assert('motivo != ""', 'descartar exige motivo') this.motivo): super._();
  

@Assert('motivo != ""', 'descartar exige motivo') final  String motivo;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DescartadoCopyWith<Descartado> get copyWith => _$DescartadoCopyWithImpl<Descartado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Descartado&&(identical(other.motivo, motivo) || other.motivo == motivo));
}


@override
int get hashCode => Object.hash(runtimeType,motivo);

@override
String toString() {
  return 'EstadoReporte.descartado(motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class $DescartadoCopyWith<$Res> implements $EstadoReporteCopyWith<$Res> {
  factory $DescartadoCopyWith(Descartado value, $Res Function(Descartado) _then) = _$DescartadoCopyWithImpl;
@useResult
$Res call({
@Assert('motivo != ""', 'descartar exige motivo') String motivo
});




}
/// @nodoc
class _$DescartadoCopyWithImpl<$Res>
    implements $DescartadoCopyWith<$Res> {
  _$DescartadoCopyWithImpl(this._self, this._then);

  final Descartado _self;
  final $Res Function(Descartado) _then;

/// Create a copy of EstadoReporte
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? motivo = null,}) {
  return _then(Descartado(
null == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
