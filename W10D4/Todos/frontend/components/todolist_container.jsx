import { connect } from 'react-redux';
import ToDoList from './todolist';
import {  receiveToDo } from './../actions/todo_actions';
import { allTodos } from './../reducers/selectors'

const mapStateToProps = state => ({

    todos: allTodos(state)

}); 


const mapDispatchToProps = dispatch => ({

    receiveToDo: todo => dispatch(receiveToDo(todo))

}); 

export default connect(mapStateToProps, mapDispatchToProps)(ToDoList);
