/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the TareasPendientes type in your schema. */
@immutable
class TareasPendientes extends Model {
  static const classType = const _TareasPendientesModelType();
  final String id;
  final String? _name;
  final String? _descripcion;
  final bool? _is_complete;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get descripcion {
    return _descripcion;
  }
  
  bool? get is_complete {
    return _is_complete;
  }
  
  const TareasPendientes._internal({required this.id, name, descripcion, is_complete}): _name = name, _descripcion = descripcion, _is_complete = is_complete;
  
  factory TareasPendientes({String? id, String? name, String? descripcion, bool? is_complete}) {
    return TareasPendientes._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      descripcion: descripcion,
      is_complete: is_complete);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TareasPendientes &&
      id == other.id &&
      _name == other._name &&
      _descripcion == other._descripcion &&
      _is_complete == other._is_complete;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TareasPendientes {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("descripcion=" + "$_descripcion" + ", ");
    buffer.write("is_complete=" + (_is_complete != null ? _is_complete!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TareasPendientes copyWith({String? id, String? name, String? descripcion, bool? is_complete}) {
    return TareasPendientes(
      id: id ?? this.id,
      name: name ?? this.name,
      descripcion: descripcion ?? this.descripcion,
      is_complete: is_complete ?? this.is_complete);
  }
  
  TareasPendientes.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _descripcion = json['descripcion'],
      _is_complete = json['is_complete'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'descripcion': _descripcion, 'is_complete': _is_complete
  };

  static final QueryField ID = QueryField(fieldName: "tareasPendientes.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPCION = QueryField(fieldName: "descripcion");
  static final QueryField IS_COMPLETE = QueryField(fieldName: "is_complete");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TareasPendientes";
    modelSchemaDefinition.pluralName = "TareasPendientes";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TareasPendientes.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TareasPendientes.DESCRIPCION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TareasPendientes.IS_COMPLETE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}

class _TareasPendientesModelType extends ModelType<TareasPendientes> {
  const _TareasPendientesModelType();
  
  @override
  TareasPendientes fromJson(Map<String, dynamic> jsonData) {
    return TareasPendientes.fromJson(jsonData);
  }
}