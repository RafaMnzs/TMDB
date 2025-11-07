TMDB 🎬

Este projeto é um aplicativo iOS que consome a API do TMDB (The Movie Database), desenvolvido utilizando Swift e a arquitetura MVVM-C (Model-View-ViewModel-Coordinator).

⸻

🚀 Execução do Projeto

Para executar o projeto:
	1.	Abra o arquivo TMDB.xcodeproj no Xcode.
	2.	Aguarde o Swift Package Manager (SPM) resolver as dependências automaticamente.
	3.	Execute o projeto selecionando o destino desejado (simulador ou dispositivo físico).

⸻

📦 Dependências

As dependências do projeto estão configuradas via Swift Package Manager (SPM):
	•	Kingfisher￼ – v8.6.1
Utilizado para carregamento e cache de imagens.
	•	Realm￼ – v20.0.3
Utilizado para persistência de dados localmente.

⸻

🧩 Arquitetura – MVVM-C

O projeto segue o padrão MVVM-C, que separa responsabilidades e melhora a escalabilidade e testabilidade do código:
	•	Model → Representa as entidades e regras de negócio.
	•	View → Responsável pela interface e exibição de dados.
	•	ViewModel → Faz a ponte entre View e Model, aplicando a lógica de apresentação.
	•	Coordinator → Gerencia o fluxo de telas e a navegação do app.

⸻

🧭 Fluxo da Arquitetura MVVM-C

Abaixo está um diagrama simplificado do fluxo de comunicação entre os componentes da arquitetura MVVM-C:

💡 O diagrama acima é gerado automaticamente a partir de um script Mermaid hospedado via mermaid.ink.

⸻

📁 Estrutura do Projeto

TMDB/
├── Application/
│   ├── AppCoordinator.swift
│   └── SceneDelegate.swift
├── Modules/
│   ├── MovieList/
│   │   ├── View/
│   │   ├── ViewModel/
│   │   └── Model/
│   └── MovieDetail/
│       ├── View/
│       ├── ViewModel/
│       └── Model/
├── Resources/
│   └── Assets.xcassets
└── Utils/
    └── Extensions/


⸻

🧑‍💻 Autor

Desenvolvido por [Rafael Menezes]
📧 [rafael.r.m@outlook.com]
💼 [[LinkedIn](https://www.linkedin.com/in/rafamenezes/)]

⸻

📝 Licença

Este projeto é distribuído sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.