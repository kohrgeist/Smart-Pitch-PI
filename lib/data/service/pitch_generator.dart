import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class PitchService {
  Future<String> gerarPitchIntegrado(
    String linkedinUrl,
    String siteEmpresa,
  ) async {
    final serperKey = dotenv.env['SERPER_API_KEY'];
    final geminiKey = dotenv.env['GEMINI_API_KEY'];

    if (serperKey == null || geminiKey == null) {
      return 'Erro: Chaves não encontradas no .env';
    }

    try {
      // ETAPA 1: LER O LINKEDIN PELO SERPER
      final urlSerper = Uri.parse('https://google.serper.dev/search');
      final responseSerper = await http.post(
        urlSerper,
        headers: {'X-API-KEY': serperKey, 'Content-Type': 'application/json'},
        body: jsonEncode({'q': linkedinUrl, 'num': 1}),
      );

      String dadosLinkedin = "Sem dados do LinkedIn.";
      if (responseSerper.statusCode == 200) {
        final jsonSerper = jsonDecode(responseSerper.body);
        if (jsonSerper['organic'] != null && jsonSerper['organic'].isNotEmpty) {
          dadosLinkedin = jsonSerper['organic'][0]['snippet'] ?? 'Sem resumo.';
        }
      }

      // ETAPA 2: LER O SITE DA EMPRESA (Jina Reader API)
      final urlJina = Uri.parse('https://r.jina.ai/$siteEmpresa');
      final responseJina = await http.get(urlJina);

      String dadosSite = "Não foi possível extrair o site.";
      if (responseJina.statusCode == 200) {
        dadosSite = responseJina.body;
      }

      // ETAPA 3: GERAR O PITCH COM O GEMINI
      final model = GenerativeModel(
        model: 'gemini-3.1-flash-lite-preview',
        apiKey: geminiKey,
      );

      final prompt =
          '''
      [P]ersona:
      Você é um SDR (Sales Development Representative) B2B Sênior e Especialista em Prospecção Outbound, com vasta experiência no setor de suprimentos corporativos e embalagens.

      [A]ção:
      Analise os dados extraídos do LinkedIn do comprador e do site da empresa. Escreva um "cold email" de prospecção altamente personalizado.

      [C]ontexto:
      Represento uma fábrica de caixas de papelão e offset. O objetivo é sondar se há demanda ou cotação em aberto.

      [I]nformação (Inputs):
      - LinkedIn do Comprador: $linkedinUrl
      - Resumo do Perfil LinkedIn: $dadosLinkedin
      - Site da Empresa: $siteEmpresa
      - Conteúdo extraído do Site: $dadosSite

      [F]ormato e Regras (Prompting Constitucional e CoT):
      1. Estrutura de Raciocínio (abrir tag <analise_de_prospeccao>):
      - O que a empresa faz.
      - Qual detalhe do perfil/site será o gancho (Icebreaker).
      2. Restrições Negativas:
      - NUNCA use jargões corporativos.
      - NUNCA passe de 150 palavras.
      - NUNCA inicie falando da minha empresa.
      3. Estrutura do Email:
      - Assunto: 3 opções curtas.
      - Saudação.
      - Linha 1 (Icebreaker).
      - Linha 2 (Ponte + Valor).
      - Linha 3 (CTA Suave de prospecção).
      ''';

      final content = [
        Content.text(prompt),
      ]; // Envia os dados compilados para a IA gerar o texto hiperpersonalizado.
      final responseGemini = await model.generateContent(content);

      return responseGemini.text ?? 'Erro interno: A IA falhou.';
    } catch (e) {
      return 'Erro geral: $e';
    }
  }
}
