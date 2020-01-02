import React from 'react';
import ToDoListItem from './todolist_item';
import ToDoForm from './todo_form';

// export default () => <h3>Todo List goes here!</h3>

const ToDoList = (props) => {

    return (
        <div>
            <ul>
                { 
                    props.todos.map((todo) => 

                        <ToDoListItem key={todo.id} todo={todo}/>

                    )
                }
            </ul>
            <br></br>
            <ToDoForm receiveToDo = {props.receiveToDo} />
        </div>
    )

};

export default ToDoList;