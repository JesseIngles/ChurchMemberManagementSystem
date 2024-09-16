import 'package:churchdesktop/Model/ministro.model.dart';
import 'package:churchdesktop/Util/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MinistroController {
  List<Ministro>? _ministros = [];
  List<Ministro>? get ministros => _ministros;
  GraphQLClient client = GraphQLConfig.clientToQuery();

  Future<bool> addMinistro(Ministro ministro) async {
    const String mutation = r'''
      mutation createMinistro($id: String!, $dataBaptismoEsp: String!, $membroId: String!, $biografia: String!) {
        createMinistro(input: {
          id: $id,
          dataBaptismoEsp: $dataBaptismoEsp,
          membroId: $membroId,
          biografia: $biografia
        }) {
          id
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {
        'id': ministro.id,
        'dataBaptismoEsp': ministro.dataBaptismoEsp,
        'membroId': ministro.membroId,
        'biografia': ministro.biografia,
      },
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      print(result.exception);
      return false;
    }

    return true;
  }

  Future<List<Ministro>> getAllMinistros() async {
    /*const String query = r'''
    query {
    Ministros {
      dataBaptismoEsp
      biografia
      membro {
        id
        codigoMembro
        nomeCompleto
        fotografia
        phonenumber
        localNascimento
        dataNascimento
        dataBaptismoEsp
        dataBaptismoAguas
        estadoCivil
      }
      }
    }
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print(result.exception);
    //  throw Exception('Erro ao buscar ministros: ${result.exception}');
    }

    // Verifica se 'Ministros' está presente e não é nulo
    final List<dynamic>? ministrosData = result.data?['Ministros'];
    if (ministrosData == null) {
      throw Exception(
          'Erro: Dados de ministros não foram retornados corretamente.');
    }

    _ministros = Ministro.fromJsonList(ministrosData);
    */
    return _ministros!;
  }

  deleteMinistro(String id) {}
}
