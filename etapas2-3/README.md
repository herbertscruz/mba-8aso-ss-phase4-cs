# Etapa 1 - Solution Sprint

- **Chave:** RM-342971
- **Nome:** Herberts da Silva Cruz Fortuna
- **Turma:** MBA 8ASO
- **Fase:** 4 - Containerization Strategy - De 11/05 até 12/07

## Dependências

- [K6](https://k6.io/docs/getting-started/installation/)

## Instalação

```sh
chmod +x deploy.sh
./deploy.sh
```

## Teste

```sh
k6 run --vus 200 --duration 100s fiap-8aso.js
```
