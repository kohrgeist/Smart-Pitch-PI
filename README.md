# SmartPitch - B2B Sales

## 📌 Visão do Produto
A prospecção ativa no setor B2B, especialmente em ciclos de vendas complexas da indústria de embalagens, exige personalização extrema. O **SmartPitch** é um aplicativo móvel autônomo projetado para otimizar o fluxo de trabalho dos LDRs (Lead Development Representatives). 

O sistema atua como uma ponte analítica: o usuário insere a URL do LinkedIn de um prospecto, o app extrai o histórico profissional via API e, utilizando inteligência artificial generativa, cruza esses dados com o Playbook de Vendas corporativo. O resultado é a geração instantânea de "ganchos" de conversa e e-mails hiperpersonalizados.

## 🎯 Público-Alvo
LDRs e profissionais de pré-vendas que necessitam de escala e agilidade na elaboração de abordagens comerciais, garantindo a manutenção do tom de voz e das regras estratégicas da empresa.

## ⚙️ Arquitetura e Restrições Técnicas
- **Front-end:** Desenvolvido em Flutter e Dart.
- **Back-end & IA:** Arquitetura utilizando Firebase Authentication e Firebase Vertex AI (Gemini 3.0-lite).
- **Integração Externa:** APIs de terceiros para extração de dados públicos do LinkedIn e sites (compatibilidade total com LGPD via princípio de Legítimo Interesse e não retenção de banco de dados).

---
## 🚀 Como executar o projeto localmente

### 1. Pré-requisitos
Certifique-se de ter instalado em sua máquina:
- **Flutter SDK** (versão 3.22.0 ou superior).
- Uma IDE de sua preferência (recomendado: VS Code ou Android Studio) com as extensões do Flutter e Dart instaladas.
- Um emulador configurado (Android/iOS) ou um dispositivo físico conectado.

### 2. Configuração
1. Abra a pasta raiz do projeto na sua IDE.
2. Certifique-se de que o arquivo `.env` está presente na raiz do projeto (ele já está incluído no commit e contém as variáveis necessárias como `GEMINI_API_KEY` e `SERPER_API_KEY`).
3. Baixe as dependências do Flutter executando o comando abaixo no terminal:
   ```bash
   flutter pub get
