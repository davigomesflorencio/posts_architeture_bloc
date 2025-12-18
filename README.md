# architecture_bloc

Este é um projeto **Flutter** desenvolvido com foco em escalabilidade e testabilidade, utilizando o padrão **Clean Architecture** e o pacote **BLoC** para gerenciamento de estado.

## 🚀 Tecnologias e Arquitetura

O projeto está estruturado para separar as responsabilidades em camadas distintas, facilitando a manutenção e a adição de novas funcionalidades.

### Clean Architecture

A aplicação é dividida em camadas principais dentro de cada _feature_:

1.  **Domain (Domínio):** O núcleo da aplicação. Contém as **Entities** (ex: `PostEntity`), **UseCases** e as interfaces dos **Repositories**. Esta camada não depende de nenhuma biblioteca externa ou framework.
2.  **Data (Dados):** Responsável pela recuperação de dados. Contém os **Models** (ex: `PostModel`), implementações dos **Repositories** e **DataSources** (APIs, banco de dados local).
3.  **Presentation (Apresentação):** Responsável pela UI e gerenciamento de estado. Aqui residem os **BLoCs/Cubits**, **Pages** e **Widgets**.

### Gerenciamento de Estado

- **BLoC (Business Logic Component):** Utilizado para separar a lógica de negócios da interface do usuário (UI), baseando-se em eventos e estados.

## 📂 Estrutura do Projeto

A estrutura de pastas segue a organização modular por _features_:

```text
lib/
├── core/                   # Utilitários, erros, configurações globais e injeção de dependência
├── features/               # Funcionalidades do aplicativo
│   └── posts/              # Exemplo de feature: Posts
│       ├── data/           # Camada de Dados
│       │   ├── datasources/# Fontes de dados (API/Local)
│       │   ├── models/     # Modelos de dados (ex: PostModel com fromJson/toJson)
│       │   └── repositories/# Implementação dos repositórios
│       ├── domain/         # Camada de Domínio
│       │   ├── entities/   # Entidades de negócio (ex: PostEntity)
│       │   ├── repositories/# Contratos (interfaces) dos repositórios
│       │   └── usecases/   # Casos de uso da aplicação
│       └── presentation/   # Camada de Apresentação
│           ├── bloc/       # Lógica de estado (Events/States/Bloc)
│           ├── pages/      # Telas da feature
│           └── widgets/    # Componentes visuais específicos
└── main.dart               # Ponto de entrada da aplicação
```

## 🛠️ Principais Bibliotecas

As seguintes bibliotecas são fundamentais para o funcionamento desta arquitetura:

- **flutter_bloc:** Implementação do padrão BLoC para Flutter.
- **equatable:** Simplifica a comparação de objetos, essencial para verificar mudanças de estado no BLoC.
- **get_it:** Service Locator para Injeção de Dependência (DI).
- **dartz:** Programação funcional em Dart (frequentemente usado para tratamento de erros com `Either`).
- **http / dio:** Para realizar requisições HTTP.

## ▶️ Como Executar

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/seu-usuario/architecture_bloc.git
    ```
2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```
3.  **Execute o projeto:**
    ```bash
    flutter run
    ```
