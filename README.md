# SmartPitch - B2B Sales

## 📌 Visão do Produto
A prospecção ativa no setor B2B, especialmente em ciclos de vendas complexas da indústria de embalagens, exige personalização extrema. O **SmartPitch** é um aplicativo móvel autônomo projetado para otimizar o fluxo de trabalho dos LDRs (Lead Development Representatives). 

O sistema atua como uma ponte analítica: o usuário insere a URL do LinkedIn de um prospecto, o app extrai o histórico profissional via API e, utilizando inteligência artificial generativa, cruza esses dados com o Playbook de Vendas corporativo. O resultado é a geração instantânea de "ganchos" de conversa e e-mails hiperpersonalizados.

## 🎯 Público-Alvo
LDRs e profissionais de pré-vendas que necessitam de escala e agilidade na elaboração de abordagens comerciais, garantindo a manutenção do tom de voz e das regras estratégicas da empresa.

## ⚙️ Arquitetura e Restrições Técnicas
- **Front-end:** Desenvolvido em Flutter e Dart.
- **Back-end & IA:** Arquitetura utilizando Firebase Authentication e Firebase Vertex AI (Gemini 1.5 Flash).
- **Integração Externa:** APIs de terceiros para extração de dados públicos do LinkedIn (compatibilidade total com LGPD via princípio de Legítimo Interesse e não retenção de banco de dados).

---
