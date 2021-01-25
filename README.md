# Building-a-Linter-RubyCapstone

![microverse](https://camo.githubusercontent.com/3a5835d4f56c57cec85939ac345e43fef164c178/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4d6963726f76657273652d626c756576696f6c6574)


## Description

In the world of programming, while coding and gaining experience, one realizes how important is the correct writing of a code and not only the function of the code itself due to the possible confusions and errors that bad writing can generate, to avoid this, there are tools called "Linters" that detect these errors. In this Microverse course project I have created my own Linter for CSS Files, check it out!


## How to use it

- Download or clone this repository
- Open it into your text editor
- Add your file to the root directory and rename it "style.css"
- Open your ruby terminal and run "Bundle install" to install the gem "Colorize" and avoid errors
- Finally, run "ruby bin/main.rb" and check for possible errors!


## This custom CSSLinter checks for the following errors:

### White Spaces Error

```css
/* Good Coding */

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding */

button,
div  {
  color: red;
  padding: 1rem ;
  font-size: 2rem;
} |
```

### Blank Lines Error

```css
/* Good Coding */

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding */

button,
div {

  color: red;
  padding: 1rem;
  font-size: 2rem;

}
```

### Missing Semicolon Error

```css
/* Good Coding */

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding */

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem  // <--
}
```

### Missing Newline(multiple selectors) Error

```css
/* Good Coding */

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding */

button, div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}
```

### Indentation Error

```css
/* Good Coding */

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding */

button,
  div {
color: red;
padding: 1rem;
font-size: 2rem;
}
```

### Missing Close/Open Error

```css
/* Good Coding */

button,
div {
  color: red;
  padding: 1rem;
  font-size: 2rem;
}

/* Bad Coding */

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
