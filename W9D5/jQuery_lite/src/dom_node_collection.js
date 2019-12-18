class DOMNodeCollection{
    constructor(nodes) {
        this.nodes = nodes;
    }

    html (html) {
        if(typeof html === 'string') {
            nodes.forEach(node => {
                node.innerHTML = html;
            });
        } else {
            if(this.nodes.length > 0) {
                return this.nodes[0].innerHTML;
            }
        }       
    }

    empty() {
        this.html('')
    }

    append(content) {
        if (this.nodes.length === 0) {
            return;
        }
        if (typeof content === 'string') {
            nodes.forEach(node => {
                node.innerHTML += content;
            })
        }
    }

}

module.exports = DOMNodeCollection;