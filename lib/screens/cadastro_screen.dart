import 'package:flutter/material.dart';
import 'package:pro_flutter/screens/login_screen.dart';

class CadastroScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controladores dos campos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Obtém a altura da tela para calcular a posição
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Define o fundo da página como branco
      body: Stack(
        children: [
          // Imagem de fundo posicionada em toda a tela
          Positioned.fill(
            child: Image.asset(
              'assets/images/gatoAzul2.png', // Caminho da imagem de fundo
              fit: BoxFit.cover, // Faz a imagem cobrir todo o espaço disponível
            ),
          ),
          // Formulário posicionado mais para cima na tela
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
          Positioned(
            top: 90, // Ajusta a posição do formulário (em pixels)
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Espaçamento horizontal
                child: Form(
                  key: _formKey, // Associando o formulário à chave global
                  child: Container(
                    padding: const EdgeInsets.all(
                        16.0), // Espaçamento interno do container
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinhamento dos textos à esquerda
                      children: [
                        // Campo "Nome"
                        Text(
                          'Nome',
                          style: TextStyle(fontSize: 18, color: const Color(0xFFFFFFFF)), // Cor do texto
                        ),
                        TextFormField(
                          controller:
                              _nomeController, // Controlador para o campo Nome
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  24), // Borda arredondada de 24px
                            ),
                            hintText: 'Digite seu nome',
                             hintStyle: TextStyle(color: const Color(0xB6FFFFFF)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu nome';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10), // Espaçamento entre os campos

                        // Campo "Email"
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 18, color: Colors.white), // Cor do texto
                        ),
                        TextFormField(
                          controller:
                              _emailController, // Controlador para o campo Email
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  24), // Borda arredondada de 24px
                            ),
                            hintText: 'Digite seu email',
                            hintStyle: TextStyle(color: const Color(0xB6FFFFFF)),
                          ),
                          keyboardType: TextInputType
                              .emailAddress, // Tipo do teclado específico para email
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu email';
                            }
                            // Validação básica de formato de email
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Por favor, insira um email válido';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10), // Espaçamento entre os campos

                        // Campo "Senha"
                        Text(
                          'Senha',
                          style: TextStyle(fontSize: 18, color: Colors.white), // Cor do texto
                          
                        ),
                        TextFormField(
                          controller:
                              _senhaController, // Controlador para o campo Senha
                          obscureText: true, // Oculta o texto para senhas
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  24), // Borda arredondada de 24px
                            ),
                            hintText: 'Digite sua senha',
                             hintStyle: TextStyle(color: const Color(0xB6FFFFFF)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua senha';
                            }
                            if (value.length < 6) {
                              return 'A senha deve ter pelo menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                            height:
                                32), // Espaçamento entre o campo "Senha" e o botão

                        // Texto de login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Já tem conta? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text(
                                "login",
                                style: TextStyle(
                                  color: const Color(0xFF2196F3), // Cor azul para o texto "login"
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height:
                                20), // Espaçamento entre o texto de login e o botão

                        // Botão "Cadastrar"
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Exibir mensagem de sucesso
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Cadastro realizado com sucesso!')),
                                );

                                // Limpar os campos do formulário
                                _nomeController.clear();
                                _emailController.clear();
                                _senhaController.clear();
                              }
                            },
                            child: Text('Cadastrar'), // Texto do botão
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFFBBE),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    24), // Borda arredondada do botão
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
          ),
        ],
      ),
    );
  }
}
