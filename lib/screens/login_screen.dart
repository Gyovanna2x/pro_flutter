import 'package:flutter/material.dart';
import 'package:pro_flutter/screens/cadastro_screen.dart';

// Variáveis globais para armazenar dados cadastrados
String emailCadastrado = 'usuario@exemplo.com'; // Exemplo de email cadastrado
String senhaCadastrada = 'senha123'; // Exemplo de senha cadastrada

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/images/cachorroAzul1.png', // Caminho da imagem
              fit: BoxFit.cover, // Faz a imagem cobrir todo o espaço
            ),
          ),
          Positioned(
            top: 50,
            left: 5,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Voltar à tela anterior
              },
            ),
          ),
          // Conteúdo do formulário mais para baixo
          Align(
            alignment: Alignment.topCenter, // Alinha o conteúdo ao topo
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Ajuste o padding conforme necessário
              child: Form(
                key: _formKey,
                child: SingleChildScrollView( // Para permitir rolagem se necessário
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 90), // Adicionado para empurrar o formulário para baixo
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 18, color: Colors.white), // Cor do texto
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0), // Preenchimento interno
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24), // Borda arredondada
                          ),
                          hintText: 'Digite seu email',
                          hintStyle: TextStyle(color: const Color(0xB6FFFFFF)), // Cor do hint
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Senha',
                        style: TextStyle(fontSize: 18, color: Colors.white), // Cor do texto
                      ),
                      TextFormField(
                        controller: _senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0), // Preenchimento interno
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24), // Borda arredondada
                          ),
                          hintText: 'Digite sua senha',
                          hintStyle: TextStyle(color: const Color(0xB6FFFFFF)), // Cor do hint
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Column(
                          children: [
                            // Outros widgets do formulário...
                            SizedBox(height: 20), // Espaçamento acima
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Não tem conta? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CadastroScreen()),
                                    );
                                  },
                                  child: Text(
                                    "Cadastre-se",
                                    style: TextStyle(
                                      color: Colors.blue, // Cor azul para o texto "Cadastre-se"
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20), // Espaçamento acima do botão
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_emailController.text == emailCadastrado &&
                                  _senhaController.text == senhaCadastrada) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login realizado com sucesso!')),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Email ou senha incorretos')),
                                );
                              }
                            }
                          },
                          child: Text('Entrar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFFBBE),
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24), // Borda arredondada do botão
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
        ],
      ),
    );
  }
}
