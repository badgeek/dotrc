import React from 'react'
import './index.css';
//import styled, { keyframes } from 'styled-components'
//import PropTypes from 'prop-types';

//const AppWrapper = styled.div`
//  text-align: center;
//`

class ___ComponentName___ extends React.Component {

    constructor (props) {
      super(props)
      this.state = { }
    }
    
    render() {
      return <h1 className="h1_banner">Hello, {this.props.name}</h1>;
    }

    // Set default props
    static defaultProps = {
      name: "Budi",
    }    

    // ___ComponentName___.propTypes = {
    //   name: PropTypes.string
    // };

  }

export default ___ComponentName___;