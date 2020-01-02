
export const allTodos = (state) => {

    let todoKeyArray = Object.keys(state.todos);
    return todoKeyArray.map((keyId) => state.todos[keyId]);

}

window.allTodos = allTodos;