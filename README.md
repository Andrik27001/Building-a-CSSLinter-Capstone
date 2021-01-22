# Building-a-Linter-RubyCapstone

![microverse](https://camo.githubusercontent.com/3a5835d4f56c57cec85939ac345e43fef164c178/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4d6963726f76657273652d626c756576696f6c6574)


## Description

This is a project from the Microverse course designed to fully understand enumerable methods in Ruby. To achieve this task, this project consists of rebuilding some of these methods on our own, not only to understand them but to prove that there's no magic to it. Hope you enjoy it.

## This custom CSSLinter checks for the following errors:

### White Spaces Check

```css
/* Good Coding

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding

button,
div  {
  color: red;
  padding: 1rem ;
  font-size: 2rem;
} |
```

### Blank Lines Check

```css
/* Good Coding

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding

button,
div {

  color: red;
  padding: 1rem;
  font-size: 2rem;

}
```

### Missing Semicolon Check

```css
/* Good Coding

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem  // <--
}
```

### Missing Newline(multiple selectors) Check

```css
/* Good Coding

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding

button, div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}
```

### Correct Indentation Check

```css
/* Good Coding

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding

button,
  div {
color: red;
padding: 1rem;
font-size: 2rem;
}
```

### Missing Close/Open Bracket

```css
/* Good Coding

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding

button,
div {}
  color: red;
  padding: 1rem;
  font-size: 2rem;
}
```


## Built With

- Ruby
- RSpec
- Rubocop
- Visual Studio Code


## Contributing

Contributions, issues and feature requests are welcome! Start by:

  - Forking the project
  - Cloning the project to your local machine
  - cd into the project directory
  - Run git checkout -b your-branch-name
  - Make your contributions
  - Push your branch up to your forked repository
  - Open a Pull Request with a detailed description to the development branch of the original project for a review


## Author 

👤 **Andrik Solis**
- GitHub: [Andrik27001](https://github.com/Andrik27001)
- Twitter: [@Andrik22693566](https://twitter.com/Andrik22693566)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/andrik-solis-paniagua-a0ab251b5/)


## Show your Support

Give a ⭐ if you like this project!
