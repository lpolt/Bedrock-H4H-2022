import path_is_absolute from 'path-is-absolute'
import React, {Component} from 'react'
import { Form, Button, Input, Header, Segment, Image} from 'semantic-ui-react'

import web3 from '../ethereum/web3'

import dai from "../ethereum/dai"

const DaiImageLink = 'https://dynamic-assets.coinbase.com/90184cca292578d533bb00d9ee98529b889c15126bb120582309286b9129df9886781b30c85c21ee9cae9f2db6dc11e88633c7361fdd1ba5046ea444e101ae15/asset_icons/ebc24b163bf1f58a9732a9a1d2faa5b2141b041d754ddc2260c5e76edfed261e.png'

class Wallet extends Component {
    state = {
        deposit: ""
    }

    render(){
        return (
            <div style={{marginTop: '50px'}} class="ui raised very padded text container segment">
            <Segment.Group horizontal>
                <Segment>
                    <Header size="huge">Balance</Header>
                    <Header>
                        <Image src={DaiImageLink} size='large' floated="left" verticalAlign='top'/>
                        {/* {this.props.balance} */}
                    </Header>
                </Segment>
                <Segment>
                    <Header size="huge">Deposit</Header>
                    <Header>
                        <Image src={DaiImageLink} size='large' floated="left" verticalAlign='top'/>
                        {this.props.balance}
                    </Header>
                </Segment>
            </Segment.Group>
            <Form onSubmit={this.onSubmit} size="large">
                <Form.Field>
                    <Header style={{marginTop: '75px'}} size="large">Amount Deposited</Header>
                    <Input 
                        size = "large" 
                        label="DAI" 
                        labelPosition="right" 
                        value={this.state.deposit}
                        onChange={event => this.setState({deposit: event.target.value})}
                    ></Input>
                </Form.Field> 
                <Button primary fluid="true" style={{marginTop: '25px'}} size="massive">Deposit</Button>
            </Form>
        </div>
        )
    }
}

export default Wallet