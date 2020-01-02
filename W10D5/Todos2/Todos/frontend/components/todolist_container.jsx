import { connect } from 'react-redux';
import ToDoList from './todolist';
import {  receiveToDo, fetchTodos, createTodo } from './../actions/todo_actions';
import { allTodos } from './../reducers/selectors'

const mapStateToProps = state => ({
    todos: allTodos(state)
}); 

const mapDispatchToProps = dispatch => ({

    createTodo: todo => dispatch(createTodo(todo)),
    receiveToDo: todo => dispatch(receiveToDo(todo)),
    fetchTodos: () => dispatch(fetchTodos())

}); 

export default connect(mapStateToProps, mapDispatchToProps)(ToDoList);
