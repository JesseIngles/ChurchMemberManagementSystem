
import 'package:flutter/material.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';

class EditMember extends StatefulWidget {
  final Membro membro;

  EditMember({required this.membro});

  @override
  _EditMemberState createState() => _EditMemberState();
}

class _EditMemberState extends State<EditMember> {
  final _formKey = GlobalKey<FormState>();
  final _controller = MembroController();

  late String _id;
  late String _codigoMembro;
  late String _nomeCompleto;
  late String _phonenumber;
  late String _localNascimento;
  late String _dataNascimento;
  late String _dataBaptismoEsp;
  late String _dataBaptismoAguas;
  late String _estadoCivil;
  //File? _image;

  @override
  void initState() {
    super.initState();
    _id = widget.membro.id;
    _codigoMembro = widget.membro.codigoMembro;
    _nomeCompleto = widget.membro.nomeCompleto;
    _phonenumber = widget.membro.phonenumber;
    _localNascimento = widget.membro.localNascimento;
    _dataNascimento = widget.membro.dataNascimento;
    _dataBaptismoEsp = widget.membro.dataBaptismoEsp;
    _dataBaptismoAguas = widget.membro.dataBaptismoAguas;
    _estadoCivil = widget.membro.estadoCivil;

    // Load image from network if the member has a valid image URL
    /*if (widget.membro.fotografia.isNotEmpty) {
      _loadImageFromNetwork(widget.membro.fotografia);
    }*/
  }

  // Method to load image from network URL
  /* void _loadImageFromNetwork(String imageUrl) async {
    try {
      var response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Convert response body bytes to File
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/temp_image.jpg');
        await file.writeAsBytes(response.bodyBytes);
        setState(() {
          _image = file;
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('Error loading image: $e');
      // Handle error loading image
    }
  }*/

  // Method to save member details
  Future<void> _saveMember() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Prepare updated member object with or without updated image
      final updatedMembro = Membro(
        id: _id,
        codigoMembro: _codigoMembro,
        nomeCompleto: _nomeCompleto,
        fotografia: widget.membro.fotografia,
        phonenumber: _phonenumber,
        localNascimento: _localNascimento,
        dataNascimento: _dataNascimento,
        dataBaptismoEsp: _dataBaptismoEsp,
        dataBaptismoAguas: _dataBaptismoAguas,
        estadoCivil: _estadoCivil,
      );

      try {
        final success = await _controller.updateMembro(updatedMembro);
        if (success) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Membro atualizado com sucesso')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Falha ao atualizar membro')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar membro: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Membro')),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 3),
                blurRadius: 7,
                spreadRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 350,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Add image picking logic here if needed
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 10, color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(0, 3),
                              blurRadius: 7,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: widget.membro.fotografia.isNotEmpty
                            ? Image.network(
                                "http://localhost:3100${widget.membro.fotografia}",
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.person,
                                color: Colors.amber[700],
                                size: 60,
                              ),
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: _codigoMembro,
                    decoration: InputDecoration(labelText: 'Código do Membro'),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor, insira um código do membro'
                        : null,
                    onSaved: (value) => _codigoMembro = value!,
                  ),
                  TextFormField(
                    initialValue: _nomeCompleto,
                    decoration: InputDecoration(labelText: 'Nome Completo'),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor, insira um nome completo'
                        : null,
                    onSaved: (value) => _nomeCompleto = value!,
                  ),
                  TextFormField(
                    initialValue: _phonenumber,
                    decoration: InputDecoration(labelText: 'Telefone'),
                    validator: (value) =>
                        value!.isEmpty ? 'Por favor, insira um telefone' : null,
                    onSaved: (value) => _phonenumber = value!,
                  ),
                  TextFormField(
                    initialValue: _localNascimento,
                    decoration:
                        InputDecoration(labelText: 'Local de Nascimento'),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor, insira um local de nascimento'
                        : null,
                    onSaved: (value) => _localNascimento = value!,
                  ),
                  TextFormField(
                    initialValue: _dataNascimento,
                    decoration:
                        InputDecoration(labelText: 'Data de Nascimento'),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor, insira uma data de nascimento'
                        : null,
                    onSaved: (value) => _dataNascimento = value!,
                  ),
                  TextFormField(
                    initialValue: _dataBaptismoEsp,
                    decoration: InputDecoration(
                        labelText: 'Data de Batismo Espiritual'),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor, insira uma data de batismo espiritual'
                        : null,
                    onSaved: (value) => _dataBaptismoEsp = value!,
                  ),
                  TextFormField(
                    initialValue: _dataBaptismoAguas,
                    decoration:
                        InputDecoration(labelText: 'Data de Batismo em Águas'),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor, insira uma data de batismo em águas'
                        : null,
                    onSaved: (value) => _dataBaptismoAguas = value!,
                  ),
                  TextFormField(
                    initialValue: _estadoCivil,
                    decoration: InputDecoration(labelText: 'Estado Civil'),
                    validator: (value) => value!.isEmpty
                        ? 'Por favor, insira um estado civil'
                        : null,
                    onSaved: (value) => _estadoCivil = value!,
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: _saveMember,
                    child: Container(
                      width: 450,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
