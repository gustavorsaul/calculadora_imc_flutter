# Calculadora de IMC - Flutter

Este projeto é uma aplicação Flutter simples para calcular o **Índice de Massa Corporal (IMC)** com base no peso e altura do usuário, utilizando sliders para entrada de dados e exibindo a classificação do IMC com cores indicativas.

## Funcionalidades

- Entrada de **peso (kg)** e **altura (m)** via sliders.
- Cálculo automático do IMC ao pressionar o botão.
- Exibição da **classificação** (ex: "Peso normal", "Obesidade grau I") e cor correspondente.
- Layout responsivo com design simples e intuitivo.

## Estrutura

- `MinhaCalculadoraIMC`: Widget principal com lógica de entrada e cálculo.
- `AlertMessage`: Componente exibido quando o IMC ainda não foi calculado.
- `InfoIMC`: Componente que mostra o resultado do cálculo com a cor e classificação.
- `BotaoCalcularImc`: Botão customizado para acionar o cálculo.

## Execução

Para rodar o app:

```bash
flutter pub get
flutter run
