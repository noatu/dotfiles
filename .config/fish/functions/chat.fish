function chat --wraps 'ollama run --nowordwrap' --description 'Run an llm without history'
    OLLAMA_NOHISTORY=y ollama run --nowordwrap $argv
end
