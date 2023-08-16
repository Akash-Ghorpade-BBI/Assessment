const data = [
    {
      type: "div",
      children: [
        { type: "h1", children: [{ type: "p" }] },
        { type: "ul", children: [{ type: "li" }, { type: "li" }] },
      ],
    },
  ];
  const output = document.getElementById("output");
  function createElement(type) {
    return document.createElement(type);
  }
  function print(data, output) {
    for (const elementData of data) {
      const element = createElement(elementData.type);
  
      output.appendChild(element);
  
      if (elementData.text) {
        element.textContent = elementData.text;
      }
      
      if (elementData.children) {
        print(elementData.children, element);
      }
    }
  }
  print(data, output);