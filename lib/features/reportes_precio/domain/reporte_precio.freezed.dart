// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reporte_precio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportePrecio {

 String get id; String get titulo; String? get descripcion; String get categoria; double get monto; String get moneda; Ubicacion get ubicacion; DateTime get creadoEn; EstadoReporte get estado; List<String> get fotos;
/// Create a copy of ReportePrecio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportePrecioCopyWith<ReportePrecio> get copyWith => _$ReportePrecioCopyWithImpl<ReportePrecio>(this as ReportePrecio, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportePrecio&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.monto, monto) || other.monto == monto)&&(identical(other.moneda, moneda) || other.moneda == moneda)&&(identical(other.ubicacion, ubicacion) || other.ubicacion == ubicacion)&&(identical(other.creadoEn, creadoEn) || other.creadoEn == creadoEn)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other.fotos, fotos));
}


@override
int get hashCode => Object.hash(runtimeType,id,titulo,descripcion,categoria,monto,moneda,ubicacion,creadoEn,estado,const DeepCollectionEquality().hash(fotos));

@override
String toString() {
  return 'ReportePrecio(id: $id, titulo: $titulo, descripcion: $descripcion, categoria: $categoria, monto: $monto, moneda: $moneda, ubicacion: $ubicacion, creadoEn: $creadoEn, estado: $estado, fotos: $fotos)';
}


}

/// @nodoc
abstract mixin class $ReportePrecioCopyWith<$Res>  {
  factory $ReportePrecioCopyWith(ReportePrecio value, $Res Function(ReportePrecio) _then) = _$ReportePrecioCopyWithImpl;
@useResult
$Res call({
 String id, String titulo, String? descripcion, String categoria, double monto, String moneda, Ubicacion ubicacion, DateTime creadoEn, EstadoReporte estado, List<String> fotos
});


$EstadoReporteCopyWith<$Res> get estado;

}
/// @nodoc
class _$ReportePrecioCopyWithImpl<$Res>
    implements $ReportePrecioCopyWith<$Res> {
  _$ReportePrecioCopyWithImpl(this._self, this._then);

  final ReportePrecio _self;
  final $Res Function(ReportePrecio) _then;

/// Create a copy of ReportePrecio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titulo = null,Object? descripcion = freezed,Object? categoria = null,Object? monto = null,Object? moneda = null,Object? ubicacion = null,Object? creadoEn = null,Object? estado = null,Object? fotos = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,monto: null == monto ? _self.monto : monto // ignore: cast_nullable_to_non_nullable
as double,moneda: null == moneda ? _self.moneda : moneda // ignore: cast_nullable_to_non_nullable
as String,ubicacion: null == ubicacion ? _self.ubicacion : ubicacion // ignore: cast_nullable_to_non_nullable
as Ubicacion,creadoEn: null == creadoEn ? _self.creadoEn : creadoEn // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoReporte,fotos: null == fotos ? _self.fotos : fotos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ReportePrecio
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EstadoReporteCopyWith<$Res> get estado {
  
  return $EstadoReporteCopyWith<$Res>(_self.estado, (value) {
    return _then(_self.copyWith(estado: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportePrecio].
extension ReportePrecioPatterns on ReportePrecio {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportePrecio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportePrecio() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportePrecio value)  $default,){
final _that = this;
switch (_that) {
case _ReportePrecio():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportePrecio value)?  $default,){
final _that = this;
switch (_that) {
case _ReportePrecio() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titulo,  String? descripcion,  String categoria,  double monto,  String moneda,  Ubicacion ubicacion,  DateTime creadoEn,  EstadoReporte estado,  List<String> fotos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportePrecio() when $default != null:
return $default(_that.id,_that.titulo,_that.descripcion,_that.categoria,_that.monto,_that.moneda,_that.ubicacion,_that.creadoEn,_that.estado,_that.fotos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titulo,  String? descripcion,  String categoria,  double monto,  String moneda,  Ubicacion ubicacion,  DateTime creadoEn,  EstadoReporte estado,  List<String> fotos)  $default,) {final _that = this;
switch (_that) {
case _ReportePrecio():
return $default(_that.id,_that.titulo,_that.descripcion,_that.categoria,_that.monto,_that.moneda,_that.ubicacion,_that.creadoEn,_that.estado,_that.fotos);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titulo,  String? descripcion,  String categoria,  double monto,  String moneda,  Ubicacion ubicacion,  DateTime creadoEn,  EstadoReporte estado,  List<String> fotos)?  $default,) {final _that = this;
switch (_that) {
case _ReportePrecio() when $default != null:
return $default(_that.id,_that.titulo,_that.descripcion,_that.categoria,_that.monto,_that.moneda,_that.ubicacion,_that.creadoEn,_that.estado,_that.fotos);case _:
  return null;

}
}

}

/// @nodoc


class _ReportePrecio extends ReportePrecio {
  const _ReportePrecio({required this.id, required this.titulo, this.descripcion, required this.categoria, required this.monto, required this.moneda, required this.ubicacion, required this.creadoEn, required this.estado, final  List<String> fotos = const <String>[]}): _fotos = fotos,super._();
  

@override final  String id;
@override final  String titulo;
@override final  String? descripcion;
@override final  String categoria;
@override final  double monto;
@override final  String moneda;
@override final  Ubicacion ubicacion;
@override final  DateTime creadoEn;
@override final  EstadoReporte estado;
 final  List<String> _fotos;
@override@JsonKey() List<String> get fotos {
  if (_fotos is EqualUnmodifiableListView) return _fotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fotos);
}


/// Create a copy of ReportePrecio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportePrecioCopyWith<_ReportePrecio> get copyWith => __$ReportePrecioCopyWithImpl<_ReportePrecio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportePrecio&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.monto, monto) || other.monto == monto)&&(identical(other.moneda, moneda) || other.moneda == moneda)&&(identical(other.ubicacion, ubicacion) || other.ubicacion == ubicacion)&&(identical(other.creadoEn, creadoEn) || other.creadoEn == creadoEn)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other._fotos, _fotos));
}


@override
int get hashCode => Object.hash(runtimeType,id,titulo,descripcion,categoria,monto,moneda,ubicacion,creadoEn,estado,const DeepCollectionEquality().hash(_fotos));

@override
String toString() {
  return 'ReportePrecio(id: $id, titulo: $titulo, descripcion: $descripcion, categoria: $categoria, monto: $monto, moneda: $moneda, ubicacion: $ubicacion, creadoEn: $creadoEn, estado: $estado, fotos: $fotos)';
}


}

/// @nodoc
abstract mixin class _$ReportePrecioCopyWith<$Res> implements $ReportePrecioCopyWith<$Res> {
  factory _$ReportePrecioCopyWith(_ReportePrecio value, $Res Function(_ReportePrecio) _then) = __$ReportePrecioCopyWithImpl;
@override @useResult
$Res call({
 String id, String titulo, String? descripcion, String categoria, double monto, String moneda, Ubicacion ubicacion, DateTime creadoEn, EstadoReporte estado, List<String> fotos
});


@override $EstadoReporteCopyWith<$Res> get estado;

}
/// @nodoc
class __$ReportePrecioCopyWithImpl<$Res>
    implements _$ReportePrecioCopyWith<$Res> {
  __$ReportePrecioCopyWithImpl(this._self, this._then);

  final _ReportePrecio _self;
  final $Res Function(_ReportePrecio) _then;

/// Create a copy of ReportePrecio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titulo = null,Object? descripcion = freezed,Object? categoria = null,Object? monto = null,Object? moneda = null,Object? ubicacion = null,Object? creadoEn = null,Object? estado = null,Object? fotos = null,}) {
  return _then(_ReportePrecio(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as String,monto: null == monto ? _self.monto : monto // ignore: cast_nullable_to_non_nullable
as double,moneda: null == moneda ? _self.moneda : moneda // ignore: cast_nullable_to_non_nullable
as String,ubicacion: null == ubicacion ? _self.ubicacion : ubicacion // ignore: cast_nullable_to_non_nullable
as Ubicacion,creadoEn: null == creadoEn ? _self.creadoEn : creadoEn // ignore: cast_nullable_to_non_nullable
as DateTime,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoReporte,fotos: null == fotos ? _self._fotos : fotos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ReportePrecio
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EstadoReporteCopyWith<$Res> get estado {
  
  return $EstadoReporteCopyWith<$Res>(_self.estado, (value) {
    return _then(_self.copyWith(estado: value));
  });
}
}

// dart format on
