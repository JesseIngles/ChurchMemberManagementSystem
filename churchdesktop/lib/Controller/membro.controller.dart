import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Util/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MembroController {
  List<Membro>? _membros = [];
  List<Membro>? get membros => _membros;
  GraphQLClient client = GraphQLConfig.clientToQuery();

  Future<bool> addMembro(Membro membro) async {
    const String mutation = r'''
      mutation createMembro($id: String!, $codigoMembro: String!, $nomeCompleto: String!, $fotografia: String!, $phonenumber: String!, $localNascimento: String!, $dataNascimento: String!, $dataBaptismoEsp: String!, $dataBaptismoAguas: String!, $estadoCivil: String!) {
        createMembro(input: {
          codigoMembro: $codigoMembro,
          nomeCompleto: $nomeCompleto,
          fotografia: $fotografia,
          phonenumber: $phonenumber,
          localNascimento: $localNascimento,
          dataNascimento: $dataNascimento,
          dataBaptismoEsp: $dataBaptismoEsp,
          dataBaptismoAguas: $dataBaptismoAguas,
          estadoCivil: $estadoCivil
        }) {
          id
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {
        'id': membro.id,
        'codigoMembro': membro.codigoMembro,
        'nomeCompleto': membro.nomeCompleto,
        'fotografia': membro.fotografia,
        'phonenumber': membro.phonenumber,
        'localNascimento': membro.localNascimento,
        'dataNascimento': membro.dataNascimento,
        'dataBaptismoEsp': membro.dataBaptismoEsp,
        'dataBaptismoAguas': membro.dataBaptismoAguas,
        'estadoCivil': membro.estadoCivil,
      },
    );
    

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      print(result.exception);
      return false;
    }

    return true;
  }

  Future<List<Membro>> getAllMembros() async {
    const String query = r'''
      query {
        findAllMembros {
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
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await client.query(options);
    if (result.hasException) {
      print(result.exception);
      throw result.exception!;
    }

    _membros = Membro.fromJsonList(result.data?['findAllMembros']);
    return _membros!;
  }
}
