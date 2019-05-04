import React from "react"
import PropTypes from "prop-types"
class CastFunction extends React.Component {
	handleClick() {
		var str = this.props.spellFunction;
		eval(str);	
	}
	
  render () {
    return (
      <React.Fragment>
        spell code: {this.props.spellFunction}

		<div className="cast" onClick={() => this.handleClick()}>
			Cast!
		</div>
      </React.Fragment>
    );
  }
}

CastFunction.propTypes = {
  spellFunction: PropTypes.string
};
export default CastFunction
