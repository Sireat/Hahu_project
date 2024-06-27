import 'package:graphql_flutter/graphql_flutter.dart';

getAllCharachters() => gql(r"""
  query GetCharachters ($page:Int){
    characters (page:$page) {
      info {
        next
      }
      results {
        id
        status
        species
        gender
        image
        type
        name
        location{
          name
        }
      }
    }
  }
""");
String getAllCharacters() {
  return '''
    query GetAllCharacters(\$page: Int) {
      characters(page: \$page) {
        info {
          next
        }
        results {
          id
          name
          status
          species
          type
          gender
          origin {
            name
          }
          location {
            name
          }
          image
        }
      }
    }
  ''';
}
