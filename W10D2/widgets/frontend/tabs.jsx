import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            currentTab: 0,
            tabs: []
        };
        this.setTab = this.setTab.bind(this); 
    }

    componentDidMount() {
        this.setState({
            tabs: [
                {title: 'one', content: 'I am the first'},
                {title: 'two', content: 'Second pane here'},
                {title: 'three', content: 'Third pane here'}
            ]
        });
    }

    setTab(e) {
        console.log(this); 
        const tabsIndex = {
            'one': 0,
            'two': 1,
            'three': 2
        }

        this.setState({ currentTab: tabsIndex[e.currentTarget.innerHTML]
        });
    }


    render () {
        return (
            <div>
                <h1>Tabs</h1>
                <div className="tabs">
                    {
                        <ul className="tabs-list">
                            {
                                this.state.tabs.map( (tab, index) => {
                                    let tabIndex = index;
                                    return (
                                        <li key={index}>
                                            <h4 className='tab-header' onClick={this.setTab}>{tab.title}</h4>
                                            {/* <p className='tab-content'>{tab.content}</p> */}
                                        </li>
                                    );
                                })
                            }
                        </ul>
                    }
                    {
                        <ul className="tabs-content">
                            {
                                <li>
                                    <p className='tab-content'>{this.state.tabs[this.currentTab]}</p>
                                </li>
                            }
                        </ul>
                    }
                </div>
            </div>
        );
    }

}

export default Tabs;