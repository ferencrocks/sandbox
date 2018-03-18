import React, { Component } from 'react';
import Screen from './Screen';
import Button from './Button';
import OrangeButton from './OrangeButton';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      operation: null,
      operand: null
    };
  }

  handleNumericButtonClick(value) {
    let operand = this.state.operand;
    if (operand === null) operand = 0;
    this.setState({ operand: operand * 10 + value });
  };

  clear() {
    this.setState({
      result: 0,
      operation: null,
      operand: null
    });
  }

  doOperation(operationSign) {
    const result = this.calculateResult();
    this.setState({
      operation: operationSign,
      operand: null,
      result: result
    });
  }

  plus() {
    this.doOperation('+');
  }

  minus() {
    this.doOperation('-');
  }

  multiply() {
    this.doOperation('*');
  }

  divide() {
    this.doOperation('/')
  }

  equals() {
    this.setState({
      operand: null,
      result: this.calculateResult()
    });
  }

  calculateResult() {
    switch(this.state.operation) {
      case "+":
        return this.state.result + this.state.operand;
      case "-":
        return this.state.result - this.state.operand;
      case "*":
        return this.state.result * this.state.operand;
      case "/":
        return this.state.result / this.state.operand;
      default:
        return this.state.operand;
    }
  }

  renderButtonRange(from, to) {
    const buttons = [];
    for (let i = from; i <= to; i++) {
      buttons.push(
        <Button
          key={i}
          label={i}
          onClick={() => this.handleNumericButtonClick(i)} />
      );
    }
    return buttons;
  }

  render() {
    return (
      <div className="calculator-root">
        <Screen value={this.state.operand === null ? this.state.result : this.state.operand} />

        <div className="buttons">
          <Button label="Clear" threeQuarter={true} onClick={this.clear.bind(this)} />
          <OrangeButton label="/" onClick={this.divide.bind(this)} />
        </div>
        <div className="buttons">
          {this.renderButtonRange(1, 3)}
          <OrangeButton label="*" onClick={this.multiply.bind(this)} />
        </div>
        <div className="buttons">
          {this.renderButtonRange(4, 6)}
          <OrangeButton label="-" onClick={this.minus.bind(this)} />
        </div>
        <div className="buttons">
          {this.renderButtonRange(7, 9)}
          <OrangeButton label="+" onClick={this.plus.bind(this)} />
        </div>
        <div className="buttons">
          <Button
            label={0}
            value={0}
            threeQuarter={true}
            onClick={() => this.handleNumericButtonClick(0)} />
          <OrangeButton label="=" onClick={this.equals.bind(this)} />
        </div>
      </div>
    );
  }
}

export default App;
