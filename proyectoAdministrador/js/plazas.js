/*document.addEventListener("DOMContentLoaded", function () {
  const addButton = document.getElementById("add-option");
  const optionsContainer = document.getElementById("options");
  const saveButton = document.querySelector(".question__save-button");
  let optionIndex = 1;

  addButton.addEventListener("click", function () {
    const newOption = createOption(optionIndex);
    optionsContainer.appendChild(newOption);
    optionIndex++;
  });

  function createOption(index) {
    const newOption = document.createElement("div");
    newOption.classList.add("option");

    const input = document.createElement("input");
    input.type = "text";
    input.classList.add("plaza__input");
    input.name = "option[]";
    input.placeholder = "Plaza " + index;

    const removeButton = document.createElement("button");
    removeButton.textContent = "Eliminar";
    removeButton.classList.add("plaza__remove");
    removeButton.addEventListener("click", function () {
      newOption.remove();
      reindexOptions();
    });

    newOption.appendChild(input);
    newOption.appendChild(removeButton);

    return newOption;
  }

  function reindexOptions() {
    const options = document.querySelectorAll(".plaza__input");
    optionIndex = 1; // Reiniciar el índice
    options.forEach((input) => {
      input.placeholder = "Plaza " + optionIndex;
      optionIndex++;
    });
  }
});*/
