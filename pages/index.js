import React, {Component} from 'react'
import { Form, Button, Input, Header, Segment, Image} from 'semantic-ui-react'

//Import components 
import Layout from '../components/layout'
import Wallet from '../components/wallet'

import web3 from '../ethereum/web3'

//Import contracts
import dai from "../ethereum/dai"

//import the contract

class Index extends Component{
    state = {
        balance: ""
      };
    
    async componentDidMount() {
    const accounts = await web3.eth.getAccounts();
    const balance = await dai.methods.balanceOf(accounts[0]).call()

    this.setState({
        balance: balance
    });
    }

    render() {
        return (
            <Layout>
                <Wallet balance={this.state.balance}></Wallet>
            </Layout>
        )
    }


}

export default Index