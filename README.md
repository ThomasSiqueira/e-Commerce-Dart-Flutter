# Projeto E-commerce

Este repositório contém o código-fonte e informações relacionadas ao projeto de e-commerce desenvolvido pelo grupo composto por João, Thomas e Lucas.

## Integrantes do Grupo
- João Fagundes
- Thomas Siqueira 
- Lucas Raineri

## Descrição do Projeto

O projeto é um e-commerce desenvolvido em Flutter, com as seguintes funcionalidades principais:

- **Autenticação:** Implementação de sistema de login e cadastro com validação de erro. As validações incluem:
  - Verificação de email válido e não duplicado (não é possível cadastro com um email que já está sendo usado por outro usuário).
  - Senha com pelo menos 8 caracteres e pelo menos uma letra maiúscula.
  - Confirmação de senha para evitar erros de digitação.
  
- **Homepage e Categorias:**
  - Exibição de produtos categorizados na homepage.
  - Barra de pesquisa para filtrar produtos.

- **Carrinho de Compras:**
  - Adição e remoção de produtos ao carrinho com confirmação.
  - Cálculo dinâmico do valor total conforme os produtos são adicionados.
  - Visualização do carrinho por meio de um sidemenu.

- **Pedidos e Logout:**
  - Visualização dos pedidos realizados.
  - Opção para logout da conta.

- **Sidemenu:**
  - Permite navegar entre outras páginas, além de fornecer a opção de logout.

## Particularidades e Funcionalidades Faltantes

O projeto atualmente apresenta as funcionalidades principais de um e-commerce, incluindo autenticação, navegação entre categorias, adição e remoção de produtos do carrinho, além da visualização dos pedidos. No entanto, algumas particularidades e funcionalidades podem ser destacadas:

- **Funcionalidades Faltantes:**
  - Finalizar pedido
  - Editar carrinho

## Atividades Desenvolvidas por Cada Membro da Equipe

- **João:**
  - Desenvolvimento do sistema de autenticação (sign-in/sign-up)
  - Implementação da funcionalidade de visualização dos produtos e adicionar ao carrinho
  
- **Thomas:**
  - Desenvolvimento da homepage e categorização dos produtos.
  - Desenvolvimento da página do carrinho
  - Desenvolvimento da configuração dos produtos

- **Lucas:**
  - Implementação da funcionalidade de poder filtrar produtos na homepage (barra de pesquisa)
  - Desenvolvimento da configuração de rotas do sistema
---

## Instruções de Instalação e Execução do Projeto Flutter

Este documento fornece instruções básicas para clonar e executar o projeto Flutter

### Pré-requisitos

- Flutter instalado e configurado

### Clonar o Repositório

```bash
git clone https://github.com/ThomasSiqueira/e-Commerce-Dart-Flutter.git
```

### Obter dependências

```bash
flutter packages get
```

### Rodar projeto

```bash
flutter run
```

Este comando compilará o código-fonte Flutter e iniciará o aplicativo em um dispositivo ou emulador conectado.

**Certifique-se de ter um emulador configurado ou um dispositivo físico conectado para testar o aplicativo Flutter.**
