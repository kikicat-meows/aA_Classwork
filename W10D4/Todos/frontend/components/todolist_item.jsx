import React from 'react'

const ToDoListItem = ({todo}) => {
    let doneText;
    if (todo.done) {
        doneText = "✔︎";
    } else {
        doneText = "⃞";
    };
    return (
        <li>
            <ul>
                <li>
                    {todo.title}
                </li>
                <li>
                    {todo.body}
                </li>
                <li>
                    {doneText}
                </li>
            </ul>
        </li>
    );
}

export default ToDoListItem;