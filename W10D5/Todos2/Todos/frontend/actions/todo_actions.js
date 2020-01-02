import * as TodoAPIUtil from './../util/todo_api_util'

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";


export const receiveToDos = todos => ({
    type: RECEIVE_TODOS,
    todos
})

export const receiveToDo = todo => {
    return {
        type: RECEIVE_TODO,
        todo
    }
};


export const fetchTodos = () => dispatch => {
    return TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveToDos(todos)));
}

export const createTodo = todo => dispatch => {
    return TodoAPIUtil.createTodo(todo).then(todo => dispatch(receiveToDo(todo)), (error)=> console.dir(error));
}

// export const removeTodo = todo = ({
//     type: REMOVE_TODO,
//     todo
// })

