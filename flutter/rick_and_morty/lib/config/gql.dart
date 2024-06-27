import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty/config/api.dart';

final HttpLink link = HttpLink(Api.link);

final gqlProvider = StateProvider(
  (ref) => ValueNotifier(GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  )),
);
