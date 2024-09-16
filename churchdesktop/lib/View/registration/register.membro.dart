import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:churchdesktop/Model/membro.model.dart';
import 'package:churchdesktop/Controller/membro.controller.dart';
import 'dart:io';

class RegisterMember extends StatefulWidget {
  @override
  _RegisterMemberState createState() => _RegisterMemberState();
}

class _RegisterMemberState extends State<RegisterMember> {
  final _formKey = GlobalKey<FormState>();
  final _controller = MembroController();

  // Form fields
  String? _codigoMembro;
  String? _nomeCompleto;
  String? _phonenumber;
  String? _localNascimento;
  String? _dataNascimento;
  String? _dataBaptismoEsp;
  String? _dataBaptismoAguas;
  String? _estadoCivil;

  // Image picker
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _saveMember() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      if (_image != null) {
        List<int> imageBytes = await _image!.readAsBytesSync();
        String base64 = 'data:image/png;base64,${base64Encode(imageBytes)}';

        final membro = Membro(
          id: "",
          codigoMembro: _codigoMembro!,
          nomeCompleto: _nomeCompleto!,
          fotografia: base64,
          phonenumber: _phonenumber!,
          localNascimento: _localNascimento!,
          dataNascimento: _dataNascimento!,
          dataBaptismoEsp: _dataBaptismoEsp!,
          dataBaptismoAguas: _dataBaptismoAguas!,
          estadoCivil: _estadoCivil!,
        );

        final success = await _controller.addMembro(membro);
        if (success) {
          Navigator.pop(context);
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add member')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No image selected')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Membro')),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          width: 350,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 10, color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: Offset(0, 3),
                                blurRadius: 7,
                                spreadRadius: 5)
                          ]),
                      child: _image == null
                          ? Icon(
                              Icons.person,
                              color: Colors.amber[700],
                              size: 60,
                            )
                          : ClipOval(child: Image.file(_image!, height: 100,fit: BoxFit.cover)),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Código do Membro'),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter a código do membro'
                        : null,
                    onSaved: (value) => _codigoMembro = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome Completo'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a nome completo' : null,
                    onSaved: (value) => _nomeCompleto = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a phone number' : null,
                    onSaved: (value) => _phonenumber = value,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Local de Nascimento'),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter a local de nascimento'
                        : null,
                    onSaved: (value) => _localNascimento = value,
                  ),

                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Data de Nascimento'),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter a data de nascimento'
                        : null,
                    onSaved: (value) => _dataNascimento = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Data de Baptismo Espiritual'),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter a data de baptismo espiritual'
                        : null,
                    onSaved: (value) => _dataBaptismoEsp = value,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Data de Baptismo em Águas'),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter a data de baptismo em águas'
                        : null,
                    onSaved: (value) => _dataBaptismoAguas = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Estado Civil'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a estado civil' : null,
                    onSaved: (value) => _estadoCivil = value,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      _image == null
                          ? Text('No image selected.')
                          : Text(
                              'Mudar Imagem'), //Image.file(_image!, height: 100),
                      IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: _pickImage,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      _saveMember();
                    },
                    child: Container(
                      width: 450,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber[700],
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
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
