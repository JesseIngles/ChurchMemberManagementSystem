import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Util/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MembroController {
  List<Membro>? _membros = [];
  List<Membro>? get membros => _membros;
  GraphQLClient client = GraphQLConfig.clientToQuery();
  Future<bool> deleteMembro(String id) async {
    const String mutation = r'''
      mutation DeleteMembro($id: String!) {
        deleteMembro(id: $id) {
          id
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {'id': id},
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      print('Erro ao deletar membro: ${result.exception}');
      return false;
    }

    return true;
  }

  Future<bool> addMembro(Membro membro) async {
    const String mutation = r'''
      mutation CreateMembro(
        $codigoMembro: String!,
        $nomeCompleto: String!,
        $fotografia: String!,
        $phonenumber: String!,
        $localNascimento: String!,
        $dataNascimento: String!,
        $dataBaptismoEsp: String!,
        $dataBaptismoAguas: String!,
        $estadoCivil: String!
      ) {
        createMembro(
          createMembroInput: {
            codigoMembro: $codigoMembro,
            nomeCompleto: $nomeCompleto,
            fotografia: $fotografia,
            phonenumber: $phonenumber,
            localNascimento: $localNascimento,
            dataNascimento: $dataNascimento,
            dataBaptismoEsp: $dataBaptismoEsp,
            dataBaptismoAguas: $dataBaptismoAguas,
            estadoCivil: $estadoCivil
          }
        ) {
          id
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {
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
    //print(result.toString());
    if (result.hasException || result.data?['createMembro']['id'] == null) {
      print(result.exception);
      return false;
    }

    return true;
  }

  Future<List<Membro>> getAllMembros() async {
    /*const String query = r'''
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
    
    var membro = Membro(
        id: "id",
        codigoMembro: "codigoMembro",
        nomeCompleto: "nomeCompleto",
        fotografia: "/fotografia",
        phonenumber: "phonenumber",
        localNascimento: "localNascimento",
        dataNascimento: "dataNascimento",
        dataBaptismoEsp: "dataBaptismoEsp",
        dataBaptismoAguas: "dataBaptismoAguas",
        estadoCivil: "estadoCivil");
    _membros?.add(membro);
    */
    return _membros!;
  }

  updateMembro(Membro updatedMembro) {}
}
