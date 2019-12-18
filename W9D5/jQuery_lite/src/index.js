const DOMNodeCollection = require("./dom_node_collection.js");

window.$l = (arg) => {
    if (arg instanceof HTMLElement){
        // let str = String.from(arg);
        let nodeList = document.querySelectorAll(arg);
        return new DOMNodeCollection(Array.from(nodeList));
        // return new DOMNodeCollection([arg]);
    } else if (typeof arg === 'string') {
        let nodeList = document.querySelectorAll(arg);
        return new DOMNodeCollection(Array.from(nodeList));
    }

}
// window.$l = (arg) => {
//     if (typeof arg === 'string') {
//         let nodeList = document.getElementsByTagName(arg);
//         return nodeList;
//     }

// }


// let div1 = Document.querySelectorAll('#div1')
// console.log(div1);