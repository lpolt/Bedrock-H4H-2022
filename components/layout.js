import React from 'react'
import { Container, Menu, Button, Image, Header, Icon} from 'semantic-ui-react'

const BedrockImage = "https://creatorlabs.net/wp-content/uploads/2021/05/bedrock.png"

const Layout = (props) => {
    return (
        <Container>
            <link
              async
              rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/semantic-ui@2/dist/semantic.min.css"
            />
            {/* <script src="https://cdn.jsdelivr.net/npm/semantic-ui-react/dist/umd/semantic-ui-react.min.js"></script> */}
            <Menu size="large">
                <Menu.Item>
                        <Header as='h2'>
                            <Icon name='cube' size="big"/>
                            <Header.Content>Bedrock</Header.Content>
                        </Header>
                </Menu.Item>
                <Menu.Item position='right' >
                    <Button>Connect to Wallet</Button>
                </Menu.Item>
            </Menu>
            {props.children}
        </Container>  
    )
}

export default Layout