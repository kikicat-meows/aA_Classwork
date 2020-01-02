import React from 'react';
import ToDoListItem from './todolist_item';
import ToDoForm from './todo_form';

// export default () => <h3>Todo List goes here!</h3>

class ToDoList extends React.Component {

    constructor(props) {
        super(props);

        this.componentDidMount = this.componentDidMount.bind(this);

    }

    componentDidMount() {
        this.props.fetchTodos();
    }

    render() {

        let { todos, receiveToDo, createTodo } = this.props;

        return (
            <div>
                <ul>
                    {
                        todos.map((todo) =>
                            <ToDoListItem key={todo.id} todo={todo} />

                        )
                    }
                </ul>
                <br></br>
                <ToDoForm receiveToDo={receiveToDo} createTodo={createTodo} />
            </div>
        )

    }

    

};

export default ToDoList;