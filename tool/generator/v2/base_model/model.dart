import 'reference.dart';
export 'reference.dart';

sealed class TopLevelDeclaration {
  final String name;
  final String documentation;

  TopLevelDeclaration(this.name, {required this.documentation});
}

class Dictionary extends TopLevelDeclaration {
  final List<Property> properties;
  final List<Method> methods;
  final List<Event> events;
  final String? extend;

  Dictionary(
    super.name, {
    required this.properties,
    required this.methods,
    required this.events,
    required super.documentation,
    this.extend,
  });
}

class Property {
  final String name;
  final Reference type;
  final String documentation;

  Property(
    this.name, {
    required this.type,
    required this.documentation,
  });
}

class Event {
  final String name;
  final String documentation;
  final FunctionReference type;

  Event(this.name, {required this.type, required this.documentation});
}

class Method {
  final String name;
  final String documentation;
  final String? deprecated;
  final List<Parameter> parameters;
  final Returns? returns;

  Method(
    this.name, {
    required this.parameters,
    required this.documentation,
    required this.deprecated,
    required this.returns,
  });
}

class Parameter {
  final String name;
  final Reference reference;

  Parameter(this.name, this.reference);
}

sealed class Returns {
  final String? documentation;

  Returns({required this.documentation});
}

class SyncReturns extends Returns {
  final Reference type;

  SyncReturns(this.type, {required super.documentation});
}

class AsyncReturns extends Returns {
  final FunctionReference type;
  final bool supportsPromises;

  AsyncReturns({
    required this.type,
    required this.supportsPromises,
    required super.documentation,
  });
}

class Enumeration extends TopLevelDeclaration {
  final List<EnumerationValue> values;

  Enumeration(super.name, {required super.documentation, required this.values});
}

class EnumerationValue {
  final String name;
  final String documentation;

  EnumerationValue({required this.name, required this.documentation});
}

class Alias extends TopLevelDeclaration {
  final Reference target;

  Alias(
    super.name, {
    required this.target,
    required super.documentation,
  });
}
