[Portugues](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/Evitar%20conflitos.md)
|
[English](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/resources/translation/English/Avoid%20conflicts.md)
|
[French](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/resources/translation/French/%C3%89viter%20les%20conflits.md)

Primeiramente, enfrentei dificuldades ao tentar executar o projeto. Por isso, optei em ser a mudança que desejo ver no mundo, criando este documento.
O objetivo deste documento é ajudar os colaboradores a garantir que as dependências sejam atualizadas de maneira eficaz, independentemente da versão do Flutter que você está usando.
Isso é válido não apenas para projetos Flutter; você pode aplicar esse método a outros tipos de projetos, mas os comandos serão diferentes é claro.

# Instruções para Atualização de Dependências:

Para garantir que suas dependências estejam atualizadas, siga os passos a seguir:

Este comando removerá arquivos temporários e caches gerados pelo Flutter no projeto.
```dart
flutter clean
```

Em seguida, utilize o comando:
Isso fará com que o Flutter obtenha novamente as dependências do projeto, garantindo que não haja problemas de cache.
```dart
flutter pub upgrade
```

Após seguir esses passos, você estará pronto para trabalhar no projeto sem se preocupar com conflitos de dependências. 
![Anotação (20)](https://github.com/elisioMassaqui/flutter_carousel_intro-robotgames-v/assets/145590545/32f237f6-1005-4d36-9c93-e91f37f6b463)
