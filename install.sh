#!/bin/bash

echo "🚀 Iniciando a instalação dos modelos otimizados (Low-Hallucination)..."

# Encontra todos os arquivos que começam com "Modelfile" (na raiz ou dentro de pastas como ModelsFile/)
find . -type f -name "Modelfile*" | while read -r filepath; do
    
    # Pega apenas o nome do arquivo, ignorando o caminho da pasta
    filename=$(basename "$filepath")
    
    # Pula o arquivo se ele se chamar apenas "Modelfile" genérico
    if [ "$filename" == "Modelfile" ]; then
        continue
    fi

    # Extrai o nome do modelo removendo o prefixo "Modelfile."
    base_name="${filename#Modelfile.}"

    # Verifica se o nome já tem "-smart" no final para evitar duplicidade
    if [[ "$base_name" == *-smart ]]; then
        model_name="$base_name"
    else
        model_name="${base_name}-smart"
    fi

    echo "----------------------------------------"
    echo "⚙️  Processando arquivo: $filepath"
    echo "📦 Criando modelo no Ollama: $model_name"
    
    # Executa a criação no Ollama
    ollama create "$model_name" -f "$filepath"

    # Verifica se o comando anterior deu certo
    if [ $? -eq 0 ]; then
        echo "✅ Sucesso! Modelo '$model_name' pronto para uso."
    else
        echo "❌ Erro ao criar o modelo '$model_name'."
    fi

done

echo "----------------------------------------"
echo "🎉 Instalação concluída! Para ver seus modelos instalados, rode: ollama list"
