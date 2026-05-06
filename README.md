# 🦙 Ollama Low-Hallucination Models

Este repositório contém uma coleção de `Modelfiles` customizados para o [Ollama](https://ollama.com/), desenvolvidos com um único objetivo central: **reduzir drasticamente as alucinações dos modelos de linguagem locais.**

Modelos padrão frequentemente vêm configurados para priorizar a "criatividade" e fluidez, o que os leva a inventar informações quando não sabem a resposta. Os arquivos presentes neste repositório resolvem esse problema aplicando configurações rigorosas de parâmetros e instruções de sistema, forçando a IA a ser analítica, determinística e estritamente factual.

## 🎯 Por que usar estes Modelfiles?

Se você está usando LLMs para extração de dados, análise de documentos densos ou tarefas onde a precisão é inegociável, um modelo criativo é um risco. 

A arquitetura dos `Modelfiles` deste repositório foca em:
*   **Baixa Temperatura (`temperature 0.0` a `0.2`)**: Remove a aleatoriedade e a "imaginação" das respostas.
*   **Controle de Amostragem (`top_p` e `top_k`)**: Restringe o modelo a escolher apenas as respostas com altíssima probabilidade de estarem corretas, cortando caminhos lógicos incertos.
*   **System Prompts Estritos**: Regras de "ferro" inseridas no core do modelo (ex: *"Se a resposta não estiver no contexto, diga que não sabe. NUNCA invente dados."*).

## 🛠️ Como Utilizar

1. Faça o clone do repositório:
```bash
git clone [https://github.com/JohnHeberty/ollama-models.git](https://github.com/JohnHeberty/ollama-models.git)
cd ollama-models
